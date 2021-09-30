<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="course-single.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.student.course_single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView runat="server" ID="gvTopics"
        CssClass="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded"
        Style="text-align: center; word-wrap: break-word;" AllowPaging="True"
        OnPageIndexChanging="gvTopics_OnPageIndexChanging"
        OnRowCommand="gvTopics_OnRowCommand"
        AlternatingRowStyle-BorderWidth="0px"
        align-content="center"
        DataKeyNames="ID">

        <AlternatingRowStyle BorderWidth="0px" CssClass="bottomBorder"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Action      
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button CommandName="View" runat="server" Class="btn btn-primary  fa"
                        Text="&#xf06e;" CommandArgument="<%# Container.DataItemIndex %>"
                        data-toggle="tooltip" data-placement="top" title="View" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
         <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
								<!--begin::Info-->
								<div class="d-flex align-items-center flex-wrap mr-1">
									<!--begin::Page Heading-->
									<div class="d-flex align-items-baseline flex-wrap mr-5">
										<!--begin::Page Title-->
										<h5 class="text-dark font-weight-bold my-1 mr-5">Utilities</h5>
										<!--end::Page Title-->
										<!--begin::Breadcrumb-->
										<ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
											<li class="breadcrumb-item text-muted">
												<a href="" class="text-muted">Features</a>
											</li>
											<li class="breadcrumb-item text-muted">
												<a href="" class="text-muted">Custom</a>
											</li>
											<li class="breadcrumb-item text-muted">
												<a href="" class="text-muted">Utilities</a>
											</li>
										</ul>
										<!--end::Breadcrumb-->
									</div>
									<!--end::Page Heading-->
								</div>
								<!--end::Info-->
							
							</div>
            </div>
                                <div class="d-flex align-items-center">
                                <!--begin::Input group-->
												<div class="position-relative w-md-400px me-md-2">
													<!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
													<span class="svg-icon svg-icon-3 svg-icon-gray-500 position-absolute top-50 translate-middle ms-6">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
															<rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black"></rect>
															<path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black"></path>
														</svg>
													</span>
													<!--end::Svg Icon-->
													<input type="text" class="form-control form-control-solid ps-10" name="search" value="" placeholder="Search">
												</div>
												<!--end::Input group-->
												<!--begin:Action-->
												<div class="d-flex align-items-center">
													<button type="submit" class="btn btn-primary me-5">Search</button>
												</div>
												<!--end:Action-->
								</div>


    </asp:GridView>
</asp:Content>
