<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="admin-course-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.admin.admin_course_add" %>
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
                    <label class="col-lg-3 col-form-label">Start Time:</label>
                    <div class="col-lg-6">
                        <asp:TextBox class="form-control" type="datetime-local" value="2021-09-06T13:45:00" ID="txtStartTime" runat="server"></asp:TextBox>

                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-3 col-form-label">Visible</label>
                    <div class="col-3">
                        <span class="switch switch-success witch-outline switch-icon ">
                            <label>
                                <asp:CheckBox runat="server" ID="checkVisible" CssClass="form-control" />

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
                        <asp:Button runat="server" Text="Create Course" ID="btnCreate" CssClass="btn btn-success mr-2" OnClick="btnCreate_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
 
</asp:Content>
