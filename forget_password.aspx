<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="SK_AGRO.forgot_password" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Forgot Password - SK AGRO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card p-4 shadow-lg" style="max-width:450px;margin:auto;">
                <h3 class="text-center">Forgot Password</h3>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                    <!-- STEP 1: Enter Email -->
                    <asp:View ID="ViewEmail" runat="server">
                        <div class="mb-3">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSendOtp" runat="server" Text="Send OTP" CssClass="btn btn-primary w-100" OnClick="btnSendOtp_Click" />
                    </asp:View>

                    <!-- STEP 2: Enter OTP -->
                    <asp:View ID="ViewOtp" runat="server">
                        <div class="mb-3">
                            <label>Enter OTP (sent to your email)</label>
                            <asp:TextBox ID="txtOtp" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnVerifyOtp" runat="server" Text="Verify OTP" CssClass="btn btn-success w-100" OnClick="btnVerifyOtp_Click" />
                    </asp:View>

                    <!-- STEP 3: Reset Password -->
                    <asp:View ID="ViewReset" runat="server">
                        <div class="mb-3">
                            <label>New Password</label>
                            <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnReset" runat="server" Text="Reset Password" CssClass="btn btn-danger w-100" OnClick="btnReset_Click" />
                    </asp:View>

                </asp:MultiView>

                <div class="text-center mt-3">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
                </div>

                <div class="text-center mt-3">
                    <a href="login.aspx"><i class="fas fa-arrow-left"></i> Back to Login</a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
