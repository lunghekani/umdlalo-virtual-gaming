<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-student-list.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_students_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-custom">
        <!--begin::Header-->
        <div class="card-header flex-wrap border-0 pt-6 pb-0">
            <h3 class="card-title align-items-start flex-column">
                <span class="card-label font-weight-bolder text-dark">Students</span>
            </h3>
        </div>
        <!--end::Header-->
        <!--begin::Body-->
        <div class="card-body">
            <!--begin: Search Form-->
            <!--begin::Search Form-->
            <div class="mb-10">
                <div class="row align-items-center">
                    <div class="col-lg-9 col-xl-8">
                        <div class="row align-items-center">
                            <div class="col-md-4 my-2 my-md-0">
                                <div class="input-icon">
                                    <input type="text" class="form-control form-control-solid" placeholder="Search..." id="kt_datatable_search_query">
                                    <span>
                                        <i class="flaticon2-search-1 text-muted"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-4 my-2 my-md-0">
                                <select class="form-control form-control-solid" id="kt_datatable_search_status">
                                    <option value="">Status</option>
                                    <option value="1">Pending</option>
                                    <option value="2">Delivered</option>
                                    <option value="3">Canceled</option>
                                </select>
                            </div>
                            <div class="col-md-4 my-2 my-md-0">
                                <select class="form-control form-control-solid" id="kt_datatable_search_type">
                                    <option value="">Type</option>
                                    <option value="4">Success</option>
                                    <option value="5">Info</option>
                                    <option value="6">Danger</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
                        <a href="#" class="btn btn-light-primary px-6 font-weight-bold">Search</a>
                    </div>
                </div>
            </div>
            <!--end::Search Form-->
            <!--end: Search Form-->
            <!--begin: Datatable-->
            <div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable" style="">
                <table class="datatable-table" style="display: block;">
                    <thead class="datatable-head">
                        <tr class="datatable-row" style="left: 0px;">
                            <th class="datatable-cell datatable-toggle-detail"><span></span></th>
                            <th data-field="CompanyName" class="datatable-cell datatable-cell-sort" style="display: none;"><span style="width: 250px;">Student</span></th>
                            <th data-field="FacultyAgent" class="datatable-cell datatable-cell-sort" style="display: none;"><span style="width: 110px;">Faculty</span></th>
                            <th data-field="JoinedDate" class="datatable-cell datatable-cell-sort" style="display: none;"><span style="width: 100px;">Joined</span></th>
                            <th data-field="Status" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort"><span style="width: 100px;">Status</span></th>
                            <th data-field="Actions" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort"><span style="width: 130px;">Actions</span></th>
                        </tr>
                    </thead>
                    <tbody class="datatable-body" style="">
                        <tr data-row="0" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Casper-Kerluke" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/040-boy-17.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Hayes Boule</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">hboule0@hp.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Casper-Kerluke, MA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">10/15/2017</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="5" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-info label-inline">In-active</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="1" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Hodkiewicz and Sons" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/021-boy-8.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Humbert Bresnen</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">hbresnen1@theguardian.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Hodkiewicz and Sons, MA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">4/24/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Active</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="2" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Kuhlman Inc" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/001-boy.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Jareb Labro</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">jlabro2@kickstarter.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Kuhlman Inc, BSc</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">7/11/2017</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="6" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">New</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="3" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Prosacco-Kessler" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/021-boy-8.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Krishnah Tosspell</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">ktosspell3@flickr.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Prosacco-Kessler, BA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">2/5/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="1" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-info label-inline">In-active</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="4" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Bernier and Sons" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/020-girl-11.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Dale Kernan</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">dkernan4@mapquest.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Bernier and Sons, MS</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">7/23/2017</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="5" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Active</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="5" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Schoen-Metz" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/003-girl-1.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Halley Bentham</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">hbentham5@nih.gov</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Schoen-Metz, MA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">2/21/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="1" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">New</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="6" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="DuBuque, Stanton and Stanton" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/035-boy-15.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Burgess Penddreth</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">bpenddreth6@example.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">DuBuque, Stanton and Stanton, BA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">10/25/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="5" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">New</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="7" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Homenick-Nolan" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/004-boy-1.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Cob Sedwick</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">csedwick7@wikispaces.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Homenick-Nolan, MA</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">2/18/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="3" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">New</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="8" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Daugherty-Considine" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/030-girl-17.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Tabby Callaghan</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">tcallaghan8@squidoo.com</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Daugherty-Considine, MS</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">3/26/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-primary label-inline">New</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                        <tr data-row="9" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td data-field="CompanyName" aria-label="Walter Group" class="datatable-cell" style="display: none;"><span style="width: 250px;">
                                <div class="d-flex align-items-center">
                                    <div class="symbol symbol-50 symbol-sm flex-shrink-0">
                                        <div class="symbol-label">
                                            <img class="h-75 align-self-end" src="assets/media/svg/avatars/048-boy-21.svg" alt="photo">
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <div class="text-dark-75 font-weight-bolder font-size-lg mb-0">Broddy Jarry</div>
                                        <a href="#" class="text-muted font-weight-bold text-hover-primary">bjarry9@craigslist.org</a>                            </div>
                                </div>
                            </span></td>
                            <td data-field="FacultyAgent" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 110px;"><a href="#" class="text-dark-50 text-hover-primary font-weight-bold">Walter Group, PhD</a></span></td>
                            <td data-field="JoinedDate" aria-label="null" class="datatable-cell" style="display: none;"><span style="width: 100px;">
                                <div class="font-weight-bolder text-primary mb-0">8/10/2016</div>
                            </span></td>
                            <td data-field="Status" data-autohide-disabled="false" aria-label="1" class="datatable-cell"><span style="width: 100px;"><span class="label label-lg font-weight-bold  label-light-danger label-inline">Active</span></span></td>
                            <td data-field="Actions" data-autohide-disabled="false" aria-label="null" class="datatable-cell"><span style="overflow: visible; position: relative; width: 130px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="svg-icon">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M7,3 L17,3 C19.209139,3 21,4.790861 21,7 C21,9.209139 19.209139,11 17,11 L7,11 C4.790861,11 3,9.209139 3,7 C3,4.790861 4.790861,3 7,3 Z M7,9 C8.1045695,9 9,8.1045695 9,7 C9,5.8954305 8.1045695,5 7,5 C5.8954305,5 5,5.8954305 5,7 C5,8.1045695 5.8954305,9 7,9 Z" fill="#000000"></path>
                                            <path d="M7,13 L17,13 C19.209139,13 21,14.790861 21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 C3,14.790861 4.790861,13 7,13 Z M17,19 C18.1045695,19 19,18.1045695 19,17 C19,15.8954305 18.1045695,15 17,15 C15.8954305,15 15,15.8954305 15,17 C15,18.1045695 15.8954305,19 17,19 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:	                                    </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>	                                        </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>	                                        </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "></path>
                                            <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-default btn-text-primary btn-hover-primary btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#000000" fill-rule="nonzero"></path>
                                            <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"></path>
                                        </g>
                                    </svg>
                                </span></a></span></td>
                        </tr>
                    </tbody>
                </table>
                <div class="datatable-pager datatable-paging-loaded">
                    <ul class="datatable-pager-nav mb-5 mb-sm-0">
                        <li><a title="First" class="datatable-pager-link datatable-pager-link-first datatable-pager-link-disabled" data-page="1" disabled="disabled"><i class="flaticon2-fast-back"></i></a></li>
                        <li><a title="Previous" class="datatable-pager-link datatable-pager-link-prev datatable-pager-link-disabled" data-page="1" disabled="disabled"><i class="flaticon2-back"></i></a></li>
                        <li style=""></li>
                        <li style="display: none;">
                            <input type="text" class="datatable-pager-input form-control" title="Page number"></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number datatable-pager-link-active" data-page="1" title="1">1</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number" data-page="2" title="2">2</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number" data-page="3" title="3">3</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number" data-page="4" title="4">4</a></li>
                        <li><a class="datatable-pager-link datatable-pager-link-number" data-page="5" title="5">5</a></li>
                        <li></li>
                        <li><a title="Next" class="datatable-pager-link datatable-pager-link-next" data-page="2"><i class="flaticon2-next"></i></a></li>
                        <li><a title="Last" class="datatable-pager-link datatable-pager-link-last" data-page="35"><i class="flaticon2-fast-next"></i></a></li>
                    </ul>
                    <div class="datatable-pager-info">
                        <div class="dropdown bootstrap-select datatable-pager-size" style="width: 60px;">
                            <select class="selectpicker datatable-pager-size" title="Select page size" data-width="60px" data-container="body" data-selected="10">
                                <option class="bs-title-option" value=""></option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="20">20</option>
                                <option value="30">30</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                            </select>
                            <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="combobox" aria-owns="bs-select-1" aria-haspopup="listbox" aria-expanded="false" title="Select page size">
                                <div class="filter-option">
                                    <div class="filter-option-inner">
                                        <div class="filter-option-inner-inner">10</div>
                                    </div>
                                </div>
                            </button>
                            <div class="dropdown-menu ">
                                <div class="inner show" role="listbox" id="bs-select-1" tabindex="-1">
                                    <ul class="dropdown-menu inner show" role="presentation"></ul>
                                </div>
                            </div>
                        </div>
                        <span class="datatable-pager-detail">Showing 1 - 10 of 350</span></div>
                </div>
            </div>
            <!--end: Datatable-->
        </div>
        <!--end::Body-->
    </div>
</asp:Content>
