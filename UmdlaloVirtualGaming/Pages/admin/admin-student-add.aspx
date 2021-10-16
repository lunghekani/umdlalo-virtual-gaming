<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="admin-student-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.admin.admin_student_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
        <div class="card-body">
            <h3 class="font-size-lg text-dark font-weight-bold mb-6">Add User:</h3>
            <div class="mb-15">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">First Name:</label>
                    <div class="col-lg-6">
                        <asp:TextBox placeholder="Fisrt name" CssClass="form-control" ID="txtFirstName" runat="server" ></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Last Name:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server"  Rows="3" Columns="75" CssClass="form-control" ID="txtLstName" placeholder="Last Name"></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Email</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" Textmode="Email" CssClass="form-control" ID="txtEmail" placeholder="name@email.com"></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <%--<label class="col-lg-3 col-form-label">Password</label>--%>
                    
                    <div class="col-lg-6">
                        <%--<asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" placeholder="Enter a default Password"></asp:TextBox>--%>

                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-3 col-form-label">Role</label>
                    <div class="col-3">
                        <span class="switch switch-success witch-outline switch-icon ">
                            <label>
                                <div class="col-md-4 my-2 my-md-0"></div>
                                <div class="d-flex align-items-center"></div>
                                    

                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                     <asp:ListItem Value="-1">Select Role</asp:ListItem>
                                    <asp:ListItem Value="1">Lecturer</asp:ListItem>
                                    <asp:ListItem Value="2">Student</asp:ListItem>
                                    <asp:ListItem Value="3">Admin</asp:ListItem>

                                    </asp:DropDownList>

                                <span></span>
                            </label>
                        </span>
                    </div>
                </div>


            </div>
            
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6">
                        <asp:Button runat="server" Text="Add User" ID="btnAddUser" CssClass="btn btn-success mr-2" OnClick="btnAddUser_Click"/>

                    </div>
                </div>
            </div>
        </div>
    </div>
 
</asp:Content>
