<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="SK_AGRO.admin.forgot_password" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Reset Password - SK AGRO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        /* Same styling as your login page */
        :root {
            --primary-color: #00b09b;
            --secondary-color: #96c93d;
            --dark-color: #2c3e50;
            --light-color: #f8f9fa;
            --danger-color: #e74c3c;
            --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }
        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('../images/agriculture-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            overflow: hidden;
            margin: 0;
            padding: 20px;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }
        .login-container { position: relative; z-index: 2; max-width: 450px; width: 100%; }
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            padding: 40px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: var(--transition);
        }
        .login-card:hover { transform: translateY(-5px); box-shadow: 0 20px 40px rgba(0,0,0,0.3); }
        .logo-container { text-align: center; margin-bottom: 30px; }
        .logo {
            width: 100px; height: 100px; border-radius: 50%;
            border: 3px solid var(--primary-color); background: white;
        }
        .login-title { text-align: center; font-weight: 700; margin-bottom: 30px; color: var(--dark-color); }
        .form-group { position: relative; margin-bottom: 20px; }
        .form-group i { position: absolute; top: 50%; left: 20px; transform: translateY(-50%); color: var(--primary-color); }
        .form-control { padding-left: 50px; height: 50px; border-radius: 30px; border: 2px solid #e1e1e1; }
        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none; border-radius: 30px; padding: 12px; color: white; font-weight: 600; width: 100%;
        }
        .btn-login:hover { background: linear-gradient(135deg, var(--secondary-color), var(--primary-color)); }
        .message-container { text-align: center; margin-top: 20px; }
        .message { display: inline-block; padding: 10px 20px; border-radius: 30px; font-weight: 500; }
        .error-message { background: rgba(231,76,60,0.1); color: var(--danger-color); }
        .success-message { background: rgba(46,204,113,0.1); color: #27ae60; }
        .back-to-login { text-align: center; margin-top: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-card">
                <div class="logo-container">
                    <img src="../images/logo3.jpg" alt="SK AGRO Logo" class="logo floating" />
                </div>
                <h2 class="login-title">RESET PASSWORD</h2>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="New password is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="Please confirm password" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtNewPass" ErrorMessage="Passwords do not match" CssClass="validation-error" Display="Dynamic"></asp:CompareValidator>
                </div>

                <asp:Button ID="btnReset" runat="server" Text="UPDATE PASSWORD" CssClass="btn btn-login" OnClick="btnReset_Click" />

                <div class="message-container">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                </div>

                <div class="back-to-login">
                    <a href="login.aspx"><i class="fas fa-arrow-left"></i> Back to Login</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
