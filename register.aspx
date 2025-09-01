<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="SK_AGRO.register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>User Register - SK AGRO</title>
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

        .register-container {
            position: relative;
            z-index: 2;
            max-width: 480px;
            width: 100%;
        }

        .register-card {
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

        .register-title {
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

        .btn-register {
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

        .btn-register:hover {
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

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9rem;
        }

        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: var(--danger-color);
        }

        @media (max-width: 576px) {
            .register-card { padding: 30px 20px; }
            .logo { width: 70px; height: 70px; }
            .form-control { height: 45px; padding-left: 45px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <div class="register-card">
                <div class="logo-container">
                    <img src="../images/logo3.jpg" alt="SK AGRO Logo" class="logo" />
                </div>
                <h2 class="register-title">USER REGISTER</h2>

                <div class="form-group">
                    <i class="fas fa-user"></i>
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtname"
                        ErrorMessage="Name is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revName" runat="server"
                        ControlToValidate="txtname"
                        ValidationExpression="^[A-Za-z ]+$"
                        ErrorMessage="Enter a valid name"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtemail"
                        ErrorMessage="Email is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtemail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Enter a valid email address"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-phone"></i>
                    <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                        ControlToValidate="txtmobile"
                        ErrorMessage="Mobile number is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMobile" runat="server"
                        ControlToValidate="txtmobile"
                        ValidationExpression="^[0-9]{10}$"
                        ErrorMessage="Enter a valid 10 digit number"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-user-tag"></i>
                    <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server"
                        ControlToValidate="txtuser"
                        ErrorMessage="Username is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revUser" runat="server"
                        ControlToValidate="txtuser"
                        ValidationExpression="^[A-Za-z0-9_]+$"
                        ErrorMessage="Enter a valid username"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server"
                        ControlToValidate="txtpass"
                        ErrorMessage="Password is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-register" OnClick="btnRegister_Click" />

                <div class="login-link">
                    <span>Already have an account? </span>
                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/login.aspx">Login Now</asp:HyperLink>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
            </div>
        </div>
    </form>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.body.style.backgroundImage = "url('../images/agriculture-bg.jpg')";

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
