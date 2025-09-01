<%@ Page Title="View Feedback" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="SK_AGRO.admin.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f4f7fa;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            padding: 20px 30px;
            font-size: 1.3rem;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: none;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            background: #1e3c72;
            color: white;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9fbff;
        }

        .table-striped tbody tr:hover {
            background-color: #e3ecff;
            transition: background-color 0.3s ease;
        }

        .btn-outline-danger {
            border: 1px solid #dc3545;
            color: #dc3545;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: white;
        }

        .no-feedback {
            padding: 50px;
            text-align: center;
            color: #888;
        }

        .no-feedback i {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #ccc;
        }

        @media (max-width: 768px) {
            .card-header h5 {
                font-size: 1.1rem;
            }

            .table th, .table td {
                font-size: 0.9rem;
                padding: 10px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="card">
            <div class="card-header">
                <h5><i class="fas fa-comments me-2"></i> View Feedback</h5>
            </div>

            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Message</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="show1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("id") %></td>
                                        <td><%# Eval("name") %></td>
                                        <td><%# Eval("u_mobile") %></td>
                                        <td><%# Eval("u_email") %></td>
                                        <td><%# Eval("message") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnDelete" runat="server"
                                                CommandArgument='<%# Eval("id") %>'
                                                CommandName="Delete"
                                                CssClass="btn btn-sm btn-outline-danger"
                                                OnClientClick="return confirm('Are you sure you want to delete this feedback?');"
                                                OnClick="btn_d_Click">
                                                <i class="fas fa-trash-alt"></i>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <tr runat="server" visible='<%# show1.Items.Count == 0 %>'>
                                        <td colspan="6" class="no-feedback">
                                            <i class="fas fa-inbox"></i><br />
                                            No feedback found.
                                        </td>
                                    </tr>
                                </FooterTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
