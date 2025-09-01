<%@ Page Title="View Payments" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="paymentview.aspx.cs" Inherits="SK_AGRO.admin.paymentview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f8fb;
        }

        .card {
            border-radius: 18px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            padding: 20px 30px;
            border-bottom: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
            padding: 14px;
        }

        .table thead {
            background-color: #2575fc;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #edf4ff;
            transition: 0.3s;
        }

        .badge-success {
            background-color: #28a745;
        }

        .badge-failed {
            background-color: #dc3545;
        }

        .badge-pending {
            background-color: #ffc107;
            color: #212529;
        }

        .no-payments {
            text-align: center;
            padding: 50px;
            color: #999;
        }

        .no-payments i {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #ccc;
        }

        .btn-outline-primary {
            border-radius: 8px;
            transition: 0.3s;
        }

        .btn-outline-primary:hover {
            background-color: #2575fc;
            color: white;
        }

        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.9rem;
                padding: 10px;
            }

            .card-header h5 {
                font-size: 1rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-credit-card me-2"></i> Payment Records</h5>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0 align-middle">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Customer</th>
                                <th>Amount</th>
                                <th>Payment Mode</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptPayments" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("PaymentID") %></td>
                                        <td><%# Eval("CustomerName") %></td>
                                        <td>₹ <%# Eval("Amount", "{0:N2}") %></td>
                                        <td>
                                            <i class="fas fa-wallet text-primary me-1"></i>
                                            <%# Eval("PaymentMethod") %>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblStatus" runat="server"
                                                CssClass='<%# GetStatusClass(Eval("Status").ToString()) %>'
                                                Text='<%# Eval("Status") %>'></asp:Label>
                                        </td>
                                        <td><%# Eval("PaymentDate", "{0:dd-MMM-yyyy hh:mm tt}") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnDetails" runat="server"
                                                CommandArgument='<%# Eval("PaymentID") %>'
                                                CssClass="btn btn-sm btn-outline-primary">
                                                <i class="fas fa-eye"></i> View
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <tr runat="server" visible='<%# rptPayments.Items.Count == 0 %>'>
                                        <td colspan="7" class="no-payments">
                                            <i class="fas fa-money-check-alt"></i><br />
                                            No payment records found.
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
