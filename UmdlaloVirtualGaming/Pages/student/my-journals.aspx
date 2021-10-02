<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="my-journals.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.my_journals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="card card-custom">
        <div class="card-header py-3">
            <div class="card-title">
                <span class="card-icon">
                    <span class="svg-icon svg-icon-md svg-icon-primary">
                        <!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Chart-bar1.svg-->
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <rect x="0" y="0" width="24" height="24"></rect>
                                <rect fill="#000000" opacity="0.3" x="12" y="4" width="3" height="13" rx="1.5"></rect>
                                <rect fill="#000000" opacity="0.3" x="7" y="9" width="3" height="8" rx="1.5"></rect>
                                <path d="M5,19 L20,19 C20.5522847,19 21,19.4477153 21,20 C21,20.5522847 20.5522847,21 20,21 L4,21 C3.44771525,21 3,20.5522847 3,20 L3,4 C3,3.44771525 3.44771525,3 4,3 C4.55228475,3 5,3.44771525 5,4 L5,19 Z" fill="#000000" fill-rule="nonzero"></path>
                                <rect fill="#000000" opacity="0.3" x="17" y="11" width="3" height="6" rx="1.5"></rect>
                            </g>
                        </svg>
                        <!--end::Svg Icon-->
                    </span>
                </span>
                <h3 class="card-label">Topics</h3>
            </div>
          
        </div>
        <div class="card-body">
            <!--begin: Search Form-->
            <!--begin::Search Form-->
            <div class="mt-2 mb-7">
                <div class="row align-items-center">
                    <div class="col-lg-9 col-xl-8">
                        <div class="row align-items-center">
                            <div class="col-md-4 my-2 my-md-0">
                                <div class="input-icon">
                                    <input type="text" class="form-control" placeholder="Search..." id="kt_datatable_search_query">
                                    <span>
                                        <i class="flaticon2-search-1 text-muted"></i>
                                    </span>
                                   
                                </div>
                              
                            </div>
                            <a href="#" class="btn btn-light-primary px-6 font-weight-bold">Search</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
                       
                    </div>
                </div>
            </div>
            <!--end::Search Form-->
            <!--end: Search Form-->
            <!--begin: Datatable-->
            <asp:GridView runat="server" ID="gvJournal" CssClass="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded"
                             
                          Style="text-align: center; word-wrap: break-word; " AllowPaging="True"
                          OnPageIndexChanging="gvJournal_OnPageIndexChanging"
                          OnRowCommand="gvJournal_OnRowCommand"
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
                                        Text="&#xf06e;" CommandArgument="<%# Container.DataItemIndex %>" UseSubmitBehavior="false"
                                        data-toggle="tooltip" data-placement="top" title="View"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                                    
                </Columns>
            </asp:GridView>

            <!--end: Datatable-->
        </div>
    </div>
</asp:Content>
