<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="comments-page.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.comments_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xl-6 pt-10 pt-xl-0">
        <!--begin::Card-->
        <div class="card card-custom card-stretch" id="kt_todo_view">
            <!--begin::Header-->
            <div class="card-header align-items-center flex-wrap justify-content-between border-0 py-6 h-auto">
                <!--begin::Left-->
                <div class="d-flex align-items-center my-2">
                    <div class="d-flex align-items-center">
                        <div class="symbol symbol-35 mr-3">
                            <div class="symbol-label" style="background-image: url('/metronic/theme/html/demo1/dist/assets/media/users/100_12.jpg')"></div>
                        </div>
                        <a href="#" class="text-dark-75 font-size-lg text-hover-primary font-weight-bolder">Dave Stone</a>
                    </div>
                </div>
            </div>
            <!--end::Left-->


            <!--end::Header-->
            <!--begin::Body-->
            <div class="card-body p-0">
                <!--begin::Header-->
                <div class="d-flex align-items-center justify-content-between flex-wrap card-spacer-x py-3">
                </div>
                <!--end::Header-->
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
                            <!--begin::Form-->
                            <form id="kt_todo_reply_form">
                                <!--begin::Body-->
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
                                <!--end::Body-->
                                <!--begin::Footer-->
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
                                <!--end::Footer-->
                            </form>
                            <!--end::Form-->
                        </div>
                    </div>
                </div>
                <!--end::Reply-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Card-->
    </div>

</asp:Content>
