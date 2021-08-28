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
                    <span class="text-muted font-weight-bold " id="lblProjectCreator" runat="server" style="margin-left: 8px;">Kagiso Student</span>
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
                    
<!-- Button trigger modal-->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
    Launch demo modal
</button>

<!-- Modal-->
<div class="modal fade" id="exampleModalLong" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdrop" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal Title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>
            <div class="modal-body">
                 <!--begin::Messages-->
                <div class="mb-3">
                    <!--begin::Message-->
                    <div class="cursor-pointer shadow-xs toggle-off" data-inbox="message">
                        <!--begin::Info-->
                        <div class="d-flex align-items-start card-spacer-x py-4">
                            <!--begin::User Photo-->
                            <span class="symbol symbol-35 mr-3 mt-1">
                                <span class="symbol-label" style="background-image: url('/metronic/theme/html/demo1/dist/assets/media/users/100_13.jpg')"></span>
                            </span>
                            <!--end::User Photo-->
                            <!--begin::User Details-->
                            <div class="d-flex flex-column flex-grow-1 flex-wrap mr-2">
                                <div class="d-flex">
                                    <a href="#" class="font-size-lg font-weight-bolder text-dark-75 text-hover-primary mr-2">Chris Muller</a>
                                    <div class="font-weight-bold text-muted">
                                        <span class="label label-success label-dot mr-2"></span>1 Day ago
                                    </div>
                                </div>
                                <div class="d-flex flex-column">
                                    <div class="toggle-off-item">
                                        <span class="font-weight-bold text-muted cursor-pointer" data-toggle="dropdown">to me 
																					<i class="flaticon2-down icon-xs ml-1 text-dark-50"></i></span>
                                        <div class="dropdown-menu dropdown-menu-md dropdown-menu-left p-5">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-muted w-75px py-2">From</td>
                                                        <td>Mark Andre</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Date:</td>
                                                        <td>11:27 PM</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Subject:</td>
                                                        <td>Trip Reminder. Thank you for flying with us!</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Reply to:</td>
                                                        <td>mark.andre@gmail.com</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-muted font-weight-bold toggle-on-item" data-inbox="toggle">With resrpect, i must disagree with Mr.Zinsser. We all know the most part of important part....</div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="font-weight-bold text-muted mr-2">11:19AM</div>
                                
                            </div>
                            <!--end::User Details-->
                        </div>
                        <!--end::Info-->
                        <!--begin::Comment-->
                        <div class="card-spacer-x pt-2 pb-5 toggle-off-item">
                            <!--begin::Text-->
                            <div class="mb-1">
                                <p>Hi Bob,</p>
                                <p>With resrpect, i must disagree with Mr.Zinsser. We all know the most part of important part of any article is the title.Without a compelleing title, your reader won't even get to the first sentence.</p>
                                <p>
                                    Best regards, 
																			<br>
                                    Jason Muller
                                </p>
                            </div>
                            <!--end::Text-->
                            <!--begin::Attachments-->
                            <div class="d-flex flex-column font-size-sm font-weight-bold">
                                <a href="#" class="d-flex align-items-center text-muted text-hover-primary py-1">
                                    <span class="flaticon2-clip-symbol text-warning icon-1x mr-2"></span>Agreement Samle.pdf</a>
                                <a href="#" class="d-flex align-items-center text-muted text-hover-primary py-1">
                                    <span class="flaticon2-clip-symbol text-warning icon-1x mr-2"></span>Requirements.docx</a>
                            </div>
                            <!--end::Attachments-->
                        </div>
                        <!--end::Comment-->
                    </div>
                    <!--end::Message-->
                    <!--begin::Message-->
                    <div class="cursor-pointer shadow-xs toggle-off" data-inbox="message">
                        <!--begin::Info-->
                        <div class="d-flex align-items-start card-spacer-x py-4">
                            <!--begin::User Photo-->
                            <span class="symbol symbol-35 mr-3 mt-1">
                                <span class="symbol-label" style="background-image: url('/metronic/theme/html/demo1/dist/assets/media/users/100_10.jpg')"></span>
                            </span>
                            <!--end::User Photo-->
                            <!--begin::User Details-->
                            <div class="d-flex flex-column flex-grow-1 flex-wrap mr-2">
                                <div class="d-flex">
                                    <a href="#" class="font-size-lg font-weight-bolder text-dark-75 text-hover-primary mr-2">Ana Stone</a>
                                    <div class="font-weight-bold text-muted">
                                        <span class="label label-success label-dot mr-2"></span>3 Day ago
                                    </div>
                                </div>
                                <div class="d-flex flex-column">
                                    <div class="toggle-off-item">
                                        <span class="font-weight-bold text-muted cursor-pointer" data-toggle="dropdown">to me 
																					<i class="flaticon2-down icon-xs ml-1 text-dark-50"></i></span>
                                        <div class="dropdown-menu dropdown-menu-md dropdown-menu-left p-5">
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-muted w-75px py-2">From</td>
                                                        <td>Mark Andre</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Date:</td>
                                                        <td>11:27 PM</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Subject:</td>
                                                        <td>Trip Reminder. Thank you for flying with us!</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-muted py-2">Reply to:</td>
                                                        <td>mark.andre@gmail.com</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="text-muted font-weight-bold toggle-on-item" data-inbox="toggle">Compelleing title, your reader won't even get to the first</div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="font-weight-bold text-muted mr-2">10:30AM</div>
                                
                            </div>
                            <!--end::User Details-->
                        </div>
                        <!--end::Info-->
                        <!--begin::Comment-->
                        <div class="card-spacer-x pt-2 pb-5 toggle-off-item">
                            <!--begin::Text-->
                            <div class="mb-1">
                                <p>Hi Bob,</p>
                                <p>With resrpect, i must disagree with Mr.Zinsser. We all know the most part of important part of any article is the title.Without a compelleing title, your reader won't even get to the first sentence.</p>
                                <p>
                                    Best regards, 
																			<br>
                                    Jason Muller
                                </p>
                            </div>
                            <!--end::Text-->
                            <!--begin::Attachments-->
                            <div class="d-flex flex-column font-size-sm font-weight-bold">
                                <a href="#" class="d-flex align-items-center text-muted text-hover-primary py-1">
                                    <span class="flaticon2-clip-symbol text-warning icon-1x mr-2"></span>Agreement Samle.pdf</a>
                                <a href="#" class="d-flex align-items-center text-muted text-hover-primary py-1">
                                    <span class="flaticon2-clip-symbol text-warning icon-1x mr-2"></span>Requirements.docx</a>
                            </div>
                            <!--end::Attachments-->
                        </div>
                        <!--end::Comment-->
                    </div>
                    <!--end::Message-->
                </div>
                <!--end::Messages-->
                <!--begin::Reply-->
                <div class="card-spacer-x pb-10 pt-5" id="kt_todo_reply">
                    <div class="card card-custom shadow-sm">
                        <div class="card-body p-0">
                         
                                <div class="d-block">
                                    <!--begin::Message-->
                                    
                                    <div id="kt_todo_reply_editor" class="border-0 ql-container ql-snow" style="height: 200px">
                                        <div class="ql-editor ql-blank px-8" data-gramm="false" contenteditable="true" data-placeholder="Type message...">
                                            <p>
                                                <br>
                                            </p>
                                        </div>
                                        <div class="ql-clipboard" contenteditable="true" tabindex="-1"></div>
                                        <div class="ql-tooltip ql-hidden">
                                            <a class="ql-preview" rel="noopener noreferrer" target="_blank" href="about:blank"></a>
                                            <input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL"><a class="ql-action"></a>
                                            <a class="ql-remove"></a>
                                        </div>
                                    </div>
                                    <!--end::Message-->
                                    <!--begin::Attachments-->
                                    <%--<div class="dropzone dropzone-multi px-8 py-4" id="kt_todo_reply_attachments">
																					<div class="dropzone-items">
																						
																					</div>
																				<div class="dz-default dz-message"><button class="dz-button" type="button">Drop files here to upload</button></div></div>
                                    --%><!--end::Attachments-->
                                </div>
                               
                                <div class="d-flex align-items-center justify-content-between py-5 pl-8 pr-5 border-top">
                                    <!--begin::Actions-->
                                    <div class="d-flex align-items-center mr-3">
                                        <!--begin::Send-->
                                        <div class="btn-group mr-4">
                                            <span class="btn btn-primary font-weight-bold px-6">Send</span>
                                            
                                        </div>
                                        <!--end::Send-->
                                      
                                    </div>
                                    <!--end::Actions-->
                               
                                </div>
                             
                        </div>
                    </div>
                </div>
                <!--end::Reply-->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary font-weight-bold">Save changes</button>
            </div>
        </div>
    </div>
</div>
                   

                    
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
                                    <div class="card-body pt-8" style="margin-bottom: -50px">
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
    	<script src="/Pages/assets/plugins/global/plugins.bundle.js?v=7.0.5"></script>
		<script src="/Pages/assets/plugins/custom/prismjs/prismjs.bundle.js?v=7.0.5"></script>
		<script src="/Pages/assets/js/scripts.bundle.js?v=7.0.5"></script>
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
