<%@ Page Title="Manage Orders" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="SK_AGRO.admin.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f3f6fb;
        }

        .card {
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: #fff;
            padding: 20px 30px;
            font-size: 1.4rem;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table thead {
            background: #11998e;
            color: #fff;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
            padding: 15px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:hover {
            background-color: #e0f7f4;
            transition: background-color 0.3s ease;
        }

        .btn-outline-info {
            border: 1px solid #0dcaf0;
            color: #0dcaf0;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-outline-info:hover {
            background-color: #0dcaf0;
            color: #fff;
        }

        .no-orders {
            padding: 60px;
            text-align: center;
            color: #888;
        }

        .no-orders i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #bbb;
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
                <h5><i class="fas fa-boxes me-2"></i> Manage Orders</h5>
            </div>

            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-striped align-middle mb-0">
                        <thead>
                            <tr>
                                <th>#Order ID</th>
                                <th>Customer</th>
                                <th>Mobile</th>
                                <th>Email</th>
                                <th>Order Date</th>
                                <th>Status</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="orderRepeater" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("OrderID") %></td>
                                        <td><%# Eval("CustomerName") %></td>
                                        <td><%# Eval("Mobile") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td><%# Eval("OrderDate", "{0:dd-MMM-yyyy}") %></td>
                                        <td>
                                            <span class="badge bg-success"><%# Eval("Status") %></span>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnDetails" runat="server"
                                                CommandArgument='<%# Eval("OrderID") %>'
                                                CommandName="Details"
                                                CssClass="btn btn-sm btn-outline-info">
                                                <i class="fas fa-eye"></i> View
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <tr runat="server" visible='<%# orderRepeater.Items.Count == 0 %>'>
                                        <td colspan="7" class="no-orders">
                                            <i class="fas fa-box-open"></i><br />
                                            No orders found.
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
