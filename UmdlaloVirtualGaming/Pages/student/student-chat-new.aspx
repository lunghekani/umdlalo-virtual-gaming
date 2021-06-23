<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-chat-new.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.student_chat_new" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
									<!--begin::Col-->
									<div class="col-xl-4">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body pt-4">
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
												<div class="d-flex align-items-center mb-7">
													<!--begin::Pic-->
													<div class="flex-shrink-0 mr-4 mt-lg-0 mt-3">
														<div class="symbol symbol-lg-75">
															<img alt="Pic" src="assets/media/users/300_1.jpg">
														</div>
														<div class="symbol symbol-lg-75 symbol-primary d-none">
															<span class="font-size-h3 font-weight-boldest">JM</span>
														</div>
													</div>
													<!--end::Pic-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4 mb-0">Luca Doncic</a>
														<span class="text-muted font-weight-bold">Head of Development</span>
													</div>
												</div>
												<!--end::User-->
												<!--begin::Desc-->
												<p class="mb-7">I distinguish three
												<a href="#" class="text-primary pr-1">#XRS-54PQ</a>objectives First objectives and nice cooked rice</p>
												<!--end::Desc-->
												<!--begin::Info-->
												<div class="mb-7">
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Email:</span>
														<a href="#" class="text-muted text-hover-primary">luca@festudios.com</a>
													</div>
													<div class="d-flex justify-content-between align-items-cente my-1">
														<span class="text-dark-75 font-weight-bolder mr-2">Phone:</span>
														<a href="#" class="text-muted text-hover-primary">44(76)34254578</a>
													</div>
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Location:</span>
														<span class="text-muted font-weight-bold">Barcelona</span>
													</div>
												</div>
												<!--end::Info-->
												<a href="#" class="btn btn-block btn-sm btn-light-warning font-weight-bolder text-uppercase py-4" data-toggle="modal" data-target="#kt_chat_modal">write message</a>
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
									<!--begin::Col-->
									<div class="col-xl-4">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body pt-4">
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
												<div class="d-flex align-items-center mb-7">
													<!--begin::Pic-->
													<div class="flex-shrink-0 mr-4 mt-lg-0 mt-3">
														<div class="symbol symbol-lg-75">
															<img alt="Pic" src="assets/media/users/300_10.jpg">
														</div>
														<div class="symbol symbol-lg-75 symbol-primary d-none">
															<span class="font-size-h3 font-weight-boldest">JM</span>
														</div>
													</div>
													<!--end::Pic-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4 mb-0">Charlie Stone</a>
														<span class="text-muted font-weight-bold">Head of Development</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::User-->
												<!--begin::Desc-->
												<p class="mb-7">I distinguish three
												<a href="#" class="text-primary pr-1">#XRS-65PQ</a>objectives First
												<span class="text-dark-75 font-weight-bolder pr-1">USD342/Annual</span>doloremagna</p>
												<!--end::Desc-->
												<!--begin::Info-->
												<div class="mb-7">
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Email:</span>
														<a href="#" class="text-muted text-hover-primary">luca@festudios.com</a>
													</div>
													<div class="d-flex justify-content-between align-items-cente my-1">
														<span class="text-dark-75 font-weight-bolder mr-2">Phone:</span>
														<a href="#" class="text-muted text-hover-primary">44(76)34254578</a>
													</div>
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Location:</span>
														<span class="text-muted font-weight-bold">Barcelona</span>
													</div>
												</div>
												<!--end::Info-->
												<a href="#" class="btn btn-block btn-sm btn-light-danger font-weight-bolder text-uppercase py-4" data-toggle="modal" data-target="#kt_chat_modal">write message</a>
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
									<!--begin::Col-->
									<div class="col-xl-4">
										<!--begin::Card-->
										<div class="card card-custom gutter-b card-stretch">
											<!--begin::Body-->
											<div class="card-body pt-4">
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
												<div class="d-flex align-items-center mb-7">
													<!--begin::Pic-->
													<div class="flex-shrink-0 mr-4 mt-lg-0 mt-3">
														<div class="symbol symbol-lg-75 d-none">
															<img alt="Pic" src="assets/media/users/300_10.jpg">
														</div>
														<div class="symbol symbol-lg-75 symbol-primary">
															<span class="symbol-label font-size-h3 font-weight-boldest">AK</span>
														</div>
													</div>
													<!--end::Pic-->
													<!--begin::Title-->
													<div class="d-flex flex-column">
														<a href="#" class="text-dark font-weight-bold text-hover-primary font-size-h4 mb-0">Anna Krox</a>
														<span class="text-muted font-weight-bold">Python Developer</span>
													</div>
													<!--end::Title-->
												</div>
												<!--end::User-->
												<!--begin::Desc-->
												<p class="mb-7">I distinguish three
												<a href="#" class="text-primary pr-1">#XRS-54PQ</a>objectives First merely first
												<span class="text-dark-75 font-weight-bolder pr-1">USD342/Annual</span></p>
												<!--end::Desc-->
												<!--begin::Info-->
												<div class="mb-7">
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Email:</span>
														<a href="#" class="text-muted text-hover-primary">giannis@fifestudios.com</a>
													</div>
													<div class="d-flex justify-content-between align-items-cente my-2">
														<span class="text-dark-75 font-weight-bolder mr-2">Phone:</span>
														<a href="#" class="text-muted text-hover-primary">52(43)56254826</a>
													</div>
													<div class="d-flex justify-content-between align-items-center">
														<span class="text-dark-75 font-weight-bolder mr-2">Location:</span>
														<span class="text-muted font-weight-bold">Moscow</span>
													</div>
												</div>
												<!--end::Info-->
												<a href="#" class="btn btn-block btn-sm btn-light-primary font-weight-bolder text-uppercase py-4" data-toggle="modal" data-target="#kt_chat_modal">write message</a>
											</div>
											<!--end::Body-->
										</div>
										<!--end::Card-->
									</div>
									<!--end::Col-->
								</div>
</asp:Content>
