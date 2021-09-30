<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="content-creator.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.lecturer.content_creator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Begin Topic Details Card--%>
    <div class="row m-0">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h3 class="font-size-lg text-dark font-weight-bold mb-6">Edit Topic</h3>
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
                </div>
                <div class="card-footer">
                    <asp:Button runat="server" ID="btnSaveDetailChanges" OnClick="btnSaveDetailChanges_OnClick"/>
                </div>
            </div>
        </div>
    </div>
    <%--End Topic Details Card--%>
    <%--Begin Summernote Card--%>
    <div class="row m-0">
        <div class="col-lg-12">
            <div class="card card-custom">
                <div class="card-header">
                    <h3 class="card-title">Content Creator
                    </h3>
                </div>

                <!--begin::Form-->
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-form-label text-right col-lg-3 col-sm-12">Start:</label>
                        <div class="col-lg-9 col-md-9 col-sm-12">
                            <textarea id="txtIntroduction" runat="server" clientidmode="Static"></textarea>
                            <textarea id="txtContentDescr" runat="server" clientidmode="Static"></textarea>
                            <asp:FileUpload ID="fuDocuments" runat="server" />
                            <asp:CheckBox runat="server" ID="chkContentVisible" />
                            <asp:CheckBox runat="server" ID="chkContentDisabled" />

                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-form-label text-right col-lg-3 col-sm-12">Start:</label>
                        <div class="col-lg-9 col-md-9 col-sm-12">
                            <textarea id="txtContent" runat="server" clientidmode="Static"></textarea>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-9">
                            <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary mr-2" OnClick="btnSubmit_OnClick" Text="Submit" />
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
