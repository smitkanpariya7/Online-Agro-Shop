<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="cart.aspx.cs" Inherits="SK_AGRO.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-page {
            padding: 90px 30px;
            max-width: 1200px;
            margin: auto;
        }

        .cart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .cart-title {
            font-size: 2.5rem;
            color: #333;
        }

        .cart-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.05);
            padding: 30px;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th {
            text-align: left;
            padding: 15px 10px;
            border-bottom: 2px solid #eee;
            color: #666;
            font-weight: 500;
        }

        .cart-table td {
            padding: 20px 10px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        .cart-item-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        .cart-item-name {
            font-weight: 500;
            color: #333;
        }

        .quantity-control {
            display: flex;
            align-items: center;
        }

        .quantity-btn {
            width: 30px;
            height: 30px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            cursor: pointer;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quantity-input {
            width: 50px;
            height: 30px;
            text-align: center;
            border: 1px solid #ddd;
            margin: 0 5px;
        }

        .remove-item {
            color: #e74c3c;
            cursor: pointer;
            font-size: 1.2rem;
        }

        .cart-summary {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
        }

        .summary-card {
            background: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            width: 350px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .summary-total {
            font-weight: 600;
            font-size: 1.2rem;
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }

        .checkout-btn {
            width: 100%;
            background: #27ae60;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 1rem;
            margin-top: 20px;
            cursor: pointer;
        }

        .empty-cart {
            text-align: center;
            padding: 50px;
        }

        .empty-cart i {
            font-size: 5rem;
            color: #ddd;
            margin-bottom: 20px;
        }

        .empty-cart h3 {
            font-size: 1.8rem;
            margin-bottom: 15px;
        }

        .continue-shopping {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background: #0066ff;
            color: white;
            border-radius: 8px;
            text-decoration: none;
        }
        
        .item-count {
            font-size: 1rem;
            color: #666;
        }
        
        .error-message {
            color: #e74c3c;
            margin-bottom: 20px;
            padding: 10px;
            background: #fde8e8;
            border-radius: 5px;
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-page">
        <div class="cart-header">
            <h1 class="cart-title">Your Shopping Cart</h1>
            <asp:Label ID="lblItemCount" runat="server" CssClass="item-count"></asp:Label>
        </div>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>

        <div class="cart-container">
            <asp:Panel ID="pnlCartItems" runat="server">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center;">
                                            <img src='<%# GetProductImage(Eval("p_image")) %>' class="cart-item-image" />

                                            <div style="margin-left: 15px;">
                                                <div class="cart-item-name"><%# Eval("Name") %></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>₹<%# Eval("Price", "{0:0.00}") %></td>
                                    <td>
                                        <div class="quantity-control">
                                            <asp:LinkButton ID="btnDecrease" runat="server" 
                                                CommandName="Decrease" 
                                                CommandArgument='<%# Eval("ProductId") %>'
                                                CssClass="quantity-btn">-</asp:LinkButton>
                                            <asp:TextBox ID="txtQuantity" runat="server" 
                                                Text='<%# Eval("Quantity") %>' 
                                                CssClass="quantity-input" 
                                                ReadOnly="true" />
                                            <asp:LinkButton ID="btnIncrease" runat="server" 
                                                CommandName="Increase" 
                                                CommandArgument='<%# Eval("ProductId") %>'
                                                CssClass="quantity-btn">+</asp:LinkButton>
                                        </div>
                                    </td>
                                    <td>₹<%# (Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))).ToString("0.00") %></td>
                                    <td>
                                        <asp:LinkButton ID="btnRemove" runat="server" 
                                            CommandName="Remove" 
                                            CommandArgument='<%# Eval("ProductId") %>'
                                            CssClass="remove-item">
                                            <i class="fas fa-trash"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

                <div class="cart-summary">
                    <div class="summary-card">
                        <div class="summary-row">
                            <span>Subtotal:</span>
                            <span>₹<asp:Literal ID="litSubtotal" runat="server" /></span>
                        </div>
                        <div class="summary-row">
                            <span>Shipping:</span>
                            <span>₹<asp:Literal ID="litShipping" runat="server" Text="0.00" /></span>
                        </div>
                        <div class="summary-row summary-total">
                            <span>Total:</span>
                            <span>₹<asp:Literal ID="litTotal" runat="server" /></span>
                        </div>
                        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" 
                            CssClass="checkout-btn" OnClick="btnCheckout_Click" />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="empty-cart">
                <i class="fas fa-shopping-cart"></i>
                <h3>Your cart is empty</h3>
                <p>Looks like you haven't added any items to your cart yet.</p>
                <a href="products.aspx" class="continue-shopping">Continue Shopping</a>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        // Show error message if it exists
        $(document).ready(function() {
            if ($('.error-message').text().trim() !== '') {
                $('.error-message').show();
            }
        });
    </script>
</asp:Content>