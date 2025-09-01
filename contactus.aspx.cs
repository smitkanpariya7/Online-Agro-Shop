using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace SK_AGRO
{
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlMessage.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Save to database (example using your existing connection string)
                    string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SKAGROConnectionString"].ConnectionString;

                    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(connectionString))
                    {
                        string query = @"INSERT INTO Feedback (name, u_email, u_mobile, message) 
                                       VALUES (@Name, @Email, @Mobile, @Message)";

                        using (System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                            cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());
                            

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

               

                    // Show success message
                    pnlMessage.Visible = true;
                    lblMessage.Text = "Thank you for your message! We'll get back to you soon.";
                    pnlMessage.CssClass = "status-success";

                    // Call JavaScript function to animate the message
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccess", "showSuccessMessage('Thank you! Your message has been sent successfully.');", true);
                }
                catch (Exception ex)
                {
                    // Log error
                    System.Diagnostics.Trace.TraceError("Contact form error: " + ex.Message);

                    // Show error message
                    pnlMessage.Visible = true;
                    lblMessage.Text = "Sorry, there was an error submitting your message. Please try again later.";
                    pnlMessage.CssClass = "status-error";

                    // Call JavaScript function to animate the message
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowError", "showErrorMessage('Error: " + ex.Message.Replace("'", "") + "');", true);
                }
            }
        }
    }
}