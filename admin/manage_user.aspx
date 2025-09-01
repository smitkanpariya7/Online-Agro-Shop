<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="manage_user.aspx.cs" Inherits="SK_AGRO.admin.manage_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f4f7fa;
        }

        .card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            background: linear-gradient(135deg, #007bff, #00c6ff);
            color: white;
            padding: 20px 30px;
            font-size: 1.3rem;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: none;
        }

        .card-body {
            padding: 0;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            background: #007bff;
            color: white;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 15px;
            border-bottom: 1px solid #e6e6e6;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9fbff;
        }

        .table-striped tbody tr:hover {
            background-color: #eaf3ff;
            transition: background-color 0.3s;
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

        .no-users {
            padding: 50px;
            text-align: center;
            color: #999;
        }

        .no-users i {
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
                <h5><i class="fas fa-users me-2"></i> Manage Users</h5>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="show1" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Cu_id") %></td>
                                        <td><%# Eval("u_name") %></td>
                                        <td><%# Eval("u_mobile") %></td>
                                        <td><%# Eval("u_email") %></td>
                                        <td><%# Eval("u_pass") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnDelete" runat="server"
                                                CommandArgument='<%# Eval("Cu_id") %>'
                                                CommandName="Delete"
                                                CssClass="btn btn-sm btn-outline-danger"
                                                OnClientClick="return confirm('Are you sure you want to delete this user?');"
                                                OnClick="btn_d_Click">
                                                <i class="fas fa-trash-alt"></i>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <tr runat="server" visible='<%# show1.Items.Count == 0 %>'>
                                        <td colspan="6" class="no-users">
                                            <i class="fas fa-user-slash"></i><br />
                                            No users found.
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
