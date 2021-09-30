﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-course-list.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.student.student_course_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader"> 
        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
            <!--begin::Info-->
            <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Mobile Toggle-->
                <button class="burger-icon burger-icon-left mr-4 d-inline-block d-lg-none" id="kt_subheader_mobile_toggle">
                    <span></span>
                </button>
                <!--end::Mobile Toggle-->
                <!--begin::Page Heading-->
                <div class="d-flex align-items-baseline flex-wrap mr-5">
                    <!--begin::Page Title-->
                    <h5 class="text-dark font-weight-bold my-1 mr-5">All Courses</h5>
                    <!--end::Page Title-->

                </div>
                <!--end::Page Heading-->
            </div>
            <!--end::Info-->
            <!--begin::Toolbar-->
            <div class="d-flex align-items-center">
            </div>
            <!--end::Toolbar-->
        </div>
    </div>
<asp:GridView runat="server" ID="gvCourses"
              CssClass="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded"
                          
              Style="text-align: center; word-wrap: break-word; " AllowPaging="True"
              OnPageIndexChanging="gvCourses_PageIndexChanging"
              OnRowCommand="gvCourses_OnRowCommand"
              AlternatingRowStyle-BorderWidth="0px"
              align-content="center"
              DataKeyNames="ID">
                          
    <AlternatingRowStyle BorderWidth="0px" CssClass="bottomBorder"></AlternatingRowStyle>
    <Columns  >
        <asp:TemplateField >
            <HeaderTemplate>
                Action      
            </HeaderTemplate>
                                                
            <ItemTemplate >
                <asp:Button CommandName="View" runat="server"  Class="btn btn-primary  fa" 
                            Text="&#xf06e;" CommandArgument="<%# Container.DataItemIndex %>" 
                            data-toggle="tooltip" data-placement="top" title="View"/>
                                                    
            </ItemTemplate>
        </asp:TemplateField>
                                    
    </Columns>

</asp:GridView>
    <div class="row">
        <div class="col-4">
            <div class="card card-custom gutter-b">
                <!--begin::Body-->
                <div class="card-body">
                    <!--begin::Wrapper-->
                    <div class="d-flex justify-content-between flex-column h-100">
                        <!--begin::Container-->
                        <div class="h-100">
                            <!--begin::Header-->
                            <div class="d-flex flex-column flex-center">
                                <!--begin::Image-->
                                <div class="bgi-no-repeat bgi-size-cover rounded min-h-180px w-100" style="background-image: url(/Pages/assets/media/stock-600x400/html-illustration.png)"></div>
                                <!--end::Image-->
                                <!--begin::Title-->
                                <a href="class.aspx" class="card-title font-weight-bolder text-dark-75 text-hover-primary font-size-h4 m-0 pt-7 pb-1" id="module_name" runat="server">Introduction to HTML</a>
                                <!--end::Title-->
                                <!--begin::Text-->
                                <div class="font-weight-bold text-dark-50 font-size-sm pb-7">11:20-12:00, John Lecturer</div>
                                <!--end::Text-->
                            </div>
                            <!--end::Header-->
                            <!--begin::Body-->
                            <div class="pt-1">
                                <!--begin::Item-->
                                <div class="d-flex align-items-center pb-9">
                                    <!--begin::Symbol-->
                                    <div class="symbol symbol-45 symbol-light mr-4">
                                        <span class="symbol-label">
                                            <span class="svg-icon svg-icon-2x svg-icon-dark-50">
                                                <!--begin::Svg Icon | path:assets/media/svg/icons/Media/Equalizer.svg-->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                        <rect x="0" y="0" width="24" height="24"></rect>
                                                        <rect fill="#000000" opacity="0.3" x="13" y="4" width="3" height="16" rx="1.5"></rect>
                                                        <rect fill="#000000" x="8" y="9" width="3" height="11" rx="1.5"></rect>
                                                        <rect fill="#000000" x="18" y="11" width="3" height="9" rx="1.5"></rect>
                                                        <rect fill="#000000" x="3" y="13" width="3" height="7" rx="1.5"></rect>
                                                    </g>
                                                </svg>
                                                <!--end::Svg Icon-->
                                            </span>
                                        </span>
                                    </div>
                                    <!--end::Symbol-->
                                    <!--begin::Text-->
                                    <div class="d-flex flex-column flex-grow-1">
                                        <a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Using the Canvas</a>
                                        <span class="text-muted font-weight-bold">Tutorial</span>
                                    </div>
                                    <!--end::Text-->
                                    <!--begin::label-->
                                    <span class="font-weight-bolder label label-xl label-light-success label-inline px-3 py-5 min-w-45px">2</span>
                                    <!--end::label-->
                                </div>
                                <!--end::Item-->
                               
                                <!--begin::Item-->
                                <div class="d-flex align-items-center pb-9">
                                    <!--begin::Symbol-->
                                    <div class="symbol symbol-45 symbol-light mr-4">
                                        <span class="symbol-label">
                                            <span class="svg-icon svg-icon-2x svg-icon-dark-50">
                                                <!--begin::Svg Icon | path:assets/media/svg/icons/Home/Globe.svg-->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                        <rect x="0" y="0" width="24" height="24"></rect>
                                                        <path d="M13,18.9450712 L13,20 L14,20 C15.1045695,20 16,20.8954305 16,22 L8,22 C8,20.8954305 8.8954305,20 10,20 L11,20 L11,18.9448245 C9.02872877,18.7261967 7.20827378,17.866394 5.79372555,16.5182701 L4.73856106,17.6741866 C4.36621808,18.0820826 3.73370941,18.110904 3.32581341,17.7385611 C2.9179174,17.3662181 2.88909597,16.7337094 3.26143894,16.3258134 L5.04940685,14.367122 C5.46150313,13.9156769 6.17860937,13.9363085 6.56406875,14.4106998 C7.88623094,16.037907 9.86320756,17 12,17 C15.8659932,17 19,13.8659932 19,10 C19,7.73468744 17.9175842,5.65198725 16.1214335,4.34123851 C15.6753081,4.01567657 15.5775721,3.39010038 15.903134,2.94397499 C16.228696,2.49784959 16.8542722,2.4001136 17.3003976,2.72567554 C19.6071362,4.40902808 21,7.08906798 21,10 C21,14.6325537 17.4999505,18.4476269 13,18.9450712 Z" fill="#000000" fill-rule="nonzero"></path>
                                                        <circle fill="#000000" opacity="0.3" cx="12" cy="10" r="6"></circle>
                                                    </g>
                                                </svg>
                                                <!--end::Svg Icon-->
                                            </span>
                                        </span>
                                    </div>
                                    <!--end::Symbol-->
                                    <!--begin::Text-->
                                    <div class="d-flex flex-column flex-grow-1">
                                        <a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Assesment Hours</a>
                                        <span class="text-muted font-weight-bold">Practical Assessment</span>
                                    </div>
                                    <!--end::Text-->
                                    <!--begin::label-->
                                    <span class="font-weight-bolder label label-xl label-light-primary label-inline py-5 min-w-45px">7-4</span>
                                    <!--end::label-->
                                </div>
                                <!--end::Item-->
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--eng::Container-->
                        <!--begin::Footer-->
                        <div class="d-flex flex-center" id="kt_sticky_toolbar_chat_toggler" data-toggle="tooltip" title="" data-placement="right" data-original-title="Chat Example">
                          <a class="btn btn-primary font-weight-bolder font-size-sm py-3 px-14" data-target="#kt_chat_modal" href="student-chat-view.aspx">Contact Teacher</a>

                        </div>
                        <!--end::Footer-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Body-->
            </div>
        </div>
        <div class="col-4">
            <!--begin::Nav Panel Widget 4-->
            <div class="card card-custom gutter-b">
                <!--begin::Body-->
                <div class="card-body">
                    <!--begin::Wrapper-->
                    <div class="d-flex justify-content-between flex-column h-100">
                        <!--begin::Container-->
                        <div class="h-100">
                            <!--begin::Header-->
                            <div class="d-flex flex-column flex-center">
                                <!--begin::Image-->
                                <div class="bgi-no-repeat bgi-size-cover rounded min-h-180px w-100" style="background-image: url(/Pages/assets/media/stock-600x400/css-introduction.png)"></div>
                                <!--end::Image-->
                                <!--begin::Title-->
                                <a href="class.aspx" class="card-title font-weight-bolder text-dark-75 text-hover-primary font-size-h4 m-0 pt-7 pb-1" id="A1" runat="server">Introduction to CSS</a>
                                <!--end::Title-->
                                <!--begin::Text-->
                                <div class="font-weight-bold text-dark-50 font-size-sm pb-7">13:20-15:00, Kevin Powell</div>
                                <!--end::Text-->
                            </div>
                            <!--end::Header-->
                            <!--begin::Body-->
                            <div class="pt-1">
                          
                                <!--begin::Item-->
                                <div class="d-flex align-items-center pb-9">
                                    <!--begin::Symbol-->
                                    <div class="symbol symbol-45 symbol-light mr-4">
                                        <span class="symbol-label">
                                            <span class="svg-icon svg-icon-2x svg-icon-dark-50">
                                                <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Group.svg-->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                        <polygon points="0 0 24 0 24 24 0 24"></polygon>
                                                        <path d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                                        <path d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"></path>
                                                    </g>
                                                </svg>
                                                <!--end::Svg Icon-->
                                            </span>
                                        </span>
                                    </div>
                                    <!--end::Symbol-->
                                    <!--begin::Text-->
                                    <div class="d-flex flex-column flex-grow-1">
                                        <a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Guest Lecturer</a>
                                        <span class="text-muted font-weight-bold">Appearance from CSS King Kevin Powell</span>
                                    </div>
                                    <!--end::Text-->
                                   
                                </div>
                                <!--end::Item-->
                          
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--eng::Container-->
                        <!--begin::Footer-->
                        <div class="d-flex flex-center" id="kt_sticky_toolbar_chat_toggler" data-toggle="tooltip" title="" data-placement="right" data-original-title="Chat Example">
                          <a class="btn btn-primary font-weight-bolder font-size-sm py-3 px-14" data-target="#kt_chat_modal" href="student-chat-view.aspx">Contact Teacher</a>
                        </div>
                        <!--end::Footer-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Body-->
            </div>
            <!--end::Nav Panel Widget 4-->
        </div>
        <div class="col-4">
            <!--begin::Nav Panel Widget 4-->
            <div class="card card-custom gutter-b">
                <!--begin::Body-->
                <div class="card-body">
                    <!--begin::Wrapper-->
                    <div class="d-flex justify-content-between flex-column h-100">
                        <!--begin::Container-->
                        <div class="h-100">
                            <!--begin::Header-->
                            <div class="d-flex flex-column flex-center">
                                <!--begin::Image-->
                                <div class="bgi-no-repeat bgi-size-cover rounded min-h-180px w-100" style="background-image: url(/Pages/assets/media/stock-600x400/intro-js.png)"></div>
                                <!--end::Image-->
                                <!--begin::Title-->
                                <a href="class.aspx" class="card-title font-weight-bolder text-dark-75 text-hover-primary font-size-h4 m-0 pt-7 pb-1" id="A4" runat="server">Introduction To Javascript</a>
                                <!--end::Title-->
                                <!--begin::Text-->
                                <div class="font-weight-bold text-dark-50 font-size-sm pb-7">8:20- 9:30, Kalle Halden</div>
                                <!--end::Text-->
                            </div>
                            <!--end::Header-->
                            <!--begin::Body-->
                            <div class="pt-1">
                                <!--begin::Item-->
                                <div class="d-flex align-items-center pb-9">
                                    <!--begin::Symbol-->
                                    <div class="symbol symbol-45 symbol-light mr-4">
                                        <span class="symbol-label">
                                            <span class="svg-icon svg-icon-2x svg-icon-dark-50">
                                                <!--begin::Svg Icon | path:assets/media/svg/icons/Media/Equalizer.svg-->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                        <rect x="0" y="0" width="24" height="24"></rect>
                                                        <rect fill="#000000" opacity="0.3" x="13" y="4" width="3" height="16" rx="1.5"></rect>
                                                        <rect fill="#000000" x="8" y="9" width="3" height="11" rx="1.5"></rect>
                                                        <rect fill="#000000" x="18" y="11" width="3" height="9" rx="1.5"></rect>
                                                        <rect fill="#000000" x="3" y="13" width="3" height="7" rx="1.5"></rect>
                                                    </g>
                                                </svg>
                                                <!--end::Svg Icon-->
                                            </span>
                                        </span>
                                    </div>
                                    <!--end::Symbol-->
                                    <!--begin::Text-->
                                    <div class="d-flex flex-column flex-grow-1">
                                        <a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Using the keyboard in game</a>
                                        <span class="text-muted font-weight-bold">Tutorial</span>
                                    </div>
                                    <!--end::Text-->
                                    <!--begin::label-->
                                    <span class="font-weight-bolder label label-xl label-light-success label-inline px-3 py-5 min-w-45px">3</span>
                                    <!--end::label-->
                                </div>
                                <!--end::Item-->
                                
                                <!--begin::Item-->
                                <div class="d-flex align-items-center pb-9">
                                    <!--begin::Symbol-->
                                    <div class="symbol symbol-45 symbol-light mr-4">
                                        <span class="symbol-label">
                                            <span class="svg-icon svg-icon-2x svg-icon-dark-50">
                                                <!--begin::Svg Icon | path:assets/media/svg/icons/Home/Globe.svg-->
                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                        <rect x="0" y="0" width="24" height="24"></rect>
                                                        <path d="M13,18.9450712 L13,20 L14,20 C15.1045695,20 16,20.8954305 16,22 L8,22 C8,20.8954305 8.8954305,20 10,20 L11,20 L11,18.9448245 C9.02872877,18.7261967 7.20827378,17.866394 5.79372555,16.5182701 L4.73856106,17.6741866 C4.36621808,18.0820826 3.73370941,18.110904 3.32581341,17.7385611 C2.9179174,17.3662181 2.88909597,16.7337094 3.26143894,16.3258134 L5.04940685,14.367122 C5.46150313,13.9156769 6.17860937,13.9363085 6.56406875,14.4106998 C7.88623094,16.037907 9.86320756,17 12,17 C15.8659932,17 19,13.8659932 19,10 C19,7.73468744 17.9175842,5.65198725 16.1214335,4.34123851 C15.6753081,4.01567657 15.5775721,3.39010038 15.903134,2.94397499 C16.228696,2.49784959 16.8542722,2.4001136 17.3003976,2.72567554 C19.6071362,4.40902808 21,7.08906798 21,10 C21,14.6325537 17.4999505,18.4476269 13,18.9450712 Z" fill="#000000" fill-rule="nonzero"></path>
                                                        <circle fill="#000000" opacity="0.3" cx="12" cy="10" r="6"></circle>
                                                    </g>
                                                </svg>
                                                <!--end::Svg Icon-->
                                            </span>
                                        </span>
                                    </div>
                                    <!--end::Symbol-->
                                    <!--begin::Text-->
                                    <div class="d-flex flex-column flex-grow-1">
                                        <a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Discussion</a>
                                        
                                    </div>
                                    <!--end::Text-->
                                    <!--begin::label-->
                                    <span class="font-weight-bolder label label-xl label-light-primary label-inline py-5 min-w-45px">unlimitted</span>
                                    <!--end::label-->
                                </div>
                                <!--end::Item-->
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--eng::Container-->
                        <!--begin::Footer-->
                        <div class="d-flex flex-center" id="kt_sticky_toolbar_chat_toggler" data-toggle="tooltip" title="" data-placement="right" data-original-title="Chat Example">
                          <a class="btn btn-primary font-weight-bolder font-size-sm py-3 px-14" data-target="#kt_chat_modal" href="student-chat-view.aspx">Contact Teacher</a>
                        </div>
                        <!--end::Footer-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Body-->
            </div>
            <!--end::Nav Panel Widget 4-->
        </div>

    </div>








</asp:Content>
