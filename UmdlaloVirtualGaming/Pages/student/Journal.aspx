<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Journal.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.Journal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
 
    <%--Begin Summernote Card--%>
    <div class="row m-0">
        <div class="col-lg-12">
            <div class="card card-custom">
                <div class="card-header">
                    <h3 class="card-title">Journal
                    </h3>
                </div>

                 <div class="form-group row">
                    <label class="col-lg-3 text-right col-form-label">Entry Date and Time:</label>
                    <div class="col-lg-6">
                        <asp:TextBox class="form-control" type="datetime-local" value="2021-09-06T13:45:00" ID="txtStartTime" runat="server"></asp:TextBox>

                    </div>
                </div>

                <!--begin::Form-->
                <div class="card-body">
                   
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-form-label text-right col-lg-3 col-sm-12"> Notes:</label>
                        <div class="col-lg-9 col-md-9 col-sm-12">
                            <textarea id="txtContent" runat="server" clientidmode="Static"></textarea>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-9">
                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary mr-2"  Text="Submit" />
                            <button type="submit" class="btn btn-secondary">Cancel</button>
                        </div>
                    </div>
                </div>

                <!--end::Form-->
            </div>
        </div>
    </div>
    <%--End Summernote Card--%>

    <script>
        $(function () {
            // Set up your summernote instance
            $("#txtContent").summernote({
                height: 300
            });
            // When the summernote instance loses focus, update the content of your <textarea>
            $("#txtContent").on('summernote.blur', function () {
                $('#txtContent').html(escape($('#txtTest').summernote('code')));
            });
        });
    </script>
</asp:Content>

