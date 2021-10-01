<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="class.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student._class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="row">
		<div class="col-xxl-12">
			<!--begin::Forms Widget 8-->
			<div class="card card-custom gutter-b">
				<!--begin::Body-->
				<div class="card-body">
					<!--begin::Top-->
					<div class="d-flex align-items-center">
						<!--begin::Symbol-->
						<div class="symbol symbol-45 symbol-light mr-5">
							<span class="symbol-label">
								<span class="svg-icon svg-icon-lg svg-icon-primary">
									<!--begin::Svg Icon | path:assets/media/svg/icons/General/Clipboard.svg-->
									<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24"></rect>
											<path d="M8,3 L8,3.5 C8,4.32842712 8.67157288,5 9.5,5 L14.5,5 C15.3284271,5 16,4.32842712 16,3.5 L16,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,21 C20,22.1045695 19.1045695,23 18,23 L6,23 C4.8954305,23 4,22.1045695 4,21 L4,5 C4,3.8954305 4.8954305,3 6,3 L8,3 Z" fill="#000000" opacity="0.3"></path>
											<path d="M11,2 C11,1.44771525 11.4477153,1 12,1 C12.5522847,1 13,1.44771525 13,2 L14.5,2 C14.7761424,2 15,2.22385763 15,2.5 L15,3.5 C15,3.77614237 14.7761424,4 14.5,4 L9.5,4 C9.22385763,4 9,3.77614237 9,3.5 L9,2.5 C9,2.22385763 9.22385763,2 9.5,2 L11,2 Z" fill="#000000"></path>
											<rect fill="#000000" opacity="0.3" x="7" y="10" width="5" height="2" rx="1"></rect>
											<rect fill="#000000" opacity="0.3" x="7" y="14" width="9" height="2" rx="1"></rect>
										</g>
									</svg>
									<!--end::Svg Icon-->
								</span>
							</span>
						</div>
						<!--end::Symbol-->
                </div>
						<!--begin::Info-->
						<div class="d-flex flex-column flex-grow-1">
							<a id="lblTopicName" runat="server" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">HTML Canvas</a>
							<div class="d-flex">
								<div class="d-flex align-items-center pr-5">
									<span class="svg-icon svg-icon-md svg-icon-primary pr-1">
										<!--begin::Svg Icon | path:assets/media/svg/icons/Home/Clock.svg-->
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24"></rect>
												<path d="M12,22 C7.02943725,22 3,17.9705627 3,13 C3,8.02943725 7.02943725,4 12,4 C16.9705627,4 21,8.02943725 21,13 C21,17.9705627 16.9705627,22 12,22 Z" fill="#000000" opacity="0.3"></path>
												<path d="M11.9630156,7.5 L12.0475062,7.5 C12.3043819,7.5 12.5194647,7.69464724 12.5450248,7.95024814 L13,12.5 L16.2480695,14.3560397 C16.403857,14.4450611 16.5,14.6107328 16.5,14.7901613 L16.5,15 C16.5,15.2109164 16.3290185,15.3818979 16.1181021,15.3818979 C16.0841582,15.3818979 16.0503659,15.3773725 16.0176181,15.3684413 L11.3986612,14.1087258 C11.1672824,14.0456225 11.0132986,13.8271186 11.0316926,13.5879956 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000"></path>
											</g>
										</svg>
										<!--end::Svg Icon-->
									</span>
									
								</div>
								<div class="d-flex align-items-center">
									<span class="svg-icon svg-icon-md svg-icon-primary pr-1">
										<!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-arrange.svg-->
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24"></rect>
												<path d="M5.5,4 L9.5,4 C10.3284271,4 11,4.67157288 11,5.5 L11,6.5 C11,7.32842712 10.3284271,8 9.5,8 L5.5,8 C4.67157288,8 4,7.32842712 4,6.5 L4,5.5 C4,4.67157288 4.67157288,4 5.5,4 Z M14.5,16 L18.5,16 C19.3284271,16 20,16.6715729 20,17.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,17.5 C13,16.6715729 13.6715729,16 14.5,16 Z" fill="#000000"></path>
												<path d="M5.5,10 L9.5,10 C10.3284271,10 11,10.6715729 11,11.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,11.5 C4,10.6715729 4.67157288,10 5.5,10 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,12.5 C20,13.3284271 19.3284271,14 18.5,14 L14.5,14 C13.6715729,14 13,13.3284271 13,12.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z" fill="#000000" opacity="0.3"></path>
											</g>
										</svg>
										<!--end::Svg Icon-->
									</span>
									<span id="lblDescription" runat="server" class="text-muted font-weight-bold">Introduction To HTML</span>
								</div>
							</div>
						</div>
						<!--end::Info-->
						
					</div>
					<!--end::Top-->
					<!--begin::Bottom-->
					<div class="pt-3">
						<!--begin::Text-->
						<div id="dvClassContent" runat="server"></div>
						<p class="text-dark-75 font-size-lg font-weight-normal pt-5 mb-2">The HTML <code>"<"canvas>" </code>element is displayed as a rectangular object on a web page:</p>
						<!--end::Text-->
						<!--begin::Description-->
						<p class="text-dark-75 font-size-lg font-weight-normal pt-5">
							<canvas style="border: solid"></canvas>
							<br />
							The canvas element is perfect for making games in HTML.

																The canvas element offers all the functionality you need for making games.

																Use JavaScript to draw, write, insert images, and more, onto the canvas.
															<br />
							<h3>.getContext("2d")</h3>
							The canvas element has a built-in object, called the getContext("2d") object, with methods and properties for drawing.

																You can learn more about the canvas element, and the getContext("2d") object, in our Canvas Tutorial.
																<br />
							<h3>Get Started</h3>
							To make a game, start by creating a gaming area, and make it ready for drawing:
															<span class="pt-7 d-block">Mr. Liam</span>
						</p>
						<!--end::Description-->

						<!--begin::Action-->
						<%--<a href="#" class="btn btn-hover-text-primary btn-hover-icon-primary btn-sm btn-text-dark-50 bg-hover-light-primary rounded font-weight-bolder font-size-sm p-2">
							<span class="svg-icon svg-icon-md svg-icon-dark-25 pr-2">
								<!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Group-chat.svg-->
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24"></rect>
										<path d="M16,15.6315789 L16,12 C16,10.3431458 14.6568542,9 13,9 L6.16183229,9 L6.16183229,5.52631579 C6.16183229,4.13107011 7.29290239,3 8.68814808,3 L20.4776218,3 C21.8728674,3 23.0039375,4.13107011 23.0039375,5.52631579 L23.0039375,13.1052632 L23.0206157,17.786793 C23.0215995,18.0629336 22.7985408,18.2875874 22.5224001,18.2885711 C22.3891754,18.2890457 22.2612702,18.2363324 22.1670655,18.1421277 L19.6565168,15.6315789 L16,15.6315789 Z" fill="#000000"></path>
										<path d="M1.98505595,18 L1.98505595,13 C1.98505595,11.8954305 2.88048645,11 3.98505595,11 L11.9850559,11 C13.0896254,11 13.9850559,11.8954305 13.9850559,13 L13.9850559,18 C13.9850559,19.1045695 13.0896254,20 11.9850559,20 L4.10078614,20 L2.85693427,21.1905292 C2.65744295,21.3814685 2.34093638,21.3745358 2.14999706,21.1750444 C2.06092565,21.0819836 2.01120804,20.958136 2.01120804,20.8293182 L2.01120804,18.32426 C1.99400175,18.2187196 1.98505595,18.1104045 1.98505595,18 Z M6.5,14 C6.22385763,14 6,14.2238576 6,14.5 C6,14.7761424 6.22385763,15 6.5,15 L11.5,15 C11.7761424,15 12,14.7761424 12,14.5 C12,14.2238576 11.7761424,14 11.5,14 L6.5,14 Z M9.5,16 C9.22385763,16 9,16.2238576 9,16.5 C9,16.7761424 9.22385763,17 9.5,17 L11.5,17 C11.7761424,17 12,16.7761424 12,16.5 C12,16.2238576 11.7761424,16 11.5,16 L9.5,16 Z" fill="#000000" opacity="0.3"></path>
									</g>
								</svg>
								<!--end::Svg Icon-->
							</span>24 Comments</a>
						<!--end::Action-->
					</div>
					<!--end::Bottom-->
					<!--begin::Separator-->
					<div class="separator separator-solid mt-6 mb-4"></div>
					<!--end::Separator-->
					<!--begin::Editor-->
					<form class="position-relative">
						<textarea id="kt_forms_widget_8_input" class="form-control border-0 p-0 pr-10 resize-none" rows="1" placeholder="Any Question?" style="overflow: hidden; overflow-wrap: break-word; height: 18px;"></textarea>
						<div class="position-absolute top-0 right-0 mt-n1 mr-n2">
							<span class="btn btn-icon btn-sm btn-hover-icon-primary">
								<i class="flaticon2-clip-symbol icon-ms"></i>
							</span>
						</div>
					</form>
					<!--edit::Editor-->--%>
				</div>
				<!--end::Body-->
			</div>
			<!--end::Forms Widget 8-->
			<!--begin::Forms Widget 9-->
			<div class="card card-custom gutter-b">
				<!--begin::Body-->
				<div class="card-body">
					<!--begin::Top-->
					<div class="d-flex align-items-center">
						<!--begin::Symbol-->
						<div class="symbol symbol-45 symbol-light mr-5">
							<span class="symbol-label">
								<span class="svg-icon svg-icon-lg svg-icon-primary">
									<!--begin::Svg Icon | path:assets/media/svg/icons/General/Clipboard.svg-->
									<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="0" y="0" width="24" height="24"></rect>
											<path d="M8,3 L8,3.5 C8,4.32842712 8.67157288,5 9.5,5 L14.5,5 C15.3284271,5 16,4.32842712 16,3.5 L16,3 L18,3 C19.1045695,3 20,3.8954305 20,5 L20,21 C20,22.1045695 19.1045695,23 18,23 L6,23 C4.8954305,23 4,22.1045695 4,21 L4,5 C4,3.8954305 4.8954305,3 6,3 L8,3 Z" fill="#000000" opacity="0.3"></path>
											<path d="M11,2 C11,1.44771525 11.4477153,1 12,1 C12.5522847,1 13,1.44771525 13,2 L14.5,2 C14.7761424,2 15,2.22385763 15,2.5 L15,3.5 C15,3.77614237 14.7761424,4 14.5,4 L9.5,4 C9.22385763,4 9,3.77614237 9,3.5 L9,2.5 C9,2.22385763 9.22385763,2 9.5,2 L11,2 Z" fill="#000000"></path>
											<rect fill="#000000" opacity="0.3" x="7" y="10" width="5" height="2" rx="1"></rect>
											<rect fill="#000000" opacity="0.3" x="7" y="14" width="9" height="2" rx="1"></rect>
										</g>
									</svg>
									<!--end::Svg Icon-->
								</span>
							</span>
						</div>
						<!--end::Symbol-->
						<!--begin::Info-->
						<div class="d-flex flex-column flex-grow-1">
							<a href="#" class="text-dark-75 text-hover-primary mb-1 font-size-lg font-weight-bolder">Using the HTML Canvas</a>
							<div class="d-flex">
								<div class="d-flex align-items-center pr-5">
									<span class="svg-icon svg-icon-md svg-icon-primary pr-1">
										<!--begin::Svg Icon | path:assets/media/svg/icons/Home/Clock.svg-->
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24"></rect>
												<path d="M12,22 C7.02943725,22 3,17.9705627 3,13 C3,8.02943725 7.02943725,4 12,4 C16.9705627,4 21,8.02943725 21,13 C21,17.9705627 16.9705627,22 12,22 Z" fill="#000000" opacity="0.3"></path>
												<path d="M11.9630156,7.5 L12.0475062,7.5 C12.3043819,7.5 12.5194647,7.69464724 12.5450248,7.95024814 L13,12.5 L16.2480695,14.3560397 C16.403857,14.4450611 16.5,14.6107328 16.5,14.7901613 L16.5,15 C16.5,15.2109164 16.3290185,15.3818979 16.1181021,15.3818979 C16.0841582,15.3818979 16.0503659,15.3773725 16.0176181,15.3684413 L11.3986612,14.1087258 C11.1672824,14.0456225 11.0132986,13.8271186 11.0316926,13.5879956 L11.4644883,7.96165175 C11.4845267,7.70115317 11.7017474,7.5 11.9630156,7.5 Z" fill="#000000"></path>
											</g>
										</svg>
										<!--end::Svg Icon-->
									</span>
									<span class="text-muted font-weight-bold">Due 04 Sep</span>
								</div>
								<div class="d-flex align-items-center">
									<span class="svg-icon svg-icon-md svg-icon-primary pr-1">
										<!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-arrange.svg-->
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24"></rect>
												<path d="M5.5,4 L9.5,4 C10.3284271,4 11,4.67157288 11,5.5 L11,6.5 C11,7.32842712 10.3284271,8 9.5,8 L5.5,8 C4.67157288,8 4,7.32842712 4,6.5 L4,5.5 C4,4.67157288 4.67157288,4 5.5,4 Z M14.5,16 L18.5,16 C19.3284271,16 20,16.6715729 20,17.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,17.5 C13,16.6715729 13.6715729,16 14.5,16 Z" fill="#000000"></path>
												<path d="M5.5,10 L9.5,10 C10.3284271,10 11,10.6715729 11,11.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,11.5 C4,10.6715729 4.67157288,10 5.5,10 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,12.5 C20,13.3284271 19.3284271,14 18.5,14 L14.5,14 C13.6715729,14 13,13.3284271 13,12.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z" fill="#000000" opacity="0.3"></path>
											</g>
										</svg>
										<!--end::Svg Icon-->
									</span>
									<span class="text-muted font-weight-bold">Introduction to HTML</span>
								</div>
							</div>
						</div>
						<!--end::Info-->
						
					</div>
					<!--end::Top-->
					<!--begin::Bottom-->
					<div class="pt-3">
						<!--begin::Text-->
						<p class="text-dark-75 font-size-lg font-weight-normal pt-5 mb-7">Here is how to create a basic ping pong game using the canvas</p>
						<!--end::Text-->
						<!--begin::Video-->
						<div class="embed-responsive embed-responsive-16by9">
							<iframe width="853" height="480" src="https://www.youtube.com/embed/KoWqdEACyLI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

						</div>
						<!--end::Video-->
						<!--begin::Action-->
						<%--<a href="#" class="btn btn-hover-text-primary btn-hover-icon-primary btn-sm btn-text-dark-50 bg-hover-light-primary rounded font-weight-bolder font-size-sm p-2 mt-7">
							<span class="svg-icon svg-icon-md svg-icon-dark-25 pr-2">
								<!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Group-chat.svg-->
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24"></rect>
										<path d="M16,15.6315789 L16,12 C16,10.3431458 14.6568542,9 13,9 L6.16183229,9 L6.16183229,5.52631579 C6.16183229,4.13107011 7.29290239,3 8.68814808,3 L20.4776218,3 C21.8728674,3 23.0039375,4.13107011 23.0039375,5.52631579 L23.0039375,13.1052632 L23.0206157,17.786793 C23.0215995,18.0629336 22.7985408,18.2875874 22.5224001,18.2885711 C22.3891754,18.2890457 22.2612702,18.2363324 22.1670655,18.1421277 L19.6565168,15.6315789 L16,15.6315789 Z" fill="#000000"></path>
										<path d="M1.98505595,18 L1.98505595,13 C1.98505595,11.8954305 2.88048645,11 3.98505595,11 L11.9850559,11 C13.0896254,11 13.9850559,11.8954305 13.9850559,13 L13.9850559,18 C13.9850559,19.1045695 13.0896254,20 11.9850559,20 L4.10078614,20 L2.85693427,21.1905292 C2.65744295,21.3814685 2.34093638,21.3745358 2.14999706,21.1750444 C2.06092565,21.0819836 2.01120804,20.958136 2.01120804,20.8293182 L2.01120804,18.32426 C1.99400175,18.2187196 1.98505595,18.1104045 1.98505595,18 Z M6.5,14 C6.22385763,14 6,14.2238576 6,14.5 C6,14.7761424 6.22385763,15 6.5,15 L11.5,15 C11.7761424,15 12,14.7761424 12,14.5 C12,14.2238576 11.7761424,14 11.5,14 L6.5,14 Z M9.5,16 C9.22385763,16 9,16.2238576 9,16.5 C9,16.7761424 9.22385763,17 9.5,17 L11.5,17 C11.7761424,17 12,16.7761424 12,16.5 C12,16.2238576 11.7761424,16 11.5,16 L9.5,16 Z" fill="#000000" opacity="0.3"></path>
									</g>
								</svg>
								<!--end::Svg Icon-->
							</span>268 Comments</a>--%>
						<!--end::Action-->
					</div>
					<!--end::Bottom-->
					<!--begin::Separator-->
					<div class="separator separator-solid mt-5 mb-4"></div>
					<!--end::Separator-->
					<!--begin::Editor-->
					<%--<form class="position-relative">
						<textarea id="kt_forms_widget_9_input" class="form-control border-0 p-0 pr-10 resize-none" rows="1" placeholder="Any Question?" style="overflow: hidden; overflow-wrap: break-word; height: 18px;"></textarea>
						<div class="position-absolute top-0 right-0 mt-n1 mr-n2">
							<span class="btn btn-icon btn-sm btn-hover-icon-primary">
								<i class="flaticon2-clip-symbol icon-ms"></i>
							</span>
						</div>
					</form>--%>
					<!--edit::Editor-->
				</div>
				<!--end::Body-->
			</div>
			<!--end::Forms Widget 9-->


		</div>

	</div>
</asp:Content>
