<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin-lecturer-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.admin.admin_lecturer_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
						<!--begin::Subheader-->
						<div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
							<div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
								<!--begin::Details-->
								<div class="d-flex align-items-center flex-wrap mr-2">
									<!--begin::Title-->
									<h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">New User</h5>
									<!--end::Title-->
									<!--begin::Separator-->
									<div class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-5 bg-gray-200"></div>
									<!--end::Separator-->
									<!--begin::Search Form-->
									<div class="d-flex align-items-center" id="kt_subheader_search">
										<span class="text-dark-50 font-weight-bold" id="kt_subheader_total">Enter user details and submit</span>
									</div>
									<!--end::Search Form-->
								</div>
								<!--end::Details-->
								<!--begin::Toolbar-->
								<div class="d-flex align-items-center">
									<!--begin::Button-->
									<a href="#" class="btn btn-default font-weight-bold btn-sm px-3 font-size-base">Back</a>
									<!--end::Button-->
									<!--begin::Dropdown-->
									<div class="btn-group ml-2">
										<button type="button" class="btn btn-primary font-weight-bold btn-sm px-3 font-size-base" runat="server" onclick="btnSubmit_OnClick()">Submit</button>
										<button type="button" class="btn btn-primary font-weight-bold btn-sm px-3 font-size-base dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
										<div class="dropdown-menu dropdown-menu-sm p-0 m-0 dropdown-menu-right">
											<ul class="navi py-5">
												<li class="navi-item">
													<a href="#" class="navi-link">
														<span class="navi-icon">
															<i class="flaticon2-writing"></i>
														</span>
														<span class="navi-text">Save &amp; continue</span>
													</a>
												</li>
												<li class="navi-item">
													<a href="#" class="navi-link">
														<span class="navi-icon">
															<i class="flaticon2-medical-records"></i>
														</span>
														<span class="navi-text">Save &amp; add new</span>
													</a>
												</li>
												<li class="navi-item">
													<a href="#" class="navi-link">
														<span class="navi-icon">
															<i class="flaticon2-hourglass-1"></i>
														</span>
														<span class="navi-text">Save &amp; exit</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
									<!--end::Dropdown-->
								</div>
								<!--end::Toolbar-->
							</div>
						</div>
						<!--end::Subheader-->
						<!--begin::Entry-->
						<div class="d-flex flex-column-fluid">
							<!--begin::Container-->
							<div class="container">
								<!--begin::Card-->
								<div class="card card-custom card-transparent">
									<div class="card-body p-0">
										<!--begin::Wizard-->
										<div class="wizard wizard-4" id="kt_wizard" data-wizard-state="first" data-wizard-clickable="true">
											<!--begin::Wizard Nav-->
											<div class="wizard-nav">
												<div class="wizard-steps">
													<div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
														<div class="wizard-wrapper">
															<div class="wizard-number">1</div>
															<div class="wizard-label">
																<div class="wizard-title">Profile</div>
																<div class="wizard-desc">User's Personal Information</div>
															</div>
														</div>
													</div>
													<%--<div class="wizard-step" data-wizard-type="step" data-wizard-state="pending">
														<div class="wizard-wrapper">
															<div class="wizard-number">2</div>
															<div class="wizard-label">
																<div class="wizard-title">Account</div>
																<div class="wizard-desc">User's Account &amp; Settings</div>
															</div>
														</div>
													</div>--%>
													<%--<div class="wizard-step" data-wizard-type="step" data-wizard-state="pending">
														<div class="wizard-wrapper">
															<div class="wizard-number">3</div>
															<div class="wizard-label">
																<div class="wizard-title">Address</div>
																<div class="wizard-desc">User's Shipping Address</div>
															</div>
														</div>
													</div>--%>
													<%--<div class="wizard-step" data-wizard-type="step" data-wizard-state="pending">
														<div class="wizard-wrapper">
															<div class="wizard-number">4</div>
															<div class="wizard-label">
																<div class="wizard-title">Submission</div>
																<div class="wizard-desc">Review and Submit</div>
															</div>
														</div>
													</div>
												</div>--%>
											</div>
											<!--end::Wizard Nav-->
											<!--begin::Card-->
											<div class="card card-custom card-shadowless rounded-top-0">
												<!--begin::Body-->
												<div class="card-body p-0">
													<div class="row justify-content-center py-8 px-8 py-lg-15 px-lg-10">
														<div class="col-xl-12 col-xxl-10">
															<!--begin::Wizard Form-->
															<form class="form fv-plugins-bootstrap fv-plugins-framework" id="kt_form">
																<div class="row justify-content-center">
																	<div class="col-xl-9">
																		<!--begin::Wizard Step 1-->
																		<div class="my-5 step" data-wizard-type="step-content" data-wizard-state="current">
																			<h5 class="text-dark font-weight-bold mb-10">User's Profile Details:</h5>
																			<!--begin::Group-->
																			<div class="form-group row">
																				<label class="col-xl-3 col-lg-3 col-form-label text-left">Avatar</label>
																				<div class="col-lg-9 col-xl-9">
																					<div class="image-input image-input-outline" id="kt_user_add_avatar">
																						<div class="image-input-wrapper" style="background-image: url(assets/media/users/100_6.jpg)"></div>
																						<label class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="change" data-toggle="tooltip" title="" data-original-title="Change avatar">
																							<i class="fa fa-pen icon-sm text-muted"></i>
																							<input type="file" name="profile_avatar" accept=".png, .jpg, .jpeg">
																							<input type="hidden" name="profile_avatar_remove">
																						</label>
																						<span class="btn btn-xs btn-icon btn-circle btn-white btn-hover-text-primary btn-shadow" data-action="cancel" data-toggle="tooltip" title="" data-original-title="Cancel avatar">
																							<i class="ki ki-bold-close icon-xs text-muted"></i>
																						</span>
																					</div>
																				</div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-xl-3 col-lg-3 col-form-label">First Name</label>
																				<div class="col-lg-9 col-xl-9">
																					<input class="form-control form-control-solid form-control-lg" id="txtfrstname" name="firstname" type="text" value="" runat="server">
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-xl-3 col-lg-3 col-form-label">Last Name</label>
																				<div class="col-lg-9 col-xl-9">
																					<input class="form-control form-control-solid form-control-lg" id="txtLstname" name="lastname" type="text" value="" runat="server">
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-xl-3 col-lg-3 col-form-label">Email Address</label>
																				<div class="col-lg-9 col-xl-9">
																					<div class="input-group input-group-solid input-group-lg">
																						<div class="input-group-prepend">
																							<span class="input-group-text">
																								<i class="la la-at"></i>
																							</span>
																						</div>
																						<input type="text" class="form-control form-control-solid form-control-lg" id="txtEmail" name="email" value="" runat="server">
																					</div>
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<%--<div class="form-group row fv-plugins-icon-container">
																				<label class="col-xl-3 col-lg-3 col-form-label">Company Site</label>
																				<div class="col-lg-9 col-xl-9">
																					<div class="input-group input-group-solid input-group-lg">
																						<input type="text" class="form-control form-control-solid form-control-lg" name="companywebsite" placeholder="Username" value="loop">
																						<div class="input-group-append">
																							<span class="input-group-text">.com</span>
																						</div>
																					</div>--%>
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																		</div>
																		<!--end::Wizard Step 1-->
																		<div class="my-5 step" data-wizard-type="step-content">
																			<h5 class="text-dark font-weight-bold mb-10 mt-5">User's Account Details</h5>
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-form-label col-xl-3 col-lg-3">Language</label>
																				<div class="col-xl-9 col-lg-9">
																					<select class="form-control form-control-lg form-control-solid" name="language">
																						<option value="">Select Language...</option>
																						<option value="id">Bahasa Indonesia - Indonesian</option>
																						<option value="msa">Bahasa Melayu - Malay</option>
																						<option value="ca">Català - Catalan</option>
																						<option value="cs">Čeština - Czech</option>
																						<option value="da">Dansk - Danish</option>
																						<option value="de">Deutsch - German</option>
																						<option value="en" selected="selected">English</option>
																						<option value="en-gb">English UK - British English</option>
																						<option value="es">Español - Spanish</option>
																						<option value="eu">Euskara - Basque (beta)</option>
																						<option value="fil">Filipino</option>
																						<option value="fr">Français - French</option>
																						<option value="ga">Gaeilge - Irish (beta)</option>
																						<option value="gl">Galego - Galician (beta)</option>
																						<option value="hr">Hrvatski - Croatian</option>
																						<option value="it">Italiano - Italian</option>
																						<option value="hu">Magyar - Hungarian</option>
																						<option value="nl">Nederlands - Dutch</option>
																						<option value="no">Norsk - Norwegian</option>
																						<option value="pl">Polski - Polish</option>
																						<option value="pt">Português - Portuguese</option>
																						<option value="ro">Română - Romanian</option>
																						<option value="sk">Slovenčina - Slovak</option>
																						<option value="fi">Suomi - Finnish</option>
																						<option value="sv">Svenska - Swedish</option>
																						<option value="vi">Tiếng Việt - Vietnamese</option>
																						<option value="tr">Türkçe - Turkish</option>
																						<option value="el">Ελληνικά - Greek</option>
																						<option value="bg">Български език - Bulgarian</option>
																						<option value="ru">Русский - Russian</option>
																						<option value="sr">Српски - Serbian</option>
																						<option value="uk">Українська мова - Ukrainian</option>
																						<option value="he">עִבְרִית - Hebrew</option>
																						<option value="ur">اردو - Urdu (beta)</option>
																						<option value="ar">العربية - Arabic</option>
																						<option value="fa">فارسی - Persian</option>
																						<option value="mr">मराठी - Marathi</option>
																						<option value="hi">हिन्दी - Hindi</option>
																						<option value="bn">বাংলা - Bangla</option>
																						<option value="gu">ગુજરાતી - Gujarati</option>
																						<option value="ta">தமிழ் - Tamil</option>
																						<option value="kn">ಕನ್ನಡ - Kannada</option>
																						<option value="th">ภาษาไทย - Thai</option>
																						<option value="ko">한국어 - Korean</option>
																						<option value="ja">日本語 - Japanese</option>
																						<option value="zh-cn">简体中文 - Simplified Chinese</option>
																						<option value="zh-tw">繁體中文 - Traditional Chinese</option>
																					</select>
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-form-label col-xl-3 col-lg-3">Time Zone</label>
																				<div class="col-xl-9 col-lg-9">
																					<select class="form-control form-control-lg form-control-solid" name="timezone">
																						<option data-offset="-39600" value="International Date Line West">(GMT-11:00) International Date Line West</option>
																						<option data-offset="-39600" value="Midway Island">(GMT-11:00) Midway Island</option>
																						<option data-offset="-39600" value="Samoa">(GMT-11:00) Samoa</option>
																						<option data-offset="-36000" value="Hawaii">(GMT-10:00) Hawaii</option>
																						<option data-offset="-28800" value="Alaska">(GMT-08:00) Alaska</option>
																						<option data-offset="-25200" value="Pacific Time (US &amp; Canada)">(GMT-07:00) Pacific Time (US &amp; Canada)</option>
																						<option data-offset="-25200" value="Tijuana">(GMT-07:00) Tijuana</option>
																						<option data-offset="-25200" value="Arizona">(GMT-07:00) Arizona</option>
																						<option data-offset="-21600" value="Mountain Time (US &amp; Canada)">(GMT-06:00) Mountain Time (US &amp; Canada)</option>
																						<option data-offset="-21600" value="Chihuahua">(GMT-06:00) Chihuahua</option>
																						<option data-offset="-21600" value="Mazatlan">(GMT-06:00) Mazatlan</option>
																						<option data-offset="-21600" value="Saskatchewan">(GMT-06:00) Saskatchewan</option>
																						<option data-offset="-21600" value="Central America">(GMT-06:00) Central America</option>
																						<option data-offset="-18000" value="Central Time (US &amp; Canada)">(GMT-05:00) Central Time (US &amp; Canada)</option>
																						<option data-offset="-18000" value="Guadalajara">(GMT-05:00) Guadalajara</option>
																						<option data-offset="-18000" value="Mexico City">(GMT-05:00) Mexico City</option>
																						<option data-offset="-18000" value="Monterrey">(GMT-05:00) Monterrey</option>
																						<option data-offset="-18000" value="Bogota">(GMT-05:00) Bogota</option>
																						<option data-offset="-18000" value="Lima">(GMT-05:00) Lima</option>
																						<option data-offset="-18000" value="Quito">(GMT-05:00) Quito</option>
																						<option data-offset="-14400" value="Eastern Time (US &amp; Canada)">(GMT-04:00) Eastern Time (US &amp; Canada)</option>
																						<option data-offset="-14400" value="Indiana (East)">(GMT-04:00) Indiana (East)</option>
																						<option data-offset="-14400" value="Caracas">(GMT-04:00) Caracas</option>
																						<option data-offset="-14400" value="La Paz">(GMT-04:00) La Paz</option>
																						<option data-offset="-14400" value="Georgetown">(GMT-04:00) Georgetown</option>
																						<option data-offset="-10800" value="Atlantic Time (Canada)">(GMT-03:00) Atlantic Time (Canada)</option>
																						<option data-offset="-10800" value="Santiago">(GMT-03:00) Santiago</option>
																						<option data-offset="-10800" value="Brasilia">(GMT-03:00) Brasilia</option>
																						<option data-offset="-10800" value="Buenos Aires">(GMT-03:00) Buenos Aires</option>
																						<option data-offset="-9000" value="Newfoundland">(GMT-02:30) Newfoundland</option>
																						<option data-offset="-7200" value="Greenland">(GMT-02:00) Greenland</option>
																						<option data-offset="-7200" value="Mid-Atlantic">(GMT-02:00) Mid-Atlantic</option>
																						<option data-offset="-3600" value="Cape Verde Is.">(GMT-01:00) Cape Verde Is.</option>
																						<option data-offset="0" value="Azores">(GMT) Azores</option>
																						<option data-offset="0" value="Monrovia">(GMT) Monrovia</option>
																						<option data-offset="0" value="UTC">(GMT) UTC</option>
																						<option data-offset="3600" value="Dublin">(GMT+01:00) Dublin</option>
																						<option data-offset="3600" value="Edinburgh">(GMT+01:00) Edinburgh</option>
																						<option data-offset="3600" value="Lisbon">(GMT+01:00) Lisbon</option>
																						<option data-offset="3600" value="London">(GMT+01:00) London</option>
																						<option data-offset="3600" value="Casablanca">(GMT+01:00) Casablanca</option>
																						<option data-offset="3600" value="West Central Africa">(GMT+01:00) West Central Africa</option>
																						<option data-offset="7200" value="Belgrade">(GMT+02:00) Belgrade</option>
																						<option data-offset="7200" value="Bratislava">(GMT+02:00) Bratislava</option>
																						<option data-offset="7200" value="Budapest">(GMT+02:00) Budapest</option>
																						<option data-offset="7200" value="Ljubljana">(GMT+02:00) Ljubljana</option>
																						<option data-offset="7200" value="Prague">(GMT+02:00) Prague</option>
																						<option data-offset="7200" value="Sarajevo">(GMT+02:00) Sarajevo</option>
																						<option data-offset="7200" value="Skopje">(GMT+02:00) Skopje</option>
																						<option data-offset="7200" value="Warsaw">(GMT+02:00) Warsaw</option>
																						<option data-offset="7200" value="Zagreb">(GMT+02:00) Zagreb</option>
																						<option data-offset="7200" value="Brussels">(GMT+02:00) Brussels</option>
																						<option data-offset="7200" value="Copenhagen">(GMT+02:00) Copenhagen</option>
																						<option data-offset="7200" value="Madrid">(GMT+02:00) Madrid</option>
																						<option data-offset="7200" value="Paris">(GMT+02:00) Paris</option>
																						<option data-offset="7200" value="Amsterdam">(GMT+02:00) Amsterdam</option>
																						<option data-offset="7200" value="Berlin">(GMT+02:00) Berlin</option>
																						<option data-offset="7200" value="Bern">(GMT+02:00) Bern</option>
																						<option data-offset="7200" value="Rome">(GMT+02:00) Rome</option>
																						<option data-offset="7200" value="Stockholm">(GMT+02:00) Stockholm</option>
																						<option data-offset="7200" value="Vienna">(GMT+02:00) Vienna</option>
																						<option data-offset="7200" value="Cairo">(GMT+02:00) Cairo</option>
																						<option data-offset="7200" value="Harare">(GMT+02:00) Harare</option>
																						<option data-offset="7200" value="Pretoria">(GMT+02:00) Pretoria</option>
																						<option data-offset="10800" value="Bucharest">(GMT+03:00) Bucharest</option>
																						<option data-offset="10800" value="Helsinki">(GMT+03:00) Helsinki</option>
																						<option data-offset="10800" value="Kiev">(GMT+03:00) Kiev</option>
																						<option data-offset="10800" value="Kyiv">(GMT+03:00) Kyiv</option>
																						<option data-offset="10800" value="Riga">(GMT+03:00) Riga</option>
																						<option data-offset="10800" value="Sofia">(GMT+03:00) Sofia</option>
																						<option data-offset="10800" value="Tallinn">(GMT+03:00) Tallinn</option>
																						<option data-offset="10800" value="Vilnius">(GMT+03:00) Vilnius</option>
																						<option data-offset="10800" value="Athens">(GMT+03:00) Athens</option>
																						<option data-offset="10800" value="Istanbul">(GMT+03:00) Istanbul</option>
																						<option data-offset="10800" value="Minsk">(GMT+03:00) Minsk</option>
																						<option data-offset="10800" value="Jerusalem">(GMT+03:00) Jerusalem</option>
																						<option data-offset="10800" value="Moscow">(GMT+03:00) Moscow</option>
																						<option data-offset="10800" value="St. Petersburg">(GMT+03:00) St. Petersburg</option>
																						<option data-offset="10800" value="Volgograd">(GMT+03:00) Volgograd</option>
																						<option data-offset="10800" value="Kuwait">(GMT+03:00) Kuwait</option>
																						<option data-offset="10800" value="Riyadh">(GMT+03:00) Riyadh</option>
																						<option data-offset="10800" value="Nairobi">(GMT+03:00) Nairobi</option>
																						<option data-offset="10800" value="Baghdad">(GMT+03:00) Baghdad</option>
																						<option data-offset="14400" value="Abu Dhabi">(GMT+04:00) Abu Dhabi</option>
																						<option data-offset="14400" value="Muscat">(GMT+04:00) Muscat</option>
																						<option data-offset="14400" value="Baku">(GMT+04:00) Baku</option>
																						<option data-offset="14400" value="Tbilisi">(GMT+04:00) Tbilisi</option>
																						<option data-offset="14400" value="Yerevan">(GMT+04:00) Yerevan</option>
																						<option data-offset="16200" value="Tehran">(GMT+04:30) Tehran</option>
																						<option data-offset="16200" value="Kabul">(GMT+04:30) Kabul</option>
																						<option data-offset="18000" value="Ekaterinburg">(GMT+05:00) Ekaterinburg</option>
																						<option data-offset="18000" value="Islamabad">(GMT+05:00) Islamabad</option>
																						<option data-offset="18000" value="Karachi">(GMT+05:00) Karachi</option>
																						<option data-offset="18000" value="Tashkent">(GMT+05:00) Tashkent</option>
																						<option data-offset="19800" value="Chennai">(GMT+05:30) Chennai</option>
																						<option data-offset="19800" value="Kolkata">(GMT+05:30) Kolkata</option>
																						<option data-offset="19800" value="Mumbai">(GMT+05:30) Mumbai</option>
																						<option data-offset="19800" value="New Delhi">(GMT+05:30) New Delhi</option>
																						<option data-offset="19800" value="Sri Jayawardenepura">(GMT+05:30) Sri Jayawardenepura</option>
																						<option data-offset="20700" value="Kathmandu">(GMT+05:45) Kathmandu</option>
																						<option data-offset="21600" value="Astana">(GMT+06:00) Astana</option>
																						<option data-offset="21600" value="Dhaka">(GMT+06:00) Dhaka</option>
																						<option data-offset="21600" value="Almaty">(GMT+06:00) Almaty</option>
																						<option data-offset="21600" value="Urumqi">(GMT+06:00) Urumqi</option>
																						<option data-offset="23400" value="Rangoon">(GMT+06:30) Rangoon</option>
																						<option data-offset="25200" value="Novosibirsk">(GMT+07:00) Novosibirsk</option>
																						<option data-offset="25200" value="Bangkok">(GMT+07:00) Bangkok</option>
																						<option data-offset="25200" value="Hanoi">(GMT+07:00) Hanoi</option>
																						<option data-offset="25200" value="Jakarta">(GMT+07:00) Jakarta</option>
																						<option data-offset="25200" value="Krasnoyarsk">(GMT+07:00) Krasnoyarsk</option>
																						<option data-offset="28800" value="Beijing">(GMT+08:00) Beijing</option>
																						<option data-offset="28800" value="Chongqing">(GMT+08:00) Chongqing</option>
																						<option data-offset="28800" value="Hong Kong">(GMT+08:00) Hong Kong</option>
																						<option data-offset="28800" value="Kuala Lumpur">(GMT+08:00) Kuala Lumpur</option>
																						<option data-offset="28800" value="Singapore">(GMT+08:00) Singapore</option>
																						<option data-offset="28800" value="Taipei">(GMT+08:00) Taipei</option>
																						<option data-offset="28800" value="Perth">(GMT+08:00) Perth</option>
																						<option data-offset="28800" value="Irkutsk">(GMT+08:00) Irkutsk</option>
																						<option data-offset="28800" value="Ulaan Bataar">(GMT+08:00) Ulaan Bataar</option>
																						<option data-offset="32400" value="Seoul">(GMT+09:00) Seoul</option>
																						<option data-offset="32400" value="Osaka">(GMT+09:00) Osaka</option>
																						<option data-offset="32400" value="Sapporo">(GMT+09:00) Sapporo</option>
																						<option data-offset="32400" value="Tokyo">(GMT+09:00) Tokyo</option>
																						<option data-offset="32400" value="Yakutsk">(GMT+09:00) Yakutsk</option>
																						<option data-offset="34200" value="Darwin">(GMT+09:30) Darwin</option>
																						<option data-offset="34200" value="Adelaide">(GMT+09:30) Adelaide</option>
																						<option data-offset="36000" value="Canberra">(GMT+10:00) Canberra</option>
																						<option data-offset="36000" value="Melbourne">(GMT+10:00) Melbourne</option>
																						<option data-offset="36000" value="Sydney">(GMT+10:00) Sydney</option>
																						<option data-offset="36000" value="Brisbane">(GMT+10:00) Brisbane</option>
																						<option data-offset="36000" value="Hobart">(GMT+10:00) Hobart</option>
																						<option data-offset="36000" value="Vladivostok">(GMT+10:00) Vladivostok</option>
																						<option data-offset="36000" value="Guam">(GMT+10:00) Guam</option>
																						<option data-offset="36000" value="Port Moresby">(GMT+10:00) Port Moresby</option>
																						<option data-offset="36000" value="Solomon Is.">(GMT+10:00) Solomon Is.</option>
																						<option data-offset="39600" value="Magadan">(GMT+11:00) Magadan</option>
																						<option data-offset="39600" value="New Caledonia">(GMT+11:00) New Caledonia</option>
																						<option data-offset="43200" value="Fiji">(GMT+12:00) Fiji</option>
																						<option data-offset="43200" value="Kamchatka">(GMT+12:00) Kamchatka</option>
																						<option data-offset="43200" value="Marshall Is.">(GMT+12:00) Marshall Is.</option>
																						<option data-offset="43200" value="Auckland">(GMT+12:00) Auckland</option>
																						<option data-offset="43200" value="Wellington">(GMT+12:00) Wellington</option>
																						<option data-offset="46800" value="Nuku'alofa">(GMT+13:00) Nuku'alofa</option>
																					</select>
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row fv-plugins-icon-container">
																				<label class="col-form-label col-xl-3 col-lg-3">Communication</label>
																				<div class="col-xl-9 col-lg-9 col-form-label">
																					<div class="checkbox-inline">
																						<label class="checkbox">
																						<input name="communication" type="checkbox">
																						<span></span>Email</label>
																						<label class="checkbox">
																						<input name="communication" type="checkbox">
																						<span></span>SMS</label>
																						<label class="checkbox">
																						<input name="communication" type="checkbox">
																						<span></span>Phone</label>
																					</div>
																				<div class="fv-plugins-message-container"></div></div>
																			</div>
																			<!--end::Group-->
																			<div class="separator separator-dashed my-10"></div>
																			<h5 class="text-dark font-weight-bold mb-10">User's Account Settings</h5>
																			<!--begin::Group-->
																			<div class="form-group row">
																				<label class="col-form-label col-xl-3 col-lg-3">Login verification</label>
																				<div class="col-xl-9 col-lg-9">
																					<button type="button" class="btn btn-light-primary font-weight-bold btn-sm">Setup login verification</button>
																					<div class="form-text text-muted mt-3">After you log in, you will be asked for additional information to confirm your identity and protect your account from being compromised.
																					<a href="#">Learn more</a>.</div>
																				</div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row">
																				<label class="col-form-label col-xl-3 col-lg-3">Password reset verification</label>
																				<div class="col-xl-9 col-lg-9">
																					<div class="checkbox-inline">
																						<label class="checkbox mb-2">
																						<input type="checkbox">
																						<span></span>Require personal information to reset your password.</label>
																					</div>
																					<div class="form-text text-muted">For extra security, this requires you to confirm your email or phone number when you reset your password.
																					<a href="#" class="font-weight-bold">Learn more</a>.</div>
																				</div>
																			</div>
																			<!--end::Group-->
																			<!--begin::Group-->
																			<div class="form-group row mt-10">
																				<label class="col-xl-3 col-lg-3"></label>
																				<div class="col-xl-9 col-lg-9">
																					<button type="button" class="btn btn-light-danger font-weight-bold btn-sm">Deactivate your account ?</button>
																				</div>
																			</div>
																			<!--end::Group-->
																		</div>
																		<!--end::Wizard Step 2-->
																		<!--begin::Wizard Step 3-->
																		
																		<!--end::Wizard Step 3-->
																		
																		<!--begin::Wizard Actions-->
																		<div class="d-flex justify-content-between border-top pt-10 mt-15">
																			<div class="mr-2">
																				<button type="button" id="prev-step" class="btn btn-light-primary font-weight-bolder px-9 py-4" data-wizard-type="action-prev">Previous</button>
																			</div>
																			<div>
																				<button type="button" class="btn btn-success font-weight-bolder px-9 py-4" data-wizard-type="action-submit" runat="server" onclick="btnSubmit_OnClick">Submit</button>
																				<%--<--<button type="button" id="next-step" class="btn btn-primary font-weight-bolder px-9 py-4" data-wizard-type="action-next">Next</button>-->--%>
																			</div>
																		</div>
																		<!--end::Wizard Actions-->
																	</div>
																</div>
															<div></div><div></div><div></div></form>
															<!--end::Wizard Form-->
														</div>
													</div>
												</div>
												<!--end::Body-->
											</div>
											<!--end::Card-->
										</div>
										<!--end::Wizard-->
									</div>
								</div>
								<!--end::Card-->
							</div>
							<!--end::Container-->
						</div>
						<!--end::Entry-->
					</div>
</asp:Content>
