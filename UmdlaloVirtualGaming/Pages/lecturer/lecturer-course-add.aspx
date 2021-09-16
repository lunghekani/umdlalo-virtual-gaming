<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-course-add.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_course_add" %>
<%--todo figure out the eventvalidation false thing--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card">
        <div class="card-body">
            <h3 class="font-size-lg text-dark font-weight-bold mb-6">Add Course</h3>
            <div class="mb-15">
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Course Name:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" placeholder="Enter course name" CssClass="form-control" ID="txtCourseName"></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Course Description:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" TextMode="MultiLine" Rows="3" Columns="75" CssClass="form-control" ID="txtDescription" placeholder="Enter a description"></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Course Code:</label>
                    <div class="col-lg-6">
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCode" placeholder="#A0A0A0"></asp:TextBox>


                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">Start Time:</label>
                    <div class="col-lg-6">
                        <asp:TextBox class="form-control" type="datetime-local" value="2021-09-06T13:45:00" ID="txtStartTime" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-lg-3 col-form-label">End Time:</label>
                    <div class="col-lg-6">
                        <asp:TextBox class="form-control" type="datetime-local" value="2022-01-19T13:45:00" ID="txtEndTime" runat="server"></asp:TextBox>


                        <span class="form-text text-muted">Leave blank if there is no specific end time</span>
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
