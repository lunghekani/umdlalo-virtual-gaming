<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.build" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!--begin::Fonts-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Page Vendors Styles(used by this page)-->
    <link href="/Pages/assets/plugins/custom/fullcalendar/fullcalendar.bundle.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <!--end::Page Vendors Styles-->
    <!--begin::Global Theme Styles(used by all pages)-->
    <link href="/Pages/assets/plugins/global/plugins.bundle.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <link href="/Pages/assets/plugins/custom/prismjs/prismjs.bundle.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <link href="/Pages/assets/css/style.bundle.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <!--end::Global Theme Styles-->
    <!--begin::Layout Themes(used by all pages)-->
    <link href="/Pages/assets/css/themes/layout/header/base/light.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <link href="/Pages/assets/css/themes/layout/header/menu/light.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <link href="/Pages/assets/css/themes/layout/brand/light.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <link href="/Pages/assets/css/themes/layout/aside/dark.css?v=7.0.5" rel="stylesheet" type="text/css" />
    <!--end::Layout Themes-->
    <link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.3/bootstrap-notify.min.js" integrity="sha512-d0ZsJAyXsXlpeDNAhXj4mbaqpLfdyoOaQFmaFVG/KodZnAaVrdOsO9KiG62V7dcV+sHIFb7VTMmkB5JntAoq+Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
    
</head>
<style>
    body {
        overflow: auto;
    }

    textarea {
        overflow-y: scroll;
        height: 100px;
        resize: none;
    }
    textarea::-webkit-scrollbar {
        width: 1em;
    }

    textarea::-webkit-scrollbar-track {
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    }

    textarea::-webkit-scrollbar-thumb {
        border-radius: 10px;
        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
        background-color: #555;
    }
   
</style>

<body>
    <form id="form1" runat="server">
        <div class="messagealert" id="alert_container">
        </div>
        <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Info-->
                <div class="d-flex align-items-center flex-wrap mr-2">
                    <i class="fas fa-pencil-alt" style="margin-right: 8px;" id="iconEdit" runat="server"></i>
                    <asp:TextBox CssClass="btn btn-light-success text-dark font-weight-bold my-1 mr-5 font-weight-bolder btn-sm mr-2 "  ID="txtName" runat="server" >Project Name</asp:TextBox>
                  
                    <span class="label label-info label-inline label-xl font-weight-boldest mr-2" id="lblProjectName" style="margin-right: 8px;" runat="server">Project Name Label</span>
               <div id="divCreator" runat="server">
                    <i class="fa fa-user" ></i>
                    <span class="text-muted font-weight-bold " id="lblProjectCreator" runat="server" style="margin-left: 8px;">Lunghekani Langa</span>
                </div>
                </div>
                <!--end::Info-->
                <!--begin::Toolbar-->
                <div class="d-flex align-items-center">
                    <!--begin::Daterange-->

                    <a class="btn btn-light btn-sm font-weight-bold mr-2" id="liDateCreated" runat="server">
                        <span class="text font-weight-bold mr-2">Date Created</span>
                        <span class="text-primary font-weight-bold" id="lblDateCreated" runat="server">Aug 16</span>
                        
                    </a>
                    <!--end::Daterange-->
                    <!--begin::Actions-->
                    <asp:LinkButton id="btnSave" runat="server" CssClass=" btn-hover-primary btn btn-success font-weight-bold mr-2" OnClick="btnSave_OnClick">
                        <i class="flaticon2-file "></i> Save</asp:LinkButton>
                    
                    
                    
                    <asp:LinkButton id="btnSaveChanges" runat="server" CssClass=" btn-hover-primary btn btn-success font-weight-bold mr-2" OnClick="btnSaveChanges_OnClick">
                        <i class="flaticon-refresh "></i> Save Changes</asp:LinkButton>
                    
                    <asp:LinkButton id="btnDownload" runat="server" CssClass=" btn-hover-primary btn btn-success font-weight-bold mr-2" OnClick="btnDownload_OnClick">
                        <i class="flaticon-download-1 "></i>Download</asp:LinkButton>

                   

                    
                    <span style="margin-right: 4px" id="lblVisible" runat="server">Visible</span>


                    <span class="switch switch-sm  switch-icon switch-success" id="spVisible" runat="server">
                        <label>
                            <input type="checkbox" checked="checked" id="chkVisible"  runat="server"/>
                            <span></span>
                        </label>
                    </span>
                    




                    <!--end::Actions-->

                </div>
                <!--end::Toolbar-->
            </div>
        </div>

        <div class="card">
            <div class="card-body ">
                <div class="row">

                    <div class="col-5">

                        <div class="row">
                            <%--HTML Container--%>
                            <div class="col-12">
                                <!--begin::List Widget 1-->
                                <div class="card card-custom card-stretch ">
                                    <!--begin::Header-->

                                    <!--end::Header-->
                                    <!--begin::Body-->
                                    <div class="card-body pt-8" style="margin-bottom: -20px">
                                        <%--code here--%>
                                        <h3 class="card-title align-items-start flex-column">
                                            <span class="card-label font-weight-bolder text-dark">HTML Code</span>
                                            <span class="text-muted mt-3 font-weight-bold font-size-sm" id="htmlLines">0 Lines</span>
                                        </h3>
                                        <asp:TextBox TextMode="MultiLine" id="htmlCode" CssClass="language-html" Columns="75" Rows="5" runat="server" clientidmode="Static" oninput="showPreview();"></asp:TextBox>
                                        <%--<textarea id="htmlCode" css="language-html" cols="75" rows="5" runat="server" clientidmode="Static" oninput="showPreview()"></textarea>--%>
                                    </div>
                                    <div class="card-body pt-8">
                                        <h3 class="align-items-start flex-column">
                                            <span class="card-label font-weight-bolder text-dark">CSS Code</span>
                                            <span class="text-muted mt-3 font-weight-bold font-size-sm" id="cssLines">0 Lines</span>
                                        </h3>
                                        <textarea id="cssCode" cols="75" rows="5" runat="server" clientidmode="Static" oninput="showPreview()"></textarea>
                                    </div>
                                    <div class="card-body pt-8">
                                        <h3 class="align-items-start flex-column">
                                            <span class="card-label font-weight-bolder text-dark">JS Code</span>
                                            <span class="text-muted mt-3 font-weight-bold font-size-sm" id="jsLines">0 Lines</span>
                                        </h3>
                                        <textarea id="jsCode" cols="75" rows="5" runat="server" clientidmode="Static" oninput="showPreview()"></textarea>
                                    </div>
                                    <!--end::Body-->
                                </div>
                                <!--end::List Widget 1-->
                            </div>
                        </div>
                    </div>
                    <div class="col-7 ">
                        <iframe id="previewpane" style="width: 100%; height: 100%; border: 2px solid black;"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script type="text/javascript">
        window.showPreview();
        function showPreview() {

            var htmlCode = document.getElementById("htmlCode").value;
            var cssCode = "<style>" + document.getElementById("cssCode").value + "</style>";
            var jsCode = "<scri" + "pt>" + document.getElementById("jsCode").value + "</scri" + "pt>";
            var frame = document.getElementById("previewpane").contentWindow.document;
            frame.open();
            frame.write(htmlCode + cssCode + jsCode);
            frame.close();

            document.getElementById("htmlLines").innerText = htmlCode.split("\n").length + " Line(s)";
            document.getElementById("cssLines").innerText = cssCode.split("\n").length + " Line(s)";
            document.getElementById("jsLines").innerText = jsCode.split("\n").length + " Line(s)";

        }


    </script>
</body>
</html>
