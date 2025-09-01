<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SK_AGRO.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>User Login - SK AGRO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #ff8c00;
            --secondary-color: #ffa500;
            --dark-color: #2c3e50;
            --light-color: #f8f9fa;
            --danger-color: #e74c3c;
            --transition: all 0.4s ease;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #333;
            background-size: cover;
            background-position: center;
            overflow: hidden;
            position: relative;
            margin: 0;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.5);
            z-index: 1;
        }

        .login-container {
            position: relative;
            z-index: 2;
            max-width: 420px;
            width: 100%;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            padding: 40px;
            backdrop-filter: blur(8px);
        }

        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            border: 3px solid var(--primary-color);
            padding: 5px;
            background: white;
        }

        .login-title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--dark-color);
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            color: var(--primary-color);
            transition: var(--transition);
        }

        .form-control {
            padding-left: 50px;
            height: 50px;
            border-radius: 30px;
            border: 2px solid #ddd;
            font-size: 15px;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 140, 0, 0.25);
        }

        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 30px;
            padding: 12px;
            color: white;
            font-weight: 600;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(255, 140, 0, 0.4);
            transition: var(--transition);
        }

        .btn-login:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-3px);
        }

        .validation-error {
            color: var(--danger-color);
            font-size: 0.85rem;
            margin-top: 5px;
            display: block;
            padding-left: 15px;
        }

        .forgot-password {
            text-align: right;
            margin-top: -10px;
            margin-bottom: 20px;
        }

        .forgot-password a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: var(--danger-color);
        }

        @media (max-width: 576px) {
            .login-card { padding: 30px 20px; }
            .logo { width: 70px; height: 70px; }
            .form-control { height: 45px; padding-left: 45px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-card">
                <div class="logo-container">
                    <img src="../images/logo3.jpg" alt="SK AGRO Logo" class="logo" />
                </div>
                <h2 class="login-title">USER LOGIN</h2>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Enter a valid email address"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="forgot-password">
                    <asp:HyperLink ID="lnkForgot" runat="server" NavigateUrl="~/forget_password.aspx">Forgot Password?</asp:HyperLink>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-login" OnClick="btnLogin_Click" />

                <div class="register-link">
                    <span>Don't have an account? </span>
                    <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/register.aspx">Register Now</asp:HyperLink>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            </div>
        </div>
    </form>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Set background image dynamically
        document.body.style.backgroundImage = "url('../images/agriculture-bg.jpg')";

        // Icon color on focus
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', () => {
                input.previousElementSibling.style.color = '#ffa500';
            });
            input.addEventListener('blur', () => {
                input.previousElementSibling.style.color = '#ff8c00';
            });
        });
    </script>
</body>
</html>
