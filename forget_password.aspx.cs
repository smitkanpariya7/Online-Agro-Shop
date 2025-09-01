using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace SK_AGRO
{
    public partial class forgot_password : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e) { }

        // STEP 1: Send OTP
        protected void btnSendOtp_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            // Check if email exists in DB
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM user_login WHERE u_email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();

            if (count == 0)
            {
                lblMessage.Text = "Email not registered!";
                return;
            }

            // Generate OTP
            Random rnd = new Random();
            int otp = rnd.Next(100000, 999999);
            Session["OTP"] = otp;
            Session["Email"] = email;

            // Send Email
            try
            {
                MailMessage mm = new MailMessage("yourEmail@gmail.com", email);
                mm.Subject = "Password Reset OTP - SK AGRO";
                mm.Body = "Your OTP is: " + otp + "\n\nThis OTP is valid for 5 minutes.";
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential("yourEmail@gmail.com", "your16DigitAppPassword");
                smtp.EnableSsl = true;
                smtp.Send(mm);


                lblMessage.CssClass = "text-success fw-bold";
                lblMessage.Text = "OTP sent to your email!";
                MultiView1.ActiveViewIndex = 1; // Go to OTP step
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error sending email: " + ex.Message;
            }
        }

        // STEP 2: Verify OTP
        protected void btnVerifyOtp_Click(object sender, EventArgs e)
        {
            if (Session["OTP"] == null)
            {
                lblMessage.Text = "OTP expired. Please try again.";
                return;
            }

            if (txtOtp.Text.Trim() == Session["OTP"].ToString())
            {
                MultiView1.ActiveViewIndex = 2; // Go to Reset Password step
                lblMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "Invalid OTP!";
            }
        }

        // STEP 3: Reset Password
        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text != txtConfirmPass.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            string email = Session["Email"].ToString();

            SqlCommand cmd = new SqlCommand("UPDATE user_login SET u_pass=@Pass WHERE u_email=@Email", con);
            cmd.Parameters.AddWithValue("@Pass", txtNewPass.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.CssClass = "text-success fw-bold";
            lblMessage.Text = "Password reset successfully!";
            Session.Clear();
            MultiView1.ActiveViewIndex = 0;
        }
    }
}
