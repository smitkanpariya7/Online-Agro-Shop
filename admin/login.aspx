<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SK_AGRO.admin.login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Admin Login - SK AGRO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
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

        .login-container {
            position: relative;
            z-index: 2;
            max-width: 450px;
            width: 100%;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            padding: 40px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transform-style: preserve-3d;
            transform: perspective(1000px);
            transition: var(--transition);
        }

        .login-card:hover {
            transform: perspective(1000px) translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            width: 100px;
            height: 100px;
            object-fit: contain;
            border-radius: 50%;
            border: 3px solid var(--primary-color);
            padding: 5px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: var(--transition);
        }

        .logo:hover {
            transform: rotate(15deg) scale(1.05);
        }

        .login-title {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--dark-color);
            position: relative;
            padding-bottom: 15px;
        }

        .login-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
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
            border: 2px solid #e1e1e1;
            font-size: 15px;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 176, 155, 0.25);
        }

        .form-control:focus + i {
            color: var(--secondary-color);
            transform: translateY(-50%) scale(1.2);
        }

        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 30px;
            padding: 12px;
            color: white;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: var(--transition);
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(0, 176, 155, 0.4);
        }

        .btn-login:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 176, 155, 0.6);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .validation-error {
            color: var(--danger-color);
            font-size: 0.85rem;
            margin-top: 5px;
            display: block;
            padding-left: 15px;
        }

        .message-container {
            text-align: center;
            margin-top: 20px;
        }

        .message {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 500;
        }

        .error-message {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(231, 76, 60, 0.3);
        }

        .forgot-password {
            text-align: right;
            margin-top: -15px;
            margin-bottom: 20px;
        }

        .forgot-password a {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
            transition: var(--transition);
        }

        .forgot-password a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 576px) {
            .login-card {
                padding: 30px 20px;
            }
            
            .form-control {
                padding-left: 45px;
                height: 45px;
            }
            
            .logo {
                width: 80px;
                height: 80px;
            }
        }

        /* Floating animation */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .floating {
            animation: float 3s ease-in-out infinite;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-card">
                <div class="logo-container">
                    <img src="../images/logo3.jpg" alt="SK AGRO Logo" class="logo floating" />
                </div>
                <h2 class="login-title">ADMIN PORTAL</h2>

                <div class="form-group">
                    <i class="fas fa-envelope"></i>
                    <asp:TextBox ID="txtadmin" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtadmin"
                        ErrorMessage="Email is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtadmin"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Please enter a valid email address"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtpass"
                        ErrorMessage="Password is required"
                        CssClass="validation-error"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="forgot-password">
                    <a href="forgot_password.aspx">Forgot Password?</a>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="SIGN IN" CssClass="btn btn-login" OnClick="btnLogin_Click" />

                <div class="message-container">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message error-message" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS for enhanced interactivity -->
    <script>
        // Add focus effects
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.querySelector('i').style.color = '#96c93d';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.querySelector('i').style.color = '#00b09b';
            });
        });

        // Add input validation on blur
        document.getElementById('<%= txtadmin.ClientID %>').addEventListener('blur', function() {
            if (this.value.trim() === '') {
                this.classList.add('is-invalid');
            } else {
                this.classList.remove('is-invalid');
            }
        });

        document.getElementById('<%= txtpass.ClientID %>').addEventListener('blur', function() {
            if (this.value.trim() === '') {
                this.classList.add('is-invalid');
            } else {
                this.classList.remove('is-invalid');
            }
        });

        // Prevent form submission if there are validation errors
        document.getElementById('<%= form1.ClientID %>').addEventListener('submit', function(e) {
            const inputs = document.querySelectorAll('.form-control');
            let isValid = true;
            
            inputs.forEach(input => {
                if (input.value.trim() === '') {
                    input.classList.add('is-invalid');
                    isValid = false;
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                document.getElementById('<%= lblMessage.ClientID %>').textContent = 'Please fill in all required fields';
                document.getElementById('<%= lblMessage.ClientID %>').style.display = 'block';
            }
        });
    </script>
</body>
</html>