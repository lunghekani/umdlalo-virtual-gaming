<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="content-creator.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.lecturer.content_creator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-custom">
        <div class="card-header">
            <h3 class="card-title">
               Journal
            </h3>
        </div>
        <!--begin::Form-->
        
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-form-label text-right col-lg-3 col-sm-12">Start:</label>
                    <div class="col-lg-9 col-md-9 col-sm-12">
                        <textarea id="txtTest" runat="server" ClientIDMode="Static"></textarea>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-9">
                        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary mr-2" OnClick="btnSubmit_OnClick" Text="Submit"/>
                        
                        <button type="submit" class="btn btn-secondary">Cancel</button>
                    </div>
                </div>
            </div>
        
        <!--end::Form-->
    </div>
    <script>
        $(function () {
            // Set up your summernote instance
            $("#txtTest").summernote({
                height: 300
            });
            // When the summernote instance loses focus, update the content of your <textarea>
            $("#txtTest").on('summernote.blur', function () {
                $('#txtTest').html(escape($('#txtTest').summernote('code')));
            });
        });
    </script>
</asp:Content>
