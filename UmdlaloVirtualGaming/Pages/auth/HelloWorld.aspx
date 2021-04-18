<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HelloWorld.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.auth.HelloWorld" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card card-custom">
											<!--begin::Body-->
											<div class="card-body pt-15">
												<!--begin::User-->
												<div class="text-center mb-10">
													<div class="symbol symbol-60 symbol-circle symbol-xl-90">
														<div class="symbol-label" style="background-image:url('assets/media/users/300_21.jpg')"></div>
														<i class="symbol-badge symbol-badge-bottom bg-success"></i>
													</div>
													<h4 class="font-weight-bold my-2">James Jones</h4>
													<div class="text-muted mb-2">Application Developer</div>
													<span class="label label-light-warning label-inline font-weight-bold label-lg">Active</span>
												</div>
												<!--end::User-->
												<!--begin::Contact-->
												<div class="mb-10 text-center">
													<a href="#" class="btn btn-icon btn-circle btn-light-facebook mr-2">
														<i class="socicon-facebook"></i>
													</a>
													<a href="#" class="btn btn-icon btn-circle btn-light-twitter mr-2">
														<i class="socicon-twitter"></i>
													</a>
													<a href="#" class="btn btn-icon btn-circle btn-light-google">
														<i class="socicon-google"></i>
													</a>
												</div>
												<!--end::Contact-->
												<!--begin::Nav-->
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block active">Profile Overview</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Personal info</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Account Info</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Change Passwort</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Email Settings</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Saved Credit Cards</a>
												<a href="#" class="btn btn-hover-light-primary font-weight-bold py-3 px-6 mb-2 text-center btn-block">Tax information</a>
												<!--end::Nav-->
											</div>
											<!--end::Body-->
										</div>
		<p> </p>

	<div class="row">
									<!--begin::Col-->
									<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body text-center pt-4">
												<!--begin::Toolbar-->
												<div class="d-flex justify-content-end">
													<div class="dropdown dropdown-inline" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
														<a href="#" class="btn btn-clean btn-hover-light-primary btn-sm btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															<i class="ki ki-bold-more-hor"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
															<!--begin::Navigation-->
															<ul class="navi navi-hover">
																<li class="navi-header font-weight-bold py-4">
																	<span class="font-size-lg">Choose Label:</span>
																	<i class="flaticon2-information icon-md text-muted" data-toggle="tooltip" data-placement="right" title="" data-original-title="Click to learn more..."></i>
																</li>
																<li class="navi-separator mb-3 opacity-70"></li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-text">
																			<span class="label label-xl label-inline label-light-success">Customer</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-text">
																			<span class="label label-xl label-inline label-light-danger">Partner</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-text">
																			<span class="label label-xl label-inline label-light-warning">Suplier</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-text">
																			<span class="label label-xl label-inline label-light-primary">Member</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-text">
																			<span class="label label-xl label-inline label-light-dark">Staff</span>
																		</span>
																	</a>
																</li>
																<li class="navi-separator mt-3 opacity-70"></li>
																<li class="navi-footer py-4">
																	<a class="btn btn-clean font-weight-bold btn-sm" href="#">
																	<i class="ki ki-plus icon-sm"></i>Add new</a>
																</li>
															</ul>
															<!--end::Navigation-->
														</div>
													</div>
												</div>
												<!--end::Toolbar-->
												<!--begin::User-->
												<div class="mt-7">
													<div class="symbol symbol-circle symbol-lg-75">
														<img src="assets/media/users/300_14.jpg" alt="image">
													</div>
													<div class="symbol symbol-lg-75 symbol-circle symbol-primary d-none">
														<span class="font-size-h3 font-weight-boldest">JB</span>
													</div>
												</div>
												<!--end::User-->
												<!--begin::Name-->
												<div class="my-2">
													<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4">John Beans</a>
												</div>
												<!--end::Name-->
												<!--begin::Label-->
												<span class="label label-inline label-lg label-light-warning btn-sm font-weight-bold">Active</span>
												<!--end::Label-->
												<!--begin::Buttons-->
												<div class="mt-9 mb-6">
													<a href="#" class="btn btn-md btn-icon btn-light-facebook btn-pill mx-2">
														<i class="socicon-facebook"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-twitter btn-pill mx-2">
														<i class="socicon-twitter"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-linkedin btn-pill mx-2">
														<i class="socicon-linkedin"></i>
													</a>
												</div>
												<!--end::Buttons-->
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
									<!--begin::Col-->
									<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body text-center pt-4">
												<!--begin::Toolbar-->
												<div class="d-flex justify-content-end">
													<div class="dropdown dropdown-inline" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
														<a href="#" class="btn btn-clean btn-hover-light-primary btn-sm btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															<i class="ki ki-bold-more-hor"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
															<!--begin::Navigation-->
															<ul class="navi navi-hover">
																<li class="navi-header pb-1">
																	<span class="text-primary text-uppercase font-weight-bold font-size-sm">Add new:</span>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-shopping-cart-1"></i>
																		</span>
																		<span class="navi-text">Order</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-calendar-8"></i>
																		</span>
																		<span class="navi-text">Event</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-graph-1"></i>
																		</span>
																		<span class="navi-text">Report</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-rocket-1"></i>
																		</span>
																		<span class="navi-text">Post</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-writing"></i>
																		</span>
																		<span class="navi-text">File</span>
																	</a>
																</li>
															</ul>
															<!--end::Navigation-->
														</div>
													</div>
												</div>
												<!--end::Toolbar-->
												<!--begin::User-->
												<div class="mt-7 pb-2">
													<div class="symbol symbol-circle symbol-lg-5 d-none">
														<img src="assets/media/users/300_1.jpg" alt="image">
													</div>
													<div class="symbol symbol-lg-75 symbol-circle symbol-light-success">
														<span class="font-size-h3 symbol-label font-weight-boldest">MP</span>
													</div>
												</div>
												<!--end::User-->
												<!--begin::Name-->
												<div class="my-2">
													<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4">Matt Pears</a>
												</div>
												<!--end::Name-->
												<!--begin::Label-->
												<a href="#" class="label label-inline label-lg label-light-danger font-weight-bold">Rejected</a>
												<!--end::Label-->
												<!--begin::Buttons-->
												<div class="mt-9 mb-6">
													<a href="#" class="btn btn-md btn-icon btn-light-facebook btn-pill mx-2">
														<i class="socicon-facebook"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-twitter btn-pill mx-2">
														<i class="socicon-twitter"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-linkedin btn-pill mx-2">
														<i class="socicon-linkedin"></i>
													</a>
												</div>
												<!--end::Buttons-->
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
									<!--begin::Col-->
									<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body text-center pt-4">
												<!--begin::Toolbar-->
												<div class="d-flex justify-content-end">
													<div class="dropdown dropdown-inline" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
														<a href="#" class="btn btn-clean btn-hover-light-primary btn-sm btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															<i class="ki ki-bold-more-hor"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
															<!--begin::Naviigation-->
															<ul class="navi">
																<li class="navi-header font-weight-bold py-5">
																	<span class="font-size-lg">Add New:</span>
																	<i class="flaticon2-information icon-md text-muted" data-toggle="tooltip" data-placement="right" title="" data-original-title="Click to learn more..."></i>
																</li>
																<li class="navi-separator mb-3 opacity-70"></li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-shopping-cart-1"></i>
																		</span>
																		<span class="navi-text">Order</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="navi-icon flaticon2-calendar-8"></i>
																		</span>
																		<span class="navi-text">Members</span>
																		<span class="navi-label">
																			<span class="label label-light-danger label-rounded font-weight-bold">3</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="navi-icon flaticon2-telegram-logo"></i>
																		</span>
																		<span class="navi-text">Project</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="navi-icon flaticon2-new-email"></i>
																		</span>
																		<span class="navi-text">Record</span>
																		<span class="navi-label">
																			<span class="label label-light-success label-rounded font-weight-bold">5</span>
																		</span>
																	</a>
																</li>
																<li class="navi-separator mt-3 opacity-70"></li>
																<li class="navi-footer pt-5 pb-4">
																	<a class="btn btn-light-primary font-weight-bolder btn-sm" href="#">More options</a>
																	<a class="btn btn-clean font-weight-bold btn-sm d-none" href="#" data-toggle="tooltip" data-placement="right" title="" data-original-title="Click to learn more...">Learn more</a>
																</li>
															</ul>
															<!--end::Naviigation-->
														</div>
													</div>
												</div>
												<!--end::Toolbar-->
												<!--begin::User-->
												<div class="mt-7">
													<div class="symbol symbol-circle symbol-lg-75">
														<img src="assets/media/users/300_11.jpg" alt="image">
													</div>
													<div class="symbol symbol-lg-75 symbol-circle symbol-primary">
														<span class="font-size-h3 symbol-label font-weight-boldest d-none">JM</span>
													</div>
												</div>
												<!--end::User-->
												<!--begin::Name-->
												<div class="my-2">
													<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4">Jessica Miles</a>
												</div>
												<!--end::Name-->
												<!--begin::Label-->
												<a href="#" class="label label-inline label-lg label-light-success font-weight-bold">Active</a>
												<!--end::Label-->
												<!--begin::Buttons-->
												<div class="mt-9 mb-6">
													<a href="#" class="btn btn-md btn-icon btn-light-facebook btn-pill mx-2">
														<i class="socicon-facebook"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-twitter btn-pill mx-2">
														<i class="socicon-twitter"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-linkedin btn-pill mx-2">
														<i class="socicon-linkedin"></i>
													</a>
												</div>
												<!--end::Buttons-->
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
									<!--begin::Col-->
									<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body text-center pt-4">
												<!--begin::Toolbar-->
												<div class="d-flex justify-content-end">
													<div class="dropdown dropdown-inline" data-toggle="tooltip" title="" data-placement="left" data-original-title="Quick actions">
														<a href="#" class="btn btn-clean btn-hover-light-primary btn-sm btn-icon" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															<i class="ki ki-bold-more-hor"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-md dropdown-menu-right">
															<!--begin::Navigation-->
															<ul class="navi navi-hover py-5">
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-drop"></i>
																		</span>
																		<span class="navi-text">New Group</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-list-3"></i>
																		</span>
																		<span class="navi-text">Contacts</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-rocket-1"></i>
																		</span>
																		<span class="navi-text">Groups</span>
																		<span class="navi-link-badge">
																			<span class="label label-light-primary label-inline font-weight-bold">new</span>
																		</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-bell-2"></i>
																		</span>
																		<span class="navi-text">Calls</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-gear"></i>
																		</span>
																		<span class="navi-text">Settings</span>
																	</a>
																</li>
																<li class="navi-separator my-3"></li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-magnifier-tool"></i>
																		</span>
																		<span class="navi-text">Help</span>
																	</a>
																</li>
																<li class="navi-item">
																	<a href="#" class="navi-link">
																		<span class="navi-icon">
																			<i class="flaticon2-bell-2"></i>
																		</span>
																		<span class="navi-text">Privacy</span>
																		<span class="navi-link-badge">
																			<span class="label label-light-danger label-rounded font-weight-bold">5</span>
																		</span>
																	</a>
																</li>
															</ul>
															<!--end::Navigation-->
														</div>
													</div>
												</div>
												<!--end::Toolbar-->
												<!--begin::User-->
												<div class="mt-7">
													<div class="symbol symbol-circle symbol-lg-75">
														<img src="assets/media/users/300_1.jpg" alt="image">
													</div>
													<div class="symbol symbol-lg-75 symbol-circle symbol-primary">
														<span class="font-size-h3 symbol-label font-weight-boldest d-none">AP</span>
													</div>
												</div>
												<!--end::User-->
												<!--begin::Name-->
												<div class="my-2">
													<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4">Antonio Pastore</a>
												</div>
												<!--end::Name-->
												<!--begin::Label-->
												<a href="#" class="label label-inline label-lg label-light-primary font-weight-bold">Active</a>
												<!--end::Label-->
												<!--begin::Buttons-->
												<div class="mt-9 mb-6">
													<a href="#" class="btn btn-md btn-icon btn-light-facebook btn-pill mx-2">
														<i class="socicon-facebook"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-twitter btn-pill mx-2">
														<i class="socicon-twitter"></i>
													</a>
													<a href="#" class="btn btn-md btn-icon btn-light-linkedin btn-pill mx-2">
														<i class="socicon-linkedin"></i>
													</a>
												</div>
												<!--end::Buttons-->
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
								</div>


    <h1>Hello World</h1>
    <div class="card card-custom">
        <div class="card-header">
            <div class="card-title">
                <span class="card-icon">
                    <i class="flaticon2-line-chart text-primary"></i>
                </span>
                <h3 class="card-label" id="hCardTitle" runat="server">Welcome to the NEW program
													<small>sub title</small></h3>
            </div>
        </div>
        <div class="card-body">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.</div>
    </div>
</asp:Content>