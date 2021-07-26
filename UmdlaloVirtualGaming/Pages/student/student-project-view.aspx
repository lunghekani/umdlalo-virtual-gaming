<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-project-view.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.student_projects_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	   <!--begin::Entry-->
	<div class="card card-custom card-stretch gutter-b">
    <!--begin::Header-->
    <div class="card-header border-0 pt-5">
        <h3 class="card-title align-items-start flex-column">
            <span class="card-label font-weight-bolder text-dark"  id="spName" runat="server">HTML Code</span>
            <span class="text-muted mt-3 font-weight-bold font-size-sm" id="spSubDetails" runat="server">0 Lines</span>
        </h3>
    </div>
    <!--end::Header-->
    <!--begin::Body-->
    <div class="card-body pt-8">
        <div class="row">

										<div class="col-6">

											<div class="row">
												<%--HTML Container--%>
												<div class="col-12">
													<!--begin::List Widget 1-->
													<div class="card card-custom card-stretch gutter-b">
														<!--begin::Header-->
														<div class="card-header border-0 pt-5">
															<h3 class="card-title align-items-start flex-column">
																<span class="card-label font-weight-bolder text-dark">HTML Code</span>
																<span class="text-muted mt-3 font-weight-bold font-size-sm" >0 Lines</span>
															</h3>
														</div>
														<!--end::Header-->
														<!--begin::Body-->
														<div class="card-body pt-8">
															<%--code here--%>
															<textarea id="htmlCode" cols="65" rows="2" runat="server" ClientIDMode="Static" oninput="showPreview()"></textarea>
														</div>
														<!--end::Body-->
													</div>
													<!--end::List Widget 1-->
												</div>
											</div>
											<div class="row">

												<%--Css Container--%>
												<div class="col-12">
													<!--begin::List Widget 1-->
													<div class="card card-custom card-stretch gutter-b">
														<!--begin::Header-->
														<div class="card-header border-0 pt-5">
															<h3 class="card-title align-items-start flex-column">
																<span class="card-label font-weight-bolder text-dark">CSS Code</span>
																<span class="text-muted mt-3 font-weight-bold font-size-sm">Pending 10 tasks</span>
															</h3>
														</div>
														<!--end::Header-->
														<!--begin::Body-->
														<div class="card-body pt-8">
															<textarea id="cssCode" cols="65" rows="2" runat="server" ClientIDMode="Static"  oninput="showPreview()" ></textarea>
														</div>
														<!--end::Body-->
													</div>
													<!--end::List Widget 1-->
												</div>
											</div>
											<div class="row">

												<%--JS Container--%>
												<div class="col-12">
													<!--begin::List Widget 1-->
													<div class="card card-custom card-stretch gutter-b">
														<!--begin::Header-->
														<div class="card-header border-0 pt-5">
															<h3 class="card-title align-items-start flex-column">
																<span class="card-label font-weight-bolder text-dark">Javascript Code</span>
																<span class="text-muted mt-3 font-weight-bold font-size-sm">Pending 10 tasks</span>
															</h3>
														</div>
														<!--end::Header-->
														<!--begin::Body-->
														<div class="card-body pt-8">
															<textarea id="jsCode" cols="65" rows="2" runat="server" ClientIDMode="Static" oninput="showPreview()"></textarea>
														</div>
														<!--end::Body-->
													</div>
													<!--end::List Widget 1-->
												</div>
											</div>
										</div>
										<div class="col-6 ">
											<iframe id="previewpane" style="width: 100%; height: 100%; border: 2px solid black;"></iframe>
										</div>
									</div>
		</div>
    </div>
						<div class="d-flex flex-column-fluid">
							<!--begin::Container-->
							<div class="container-fluid">
								<div>
									<style>
										textarea {
											overflow-y: scroll;
											height: 100px;
											resize: none;
										}
									</style>
									
								</div>
							</div>
							<!--end::Container-->
						</div>
						<!--end::Entry-->
    <%--to use the damn thing--%>
    <script type="text/javascript">
        function showPreview() {
			
            var htmlCode = document.getElementById("htmlCode").value;
            var cssCode = "<style>" + document.getElementById("cssCode").value + "</style>";
            var jsCode = "<scri" + "pt>" + document.getElementById("jsCode").value + "</scri" + "pt>";
            var frame = document.getElementById("previewpane").contentWindow.document;
            frame.open();
            frame.write(htmlCode + cssCode + jsCode);
            frame.close();
        }

        
    </script>
    <!--JQUERY-->
</asp:Content>
