<%@ Page Title="Manage Category" Language="C#" MasterPageFile="~/admin/MasterPage1.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="SK_AGRO.admin.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background: linear-gradient(135deg, #4361ee, #3f37c9);
            color: white;
        }
        .img-thumbnail {
            max-width: 100px;
            height: auto;
        }
        .badge-active {
            background-color: #4cc9f0;
        }
        .badge-inactive {
            background-color: #6c757d;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card mb-4">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-sitemap me-2"></i> Add New Category</h5>
            </div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="txtname" class="form-label">Category Name</label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Enter category name" />
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                            ControlToValidate="txtname" 
                            ErrorMessage="Category name is required" 
                            Display="Dynamic"
                            CssClass="text-danger"
                            ValidationGroup="CategoryValidation">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                        <label for="fupload" class="form-label">Category Image</label>
                        <asp:FileUpload ID="fupload" runat="server" CssClass="form-control" />
                        <small class="text-muted">Allowed formats: JPG, JPEG, PNG (Max 2MB)</small>
                        <asp:CustomValidator ID="cvImage" runat="server" 
                            ControlToValidate="fupload"
                            OnServerValidate="ValidateImage"
                            ErrorMessage="Please upload a valid image file"
                            Display="Dynamic"
                            CssClass="text-danger"
                            ValidationGroup="CategoryValidation">
                        </asp:CustomValidator>
                    </div>
                    <div class="col-12">
                        <asp:Button ID="btnsum" runat="server" Text="Add Category" 
                            CssClass="btn btn-success px-4"
                            OnClick="btnsum_Click" 
                            ValidationGroup="CategoryValidation" />
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0"><i class="fas fa-list me-2"></i> Category List</h5>
                <div class="d-flex">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control me-2" 
                        placeholder="Search categories..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                    <asp:DropDownList ID="ddlPageSize" runat="server" CssClass="form-select" 
                        AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                        <asp:ListItem Text="5 per page" Value="5" />
                        <asp:ListItem Text="10 per page" Value="10" Selected="True" />
                        <asp:ListItem Text="20 per page" Value="20" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gdv" runat="server"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        PageSize="10"
                        CssClass="table table-bordered table-hover"
                        EmptyDataText="No categories found. Add your first category!"
                        EmptyDataRowStyle-CssClass="text-center py-4"
                        OnPageIndexChanging="gdv_PageIndexChanging"
                        OnRowCancelingEdit="gdv_RowCancelingEdit"
                        OnRowDeleting="gdv_RowDeleting"
                        OnRowEditing="gdv_RowEditing"
                        OnRowUpdating="gdv_RowUpdating"
                        DataKeyNames="c_id,c_image">

                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("c_id") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblcategory" runat="server" Text='<%# Eval("c_name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtcategory" runat="server" CssClass="form-control" Text='<%# Eval("c_name") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditName" runat="server" 
                                        ControlToValidate="txtcategory" 
                                        ErrorMessage="Name is required" 
                                        Display="Dynamic"
                                        CssClass="text-danger"
                                        ValidationGroup="EditValidation">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="img" runat="server"
                                        ImageUrl='<%# "~/admin/img/" + Eval("c_image") %>'
                                        CssClass="img-thumbnail" 
                                        AlternateText='<%# Eval("c_name") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <div class="me-3">
                                            <asp:Image ID="img1" runat="server"
                                                ImageUrl='<%# "~/admin/img/" + Eval("c_image") %>'
                                                CssClass="img-thumbnail" />
                                        </div>
                                        <div>
                                            <asp:FileUpload ID="getfile" runat="server" CssClass="form-control" />
                                            <small class="text-muted">Leave empty to keep current image</small>
                                            <asp:CustomValidator ID="cvEditImage" runat="server" 
                                                ControlToValidate="getfile"
                                                OnServerValidate="ValidateEditImage"
                                                ErrorMessage="Invalid image format"
                                                Display="Dynamic"
                                                CssClass="text-danger"
                                                ValidationGroup="EditValidation">
                                            </asp:CustomValidator>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>

                           <asp:TemplateField HeaderText="Actions">
                                
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger me-1" OnClientClick="return confirm('Are you sure you want to delete this?');">
                                        <i class="fas fa-trash"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CssClass="btn btn-sm btn-success me-1">
                                        <i class="fas fa-save"></i> Update
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CssClass="btn btn-sm btn-secondary me-1">
                                        <i class="fas fa-times"></i> Cancel
                                    </asp:LinkButton>
                                </EditItemTemplate>
                                <ItemStyle Width="180px" CssClass="text-center" />
                            </asp:TemplateField>

                        </Columns>

                        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" />
                        <PagerStyle CssClass="pagination justify-content-center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete() {
            return Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                return result.isConfirmed;
            });
        }
    </script>
</asp:Content>