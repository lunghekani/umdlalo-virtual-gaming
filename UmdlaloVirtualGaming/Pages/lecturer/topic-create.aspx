<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="topic-create.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_topic_create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <h3 class="font-size-lg text-dark font-weight-bold mb-6">Add Topic</h3>
            <div class="mb-15">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Topic Name:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" placeholder="Enter Topic name" CssClass="form-control" ID="txtTopicName"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Topic Description:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" placeholder="Enter topic description" CssClass="form-control" ID="txtDescr" TextMode="MultiLine" Columns="75" Rows="3"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Topic Marks:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" placeholder="Enter mark allocation" CssClass="form-control" ID="txtMark"></asp:TextBox>
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
                <%--end of form--%>

        </div>
        <div class="card-footer">
            <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-pill btn-primary" Text="Create Topic" OnClick="btnSubmit_OnClick"/>
        </div>
    </div>
    </div>
</asp:Content>
