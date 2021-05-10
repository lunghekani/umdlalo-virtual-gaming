<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-marks-view.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.student_marks_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card card-custom gutter-b">
        <div class="card-header flex-wrap border-0 pt-6 pb-0">
            <div class="card-title">
                <h3 class="card-label">Marks
											<span class="d-block text-muted pt-2 font-size-sm">row selection and group actions</span></h3>
            </div>
            <div class="card-toolbar">
                <!--begin::Dropdown-->
                <div class="dropdown dropdown-inline mr-2">
                    <button type="button" class="btn btn-light-primary font-weight-bolder dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="svg-icon svg-icon-md">
                            <!--begin::Svg Icon | path:assets/media/svg/icons/Design/PenAndRuller.svg-->
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24"></rect>
                                    <path d="M3,16 L5,16 C5.55228475,16 6,15.5522847 6,15 C6,14.4477153 5.55228475,14 5,14 L3,14 L3,12 L5,12 C5.55228475,12 6,11.5522847 6,11 C6,10.4477153 5.55228475,10 5,10 L3,10 L3,8 L5,8 C5.55228475,8 6,7.55228475 6,7 C6,6.44771525 5.55228475,6 5,6 L3,6 L3,4 C3,3.44771525 3.44771525,3 4,3 L10,3 C10.5522847,3 11,3.44771525 11,4 L11,19 C11,19.5522847 10.5522847,20 10,20 L4,20 C3.44771525,20 3,19.5522847 3,19 L3,16 Z" fill="#000000" opacity="0.3"></path>
                                    <path d="M16,3 L19,3 C20.1045695,3 21,3.8954305 21,5 L21,15.2485298 C21,15.7329761 20.8241635,16.200956 20.5051534,16.565539 L17.8762883,19.5699562 C17.6944473,19.7777745 17.378566,19.7988332 17.1707477,19.6169922 C17.1540423,19.602375 17.1383289,19.5866616 17.1237117,19.5699562 L14.4948466,16.565539 C14.1758365,16.200956 14,15.7329761 14,15.2485298 L14,5 C14,3.8954305 14.8954305,3 16,3 Z" fill="#000000"></path>
                                </g>
                            </svg>
                            <!--end::Svg Icon-->
                        </span>Export</button>
                    <!--begin::Dropdown Menu-->
                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                        <!--begin::Navigation-->
                        <ul class="navi flex-column navi-hover py-2">
                            <li class="navi-header font-weight-bolder text-uppercase font-size-sm text-primary pb-2">Choose an option:</li>
                            <li class="navi-item">
                                <a href="#" class="navi-link">
                                    <span class="navi-icon">
                                        <i class="la la-print"></i>
                                    </span>
                                    <span class="navi-text">Print</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link">
                                    <span class="navi-icon">
                                        <i class="la la-copy"></i>
                                    </span>
                                    <span class="navi-text">Copy</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link">
                                    <span class="navi-icon">
                                        <i class="la la-file-excel-o"></i>
                                    </span>
                                    <span class="navi-text">Excel</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link">
                                    <span class="navi-icon">
                                        <i class="la la-file-text-o"></i>
                                    </span>
                                    <span class="navi-text">CSV</span>
                                </a>
                            </li>
                            <li class="navi-item">
                                <a href="#" class="navi-link">
                                    <span class="navi-icon">
                                        <i class="la la-file-pdf-o"></i>
                                    </span>
                                    <span class="navi-text">PDF</span>
                                </a>
                            </li>

                            <!--end::Navigation-->
                    </div>
                    <!--end::Dropdown Menu-->
                </div>
                <!--end::Dropdown-->
            </div>
        </div>
        <div class="card-body">
            <!--begin: Search Form-->
            <!--begin::Search Form-->
            <div class="mb-7">
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
                            <div class="col-md-4 my-2 my-md-0">
                                <div class="d-flex align-items-center">
                                    <label class="mr-3 mb-0 d-none d-md-block">Status:</label>
                                    <div class="dropdown bootstrap-select form-control">
                                        <select class="form-control" id="kt_datatable_search_status">
                                            <option value="">All</option>
                                            <option value="1">Pending</option>
                                            <option value="2">Delivered</option>
                                            <option value="3">Canceled</option>
                                            <option value="4">Success</option>
                                            <option value="5">Info</option>
                                            <option value="6">Danger</option>
                                        </select>
                                        <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light bs-placeholder" data-toggle="dropdown" role="combobox" aria-owns="bs-select-1" aria-haspopup="listbox" aria-expanded="false" data-id="kt_datatable_search_status" title="All">
                                            <div class="filter-option">
                                                <div class="filter-option-inner">
                                                    <div class="filter-option-inner-inner">All</div>
                                                </div>
                                            </div>
                                        </button>
                                        <div class="dropdown-menu ">
                                            <div class="inner show" role="listbox" id="bs-select-1" tabindex="-1">
                                                <ul class="dropdown-menu inner show" role="presentation"></ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 my-2 my-md-0">
                                <div class="d-flex align-items-center">
                                    <label class="mr-3 mb-0 d-none d-md-block">Type:</label>
                                    <div class="dropdown bootstrap-select form-control">
                                        <select class="form-control" id="kt_datatable_search_type">
                                            <option value="">All</option>
                                            <option value="1">Online</option>
                                            <option value="2">Retail</option>
                                            <option value="3">Direct</option>
                                        </select>
                                        <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light bs-placeholder" data-toggle="dropdown" role="combobox" aria-owns="bs-select-2" aria-haspopup="listbox" aria-expanded="false" data-id="kt_datatable_search_type" title="All">
                                            <div class="filter-option">
                                                <div class="filter-option-inner">
                                                    <div class="filter-option-inner-inner">All</div>
                                                </div>
                                            </div>
                                        </button>
                                        <div class="dropdown-menu ">
                                            <div class="inner show" role="listbox" id="bs-select-2" tabindex="-1">
                                                <ul class="dropdown-menu inner show" role="presentation"></ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
            <!--begin: Selected Rows Group Action Form-->
            <div class="mt-10 mb-5 collapse" id="kt_datatable_group_action_form">
                <div class="d-flex align-items-center">
                    <div class="font-weight-bold text-danger mr-3">
                        Selected
												<span id="kt_datatable_selected_records">0</span>records:
                    </div>
                    <div class="dropdown mr-2">
                        <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">Update status</button>
                        <div class="dropdown-menu dropdown-menu-sm">
                            <ul class="nav nav-hover flex-column">
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-text">Pending</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-text">Delivered</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-text">Canceled</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <button class="btn btn-sm btn-danger mr-2" type="button" id="kt_datatable_delete_all">Delete All</button>
                    <button class="btn btn-sm btn-success" type="button" data-toggle="modal" data-target="#kt_datatable_fetch_modal">Fetch Selected Records</button>
                </div>
            </div>
            <!--end: Selected Rows Group Action Form-->
            <!--begin: Datatable-->
            <div class="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded" id="kt_datatable" style="">
                <table class="datatable-table" style="display: block;">
                    <thead class="datatable-head">
                        <tr class="datatable-row" style="left: 0px;">
                            <th class="datatable-cell datatable-toggle-detail"><span></span></th>
                            <th data-field="RecordID" class="datatable-cell-center datatable-cell datatable-cell-check"><span style="width: 20px;">
                                <label class="checkbox checkbox-single checkbox-all">
                                    <input type="checkbox">&nbsp;
											<span></span>
                                </label>
                            </span></th>
                            <th data-field="OrderID" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Order ID</span></th>
                            <th data-field="Country" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Country</span></th>
                            <th data-field="ShipAddress" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Ship Address</span></th>
                            <th data-field="ShipDate" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Ship Date</span></th>
                            <th data-field="Status" class="datatable-cell datatable-cell-sort" style="display: none;">
                                <span style="width: 110px;">Status</span></th>
                            <th data-field="Type" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Type</span></th>
                            <th data-field="Actions" data-autohide-disabled="false" class="datatable-cell-left datatable-cell datatable-cell-sort">
                                <span style="width: 125px;">Actions</span></th>
                        </tr>
                    </thead>
                    <tbody class="datatable-body" style="">
                        <tr data-row="0" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="1"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="1">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="64616-103" class="datatable-cell"><span style="width: 110px;">64616-103</span></td>
                            <td data-field="Country" aria-label="Brazil" class="datatable-cell"><span style="width: 110px;">Brazil BR</span></td>
                            <td data-field="ShipAddress" aria-label="698 Oriole Pass" class="datatable-cell"><span style="width: 110px;">698 Oriole Pass</span></td>
                            <td data-field="ShipDate" aria-label="10/15/2017" class="datatable-cell"><span style="width: 110px;">10/15/2017</span></td>
                            <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-info label-inline">Info</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="1" class="datatable-cell"><span style="width: 110px;"><span class="label label-danger label-dot mr-2"></span><span class="font-weight-bold text-danger">Online</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="2"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="2">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="54868-3377" class="datatable-cell"><span style="width: 110px;">54868-3377</span></td>
                            <td data-field="Country" aria-label="Vietnam" class="datatable-cell"><span style="width: 110px;">Vietnam VN</span></td>
                            <td data-field="ShipAddress" aria-label="8998 Delaware Court" class="datatable-cell"><span style="width: 110px;">8998 Delaware Court</span></td>
                            <td data-field="ShipDate" aria-label="4/24/2016" class="datatable-cell"><span style="width: 110px;">4/24/2016</span></td>
                            <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-danger label-inline">Delivered</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="3"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="3">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="0998-0355" class="datatable-cell"><span style="width: 110px;">0998-0355</span></td>
                            <td data-field="Country" aria-label="Philippines" class="datatable-cell"><span style="width: 110px;">Philippines PH</span></td>
                            <td data-field="ShipAddress" aria-label="91796 Sutteridge Road" class="datatable-cell"><span style="width: 110px;">91796 Sutteridge Road</span></td>
                            <td data-field="ShipDate" aria-label="7/11/2017" class="datatable-cell"><span style="width: 110px;">7/11/2017</span></td>
                            <td data-field="Status" aria-label="6" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-danger label-inline">Danger</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="4"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="4">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="55154-6876" class="datatable-cell"><span style="width: 110px;">55154-6876</span></td>
                            <td data-field="Country" aria-label="China" class="datatable-cell"><span style="width: 110px;">China CN</span></td>
                            <td data-field="ShipAddress" aria-label="8 Muir Drive" class="datatable-cell"><span style="width: 110px;">8 Muir Drive</span></td>
                            <td data-field="ShipDate" aria-label="2/5/2016" class="datatable-cell"><span style="width: 110px;">2/5/2016</span></td>
                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-boldlabel-light-primary label-inline">Pending</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="1" class="datatable-cell"><span style="width: 110px;"><span class="label label-danger label-dot mr-2"></span><span class="font-weight-bold text-danger">Online</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="5"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="5">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="49349-069" class="datatable-cell"><span style="width: 110px;">49349-069</span></td>
                            <td data-field="Country" aria-label="United States" class="datatable-cell"><span style="width: 110px;">United States US</span></td>
                            <td data-field="ShipAddress" aria-label="782 Mallory Lane" class="datatable-cell"><span style="width: 110px;">782 Mallory Lane</span></td>
                            <td data-field="ShipDate" aria-label="7/23/2017" class="datatable-cell"><span style="width: 110px;">7/23/2017</span></td>
                            <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-info label-inline">Info</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="6"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="6">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="53499-0393" class="datatable-cell"><span style="width: 110px;">53499-0393</span></td>
                            <td data-field="Country" aria-label="Ukraine" class="datatable-cell"><span style="width: 110px;">Ukraine UA</span></td>
                            <td data-field="ShipAddress" aria-label="02 Briar Crest Parkway" class="datatable-cell"><span style="width: 110px;">02 Briar Crest Parkway</span></td>
                            <td data-field="ShipDate" aria-label="2/21/2016" class="datatable-cell"><span style="width: 110px;">2/21/2016</span></td>
                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-boldlabel-light-primary label-inline">Pending</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="3" class="datatable-cell"><span style="width: 110px;"><span class="label label-success label-dot mr-2"></span><span class="font-weight-bold text-success">Direct</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="7"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="7">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="43074-105" class="datatable-cell"><span style="width: 110px;">43074-105</span></td>
                            <td data-field="Country" aria-label="Philippines" class="datatable-cell"><span style="width: 110px;">Philippines PH</span></td>
                            <td data-field="ShipAddress" aria-label="643 Mayer Road" class="datatable-cell"><span style="width: 110px;">643 Mayer Road</span></td>
                            <td data-field="ShipDate" aria-label="10/25/2016" class="datatable-cell"><span style="width: 110px;">10/25/2016</span></td>
                            <td data-field="Status" aria-label="5" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-info label-inline">Info</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="8"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="8">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="76328-333" class="datatable-cell"><span style="width: 110px;">76328-333</span></td>
                            <td data-field="Country" aria-label="Portugal" class="datatable-cell"><span style="width: 110px;">Portugal PT</span></td>
                            <td data-field="ShipAddress" aria-label="6715 Dakota Parkway" class="datatable-cell"><span style="width: 110px;">6715 Dakota Parkway</span></td>
                            <td data-field="ShipDate" aria-label="2/18/2016" class="datatable-cell"><span style="width: 110px;">2/18/2016</span></td>
                            <td data-field="Status" aria-label="3" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-primary label-inline">Canceled</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="9"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="9">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="21130-054" class="datatable-cell"><span style="width: 110px;">21130-054</span></td>
                            <td data-field="Country" aria-label="France" class="datatable-cell"><span style="width: 110px;">France FR</span></td>
                            <td data-field="ShipAddress" aria-label="4942 Darwin Hill" class="datatable-cell"><span style="width: 110px;">4942 Darwin Hill</span></td>
                            <td data-field="ShipDate" aria-label="3/26/2016" class="datatable-cell"><span style="width: 110px;">3/26/2016</span></td>
                            <td data-field="Status" aria-label="2" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-bold label-light-danger label-inline">Delivered</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="10"><span style="width: 20px;">
                                <label class="checkbox checkbox-single">
                                    <input type="checkbox" value="10">&nbsp;<span></span></label></span></td>
                            <td data-field="OrderID" aria-label="68788-9890" class="datatable-cell"><span style="width: 110px;">68788-9890</span></td>
                            <td data-field="Country" aria-label="Dominican Republic" class="datatable-cell"><span style="width: 110px;">Dominican Republic DO</span></td>
                            <td data-field="ShipAddress" aria-label="854 Dapin Terrace" class="datatable-cell"><span style="width: 110px;">854 Dapin Terrace</span></td>
                            <td data-field="ShipDate" aria-label="8/10/2016" class="datatable-cell"><span style="width: 110px;">8/10/2016</span></td>
                            <td data-field="Status" aria-label="1" class="datatable-cell" style="display: none;"><span style="width: 110px;"><span class="label label-lg font-weight-boldlabel-light-primary label-inline">Pending</span></span></td>
                            <td data-field="Type" data-autohide-disabled="false" aria-label="2" class="datatable-cell"><span style="width: 110px;"><span class="label label-primary label-dot mr-2"></span><span class="font-weight-bold text-primary">Retail</span></span></td>
                            <td class="datatable-cell-left datatable-cell" data-field="Actions" data-autohide-disabled="false" aria-label="null"><span style="overflow: visible; position: relative; width: 125px;">
                                <div class="dropdown dropdown-inline"><a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" data-toggle="dropdown"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                                        </g>
                                    </svg>
                                </span></a>
                                    <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                        <ul class="navi flex-column navi-hover py-2">
                                            <li class="navi-header font-weight-bolder text-uppercase font-size-xs text-primary pb-2">Choose an action:                                </li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-print"></i></span><span class="navi-text">Print</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-copy"></i></span><span class="navi-text">Copy</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-excel-o"></i></span><span class="navi-text">Excel</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-text-o"></i></span><span class="navi-text">CSV</span>                                    </a></li>
                                            <li class="navi-item"><a href="#" class="navi-link"><span class="navi-icon"><i class="la la-file-pdf-o"></i></span><span class="navi-text">PDF</span>                                    </a></li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="javascript:;" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24"></rect>
                                            <path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "></path>
                                            <rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"></rect>
                                        </g>
                                    </svg>
                                </span></a><a href="javascript:;" class="btn btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md">
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
                            <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light" data-toggle="dropdown" role="combobox" aria-owns="bs-select-5" aria-haspopup="listbox" aria-expanded="false" title="Select page size">
                                <div class="filter-option">
                                    <div class="filter-option-inner">
                                        <div class="filter-option-inner-inner">10</div>
                                    </div>
                                </div>
                            </button>
                            <div class="dropdown-menu ">
                                <div class="inner show" role="listbox" id="bs-select-5" tabindex="-1">
                                    <ul class="dropdown-menu inner show" role="presentation"></ul>
                                </div>
                            </div>
                        </div>
                        <span class="datatable-pager-detail">Showing 1 - 10 of 350</span></div>
                </div>
            </div>
            <!--end: Datatable-->
        </div>
    </div>
</asp:Content>
