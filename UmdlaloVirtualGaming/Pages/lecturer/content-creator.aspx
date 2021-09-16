<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="content-creator.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.content_creator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-custom">
        <div class="card-header">
            <h3 class="card-title">
                Content Creator
            </h3>
        </div>
        <!--begin::Form-->
        
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-form-label text-right col-lg-3 col-sm-12">Start:</label>
                    <div class="col-lg-9 col-md-9 col-sm-12">
                        <div class="summernote" id="kt_summernote_1"></div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-9">
                        <button type="submit" class="btn btn-primary mr-2">Submit</button>
                        <button type="submit" class="btn btn-secondary">Cancel</button>
                    </div>
                </div>
            </div>
        
        <!--end::Form-->
    </div>
    <script>
        // Class definition

        var KTSummernoteDemo = function () {
            // Private functions
            var demos = function () {
                $('.summernote').summernote({
                    height: 150
                });
            }

            return {
                // public functions
                init: function () {
                    demos();
                }
            };
        }();

        // Initialization
        jQuery(document).ready(function () {
            KTSummernoteDemo.init();
        });
    </script>
</asp:Content>
