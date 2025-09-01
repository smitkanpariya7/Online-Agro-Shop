<%@ Page Title="Products" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="products.aspx.cs" Inherits="SK_AGRO.products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #f3e5f5);
            font-family: 'Segoe UI', sans-serif;
        }

        .product-page {
            padding: 90px 30px;
            max-width: 1320px;
            margin: auto;
            animation: fadeIn 1s ease;
        }

        h1 {
            font-size: 3rem;
            text-align: center;
            margin-bottom: 50px;
            color: #1f1f1f;
            animation: slideInDown 0.8s ease;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 35px;
        }

        .product-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 18px;
            padding: 25px;
            transition: all 0.35s ease;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.25);
        }

        .product-image {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 14px;
            margin-bottom: 15px;
        }

        .product-name {
            font-size: 1.6rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }

        .product-description {
            font-size: 1rem;
            color: #666;
            margin-bottom: auto;
        }

        .product-price {
            font-size: 1.3rem;
            color: #2ecc71;
            font-weight: 600;
            margin-top: 20px;
        }

        .btn-add-to-cart {
            margin-top: 20px;
            background: linear-gradient(135deg, #0066ff, #00c3ff);
            color: white;
            padding: 12px 0;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-add-to-cart:hover {
            background: linear-gradient(135deg, #004ecb, #009ecf);
        }

        .btn-add-to-cart i {
            margin-right: 8px;
            transition: transform 0.5s ease;
        }

        .btn-add-to-cart.added {
            background: #27ae60 !important;
        }

        .btn-add-to-cart.added i {
            transform: rotate(360deg);
        }

        .no-products {
            grid-column: 1 / -1;
            background: rgba(255, 255, 255, 0.85);
            padding: 80px;
            text-align: center;
            border-radius: 20px;
            animation: fadeIn 1s ease;
        }

        .no-products h3 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .no-products .btn {
            margin-top: 20px;
            padding: 12px 30px;
            background: #007bff;
            color: white;
            border-radius: 10px;
            text-decoration: none;
            transition: background 0.3s ease;
            display: inline-block;
        }

        .no-products .btn:hover {
            background: #0056b3;
        }

        .toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: #27ae60;
            color: white;
            padding: 15px 25px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            z-index: 9999;
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.4s ease;
        }

        .toast.show {
            transform: translateY(0);
            opacity: 1;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideInDown {
            from { transform: translateY(-30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @media (max-width: 600px) {
            .product-name, .product-price {
                font-size: 1.1rem;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-page">
        <h1><asp:Literal ID="litCategoryTitle" runat="server" /></h1>

        <asp:Label ID="lblMessage" runat="server" CssClass="text-success" Visible="false"></asp:Label>

        <div class="product-grid">
            <asp:Repeater ID="rpt_products" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <img class="product-image" src='<%# GetProductImage(Eval("p_image")) %>' alt="Product Image" />
                        <div class="product-name"><%# Eval("p_name") %></div>
                        <div class="product-description"><%# Eval("p_des") %></div>
                        <div class="product-price">₹<%# Eval("p_price") %></div>
                        <asp:Button 
                            ID="btnAddToCart" 
                            runat="server" 
                            Text='Add to Cart' 
                            CommandName="AddToCart" 
                            CommandArgument='<%# Eval("p_Id") %>' 
                            CssClass="btn-add-to-cart"
                            UseSubmitBehavior="false"
                            OnClientClick="handleAddToCartClick(this);"
                            OnCommand="AddToCart_Command" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlNoProducts" runat="server" CssClass="no-products" Visible="false">
                <h3>No products found</h3>
                <p>There are currently no products available in this category.</p>
                <a href="products.aspx" class="btn"><i class="fas fa-boxes"></i> View All Products</a>
            </asp:Panel>
        </div>
    </div>

    <!-- Toast Notification -->
    <div id="toastNotification" class="toast" style="display:none;">
        <i class="fas fa-check-circle"></i> <span id="toastMessage">Product added to your cart successfully!</span>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        function handleAddToCartClick(button) {
            button.disabled = true;
            const originalHTML = button.innerHTML;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Adding...';

            setTimeout(() => {
                button.disabled = false;
                showToast('Product added to your cart successfully!');
                button.classList.add('added');
                button.innerHTML = '<i class="fas fa-check"></i> Added';
                setTimeout(() => {
                    button.classList.remove('added');
                    button.innerHTML = originalHTML;
                }, 2000);
            }, 1000);
        }


        function showToast(message) {
            const toast = document.getElementById('toastNotification');
            const toastMessage = document.getElementById('toastMessage');

            toastMessage.textContent = message || 'Product added to your cart successfully!';
            toast.style.display = 'block';

            setTimeout(() => {
                toast.classList.add('show');
            }, 10);

            setTimeout(() => {
                toast.classList.remove('show');
                setTimeout(() => {
                    toast.style.display = 'none';
                }, 300);
            }, 3000);
        }
    </script>
</asp:Content>
