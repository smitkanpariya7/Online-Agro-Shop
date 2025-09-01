<%@ Page Title="Manage Product" Language="C#" MasterPageFile="~/admin/MasterPage1.Master"
    AutoEventWireup="true" CodeBehind="manage_product.aspx.cs"
    Inherits="SK_AGRO.admin.manage_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="fas fa-leaf"></i> Manage Product</h5>
            </div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Product Name:</label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Description:</label>
                        <asp:TextBox ID="txtdes" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Price:</label>
                        <asp:TextBox ID="txtprice" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Category:</label>
                        <asp:DropDownList ID="ddleventname" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Product Image:</label>
                        <asp:FileUpload ID="fupload" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="mt-4">
                    <asp:Button ID="btnsum" runat="server" Text="Add Product" CssClass="btn btn-success px-4"
                        OnClick="btnsum_Click" />
                </div>
            </div>
        </div>

        <div class="card mt-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="fas fa-list"></i> Product List</h5>
            </div>
            <div class="card-body table-responsive">
                <asp:GridView ID="gdv" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                    CssClass="table table-bordered table-striped table-hover"
                    OnPageIndexChanging="gdv_PageIndexChanging"
                    OnRowCancelingEdit="gdv_RowCancelingEdit"
                    OnRowDeleting="gdv_RowDeleting"
                    OnRowEditing="gdv_RowEditing"
                    OnRowUpdating="gdv_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("p_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblproduct" runat="server" Text='<%# Eval("p_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtproduct" runat="server" Text='<%# Eval("p_name") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="lbldes" runat="server" Text='<%# Eval("p_des") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtdes" runat="server" Text='<%# Eval("p_des") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="img" runat="server" ImageUrl='<%# "~/admin/img/" + Eval("p_image") %>'
                                    Height="75px" Width="100px" CssClass="img-thumbnail" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/admin/img/" + Eval("p_image") %>'
                                    Height="75px" Width="100px" CssClass="img-thumbnail" /><br />
                                <asp:FileUpload ID="getfile" runat="server" CssClass="form-control mt-2" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblprice" runat="server" Text='<%# Eval("p_price") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtprice" runat="server" Text='<%# Eval("p_price") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblcat" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlcat" runat="server" CssClass="form-select"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit"
                                    CssClass="btn btn-primary btn-sm" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="return confirm('Are you sure you want to delete this product?');"
                                    CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update"
                                    CssClass="btn btn-success btn-sm" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                    CssClass="btn btn-secondary btn-sm" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
