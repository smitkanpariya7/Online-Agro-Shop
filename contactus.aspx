<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="contactus.aspx.cs" Inherits="SK_AGRO.contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
       
        
        .contact-section {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
            padding: 6rem 0;
            min-height: 100vh;
        }
        
        .contact-container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .contact-header {
            background: linear-gradient(135deg, var(--primary-color), #14532d, #166534);
            color: white;
            padding: 3rem;
            text-align: center;
        }
        
        .contact-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }
        
        .contact-header h2:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 3px;
            background: var(--secondary-color);
            bottom: -10px;
            left: 25%;
            border-radius: 3px;
        }
        
        .contact-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .contact-form-container {
            padding: 3rem;
            display: flex;
            flex-wrap: wrap;
        }
        
        .contact-info {
            flex: 1;
            min-width: 300px;
            padding-right: 2rem;
        }
        
        .contact-info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 2rem;
        }
        
        .contact-info-icon {
            background: linear-gradient(135deg, var(--primary-color), #166534);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            margin-right: 1.5rem;
            flex-shrink: 0;
        }
        
        .contact-info-content h4 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .contact-info-content p {
            color: #666;
            margin: 0;
        }
        
        .contact-form {
            flex: 1;
            min-width: 300px;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: #f9f9f9;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(78, 115, 223, 0.2);
            background-color: white;
            outline: none;
        }
        
        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }
        
        .btn-submit {
            background: linear-gradient(135deg, var(--primary-color), #166534);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        
        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(78, 115, 223, 0.3);
        }
        
        .btn-submit i {
            margin-right: 8px;
        }
        
        .status-message {
            margin-top: 1.5rem;
            padding: 1rem;
            border-radius: 8px;
            font-weight: 500;
            display: none;
            animation: fadeIn 0.5s;
        }
        
        .status-success {
            background-color: rgba(28, 200, 138, 0.1);
            color: var(--secondary-color);
            border: 1px solid rgba(28, 200, 138, 0.3);
            display: block;
        }
        
        .status-error {
            background-color: rgba(231, 74, 59, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(231, 74, 59, 0.3);
            display: block;
        }
        
        .floating-label {
            position: absolute;
            top: 12px;
            left: 15px;
            color: #999;
            transition: all 0.3s;
            pointer-events: none;
            background: white;
            padding: 0 5px;
        }
        
        .form-control:focus + .floating-label,
        .form-control:not(:placeholder-shown) + .floating-label {
            top: -10px;
            left: 10px;
            font-size: 0.8rem;
            color: var(--primary-color);
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
        }
        
        .map-container {
            height: 300px;
            border-radius: 8px;
            overflow: hidden;
            margin-top: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .map-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contact-form-container {
                flex-direction: column;
                padding: 2rem;
            }
            
            .contact-info {
                padding-right: 0;
                margin-bottom: 2rem;
            }
            
            .contact-header {
                padding: 2rem 1rem;
            }
        }
        
        /* Animated background for futuristic feel */
        .animated-bg {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 100%;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            opacity: 0.03;
            z-index: -1;
        }
        
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-section">
        <div class="animated-bg"></div>
        <div class="contact-container">
            <div class="contact-header">
                <h2>Get In Touch</h2>
                <p>We'd love to hear from you! Send us a message and we'll respond as soon as possible.</p>
            </div>
            
            <div class="contact-form-container">
                <div class="contact-info">
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="contact-info-content">
                            <h4>Our Location</h4>
                            <p>Marwadi University, Rajkot, gujarat - 360003</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <div class="contact-info-content">
                            <h4>Call Us</h4>
                            <p>(+91) 9874563210</p>
                            <p>Mon-Fri: 9am-6pm</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="contact-info-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="contact-info-content">
                            <h4>Email Us</h4>
                            <p>info@skagro.com</p>
                            <p>support@skagro.com</p>
                        </div>
                    </div>
                    
                    <div class="map-container">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3691.837299885243!2d70.7695573153786!3d22.28998534934851!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959ca248c77c099%3A0xdf5ac10af64ac8ee!2sMarwadi%20University!5e0!3m2!1sen!2sin!4v1620000000000!5m2!1sen!2sin" 
                            allowfullscreen="" loading="lazy" style="border:0;"></iframe>
                    </div>
                </div>
                
                <div class="contact-form">
                    <h3 style="color: var(--dark-color); margin-bottom: 1.5rem;">Send Us a Message</h3>
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder=" " />
                        <label class="floating-label" for="<%= txtName.ClientID %>">Your Name</label>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                            ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder=" " TextMode="Email" />
                        <label class="floating-label" for="<%= txtEmail.ClientID %>">Email Address</label>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Invalid email format" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder=" " TextMode="Phone" />
                        <label class="floating-label" for="<%= txtMobile.ClientID %>">Phone Number</label>
                        <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile"
                            ValidationExpression="^[0-9]{10,15}$"
                            ErrorMessage="Invalid phone number" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    
                    <div class="form-group">
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder=" " TextMode="MultiLine" Rows="6" />
                        <label class="floating-label" for="<%= txtMessage.ClientID %>">Your Message</label>
                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                            ErrorMessage="Message is required" CssClass="text-danger" Display="Dynamic" />
                    </div>
                    
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" OnClick="btnSubmit_Click" 
                        CssClass="btn-submit" />
                    
                    <asp:Panel ID="pnlMessage" runat="server" CssClass="status-message">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        function showSuccessMessage(message) {
            var panel = document.getElementById('<%= pnlMessage.ClientID %>');
            var label = document.getElementById('<%= lblMessage.ClientID %>');
            
            panel.className = 'status-message status-success';
            label.innerHTML = '<i class="fas fa-check-circle me-2"></i>' + message;
            panel.style.display = 'block';
            
            // Scroll to message
            panel.scrollIntoView({ behavior: 'smooth', block: 'center' });
            
            // Clear form if success
            if (message.toLowerCase().includes('success')) {
                setTimeout(function() {
                    document.getElementById('<%= txtName.ClientID %>').value = '';
                    document.getElementById('<%= txtEmail.ClientID %>').value = '';
                    document.getElementById('<%= txtMobile.ClientID %>').value = '';
                    document.getElementById('<%= txtMessage.ClientID %>').value = '';
                }, 1000);
            }
        }
        
        function showErrorMessage(message) {
            var panel = document.getElementById('<%= pnlMessage.ClientID %>');
            var label = document.getElementById('<%= lblMessage.ClientID %>');

            panel.className = 'status-message status-error';
            label.innerHTML = '<i class="fas fa-exclamation-circle me-2"></i>' + message;
            panel.style.display = 'block';

            // Scroll to message
            panel.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        // Initialize floating labels
        document.addEventListener('DOMContentLoaded', function () {
            var inputs = document.querySelectorAll('.form-control');
            inputs.forEach(function (input) {
                if (input.value) {
                    input.nextElementSibling.classList.add('active');
                }
            });
        });
    </script>
</asp:Content>