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
                                    <label class="mr-3 mb-0 d-none d-md-block">Type:</label>

                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                     <asp:ListItem Value="-1">Select Type</asp:ListItem>
                                    <asp:ListItem Value="1">Activity</asp:ListItem>
                                    <asp:ListItem Value="2">Description</asp:ListItem>
                                    <asp:ListItem Value="3">Mark</asp:ListItem>

                                    </asp:DropDownList>

                                   <%-- <div class="dropdown bootstrap-select form-control">
                                        <select class="form-control" id="kt_datatable_search_type">
                                            <option value="">Acitvity </option>
                                            <option value="1">Description</option>
                                            <option value="2">Mark</option>
                                        </select>
                                        <button type="button" tabindex="-1" class="btn dropdown-toggle btn-light bs-placeholder" data-toggle="dropdown" role="combobox" aria-owns="bs-select-2" aria-haspopup="listbox" aria-expanded="false" data-id="kt_datatable_search_type" title="Activity">
                                            <div class="filter-option">
                                                <div class="filter-option-inner">
                                                    <div class="filter-option-inner-inner">Activity</div>
                                                </div>
                                            </div>
                                        </button>
                                        <div class="dropdown-menu ">
                                            <div class="inner show" role="listbox" id="bs-select-2" tabindex="-1">
                                                <ul class="dropdown-menu inner show" role="presentation"></ul>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-xl-4 mt-5 mt-lg-0">
                        <asp:button href="#" class="btn btn-light-primary px-6 font-weight-bold" id="btnFind" runat="server" Text="Search"></asp:button>
                    </div>
                </div>
            </div>
            <!--end::Search Form-->
            <!--begin: Selected Rows Group Action Form-->
            <div class="mt-10 mb-5 collapse" id="kt_datatable_group_action_form">
                <div class="d-flex align-items-center">
                    <div class="font-weight-bold text-danger mr-3">
                        Selected
												<span id="kt_datatable_selected_records">0</span>records:
                    </div>
                   <%-- <div class="dropdown mr-2">
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
                    </div>--%>
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
                               
                            </span></th>
                            <th data-field="Activity" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Activity</span></th>
                            <th data-field="Description" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Description</span></th>
                            <th data-field="Date" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Date</span></th>
                            <th data-field="Mark" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Mark</span></th>
                           <%-- <th data-field="Status" class="datatable-cell datatable-cell-sort" style="display: none;">
                                <span style="width: 110px;">Status</span></th>
                            <th data-field="Type" data-autohide-disabled="false" class="datatable-cell datatable-cell-sort">
                                <span style="width: 110px;">Type</span></th>
                            <th data-field="Actions" data-autohide-disabled="false" class="datatable-cell-left datatable-cell datatable-cell-sort">
                                <span style="width: 125px;">Actions</span></th>--%>
                        </tr>
                    </thead>
                    <tbody class="datatable-body" style="">
                        <tr data-row="0" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="1"><span style="width: 20px;">
                              </span></td> 
                            <td data-field="Activity" aria-label="Assessment 1" class="datatable-cell"><span style="width: 110px;">Assessment 1</span></td>
                            <td data-field="Description" aria-label="HTML" class="datatable-cell"><span style="width: 110px;">HTML</span></td>
                            <td data-field="Date" aria-label="20 February 2021" class="datatable-cell"><span style="width: 110px;">20 February 2021</span></td>
                            <td data-field="Mark" aria-label="75" class="datatable-cell"><span style="width: 110px;">75</span></td>
                           
                        
                        </tr>
                        <tr data-row="1" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="2"><span style="width: 20px;">
                              </span></td>
                            <td data-field="Activity" aria-label="Assessment 2" class="datatable-cell"><span style="width: 110px;">Assessment 2</span></td>
                            <td data-field="Description" aria-label="HTML" class="datatable-cell"><span style="width: 110px;">HTML</span></td>
                            <td data-field="Date" aria-label="28 February 2021" class="datatable-cell"><span style="width: 110px;">28 February 2021</span></td>
                            <td data-field="Mark" aria-label="80" class="datatable-cell"><span style="width: 110px;">80</span></td>            
                            
                         
                        </tr>
                        <tr data-row="2" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="3"><span style="width: 20px;">
                             </span></td>
                            <td data-field="Activity" aria-label="Assessment 3" class="datatable-cell"><span style="width: 110px;">Assessment 3</span></td>
                            <td data-field="Description" aria-label="CSS" class="datatable-cell"><span style="width: 110px;">CSS</span></td>
                            <td data-field="Date" aria-label="16 March 2021" class="datatable-cell"><span style="width: 110px;">16 March 2021</span></td>
                            <td data-field="Mark" aria-label="67" class="datatable-cell"><span style="width: 110px;">67</span></td>      
                          
                        </tr>
                        <tr data-row="3" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="4"><span style="width: 20px;">
                               </span></td>
                            <td data-field="Activity" aria-label="Assessment 4" class="datatable-cell"><span style="width: 110px;">Assessment 4</span></td>
                            <td data-field="Description" aria-label="CSS" class="datatable-cell"><span style="width: 110px;">CSS</span></td>
                           <td data-field="Date" aria-label="22 March 2021" class="datatable-cell"><span style="width: 110px;">22 March 2021</span></td>
                            <td data-field="Mark" aria-label="82" class="datatable-cell"><span style="width: 110px;">82</span></td>            
                          
                        </tr>
                        <tr data-row="4" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="5"><span style="width: 20px;">
                                </span></td>
                            <td data-field="Activity" aria-label="Assessment 5" class="datatable-cell"><span style="width: 110px;">Assessment 5</span></td>
                            <td data-field="Description" aria-label="JavaScrip" class="datatable-cell"><span style="width: 110px;">JavaScrip</span></td>
                            <td data-field="Date" aria-label="27 March 2021" class="datatable-cell"><span style="width: 110px;">27 March 2021</span></td>
                            <td data-field="Mark" aria-label="50" class="datatable-cell"><span style="width: 110px;">50</span></td>            
                          
                        </tr>
                        <tr data-row="5" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="6"><span style="width: 20px;">
                              </span></td>
                             <td data-field="Activity" aria-label="Assessment 6" class="datatable-cell"><span style="width: 110px;">Assessment 6</span></td>
                            <td data-field="Description" aria-label="JavaScrip" class="datatable-cell"><span style="width: 110px;">JavaScrip</span></td>
                            <td data-field="Date" aria-label="3 April 2021" class="datatable-cell"><span style="width: 110px;">2 April 2021</span></td>
                            <td data-field="Mark" aria-label="50" class="datatable-cell"><span style="width: 110px;">50</span></td>            
                      
                        </tr>
                        <tr data-row="6" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="7"><span style="width: 20px;">
                              </span></td>
                            <td data-field="Activity" aria-label="Assessment 7" class="datatable-cell"><span style="width: 110px;">Assessment 7</span></td>
                             <td data-field="Description" aria-label="C-sharp" class="datatable-cell"><span style="width: 110px;">C-sharp</span></td>
                            <td data-field="Date" aria-label="9 April 2021" class="datatable-cell"><span style="width: 110px;">9 April 2021</span></td>
                            <td data-field="Mark" aria-label="58" class="datatable-cell"><span style="width: 110px;">58</span></td>            
                         
                        </tr>
                        <tr data-row="7" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="8"><span style="width: 20px;">
                               </span></td>
                            <td data-field="Activity" aria-label="Assessment 8" class="datatable-cell"><span style="width: 110px;">Assessment 8</span></td>
                           <td data-field="Description" aria-label="C-sharp" class="datatable-cell"><span style="width: 110px;">C-sharp</span></td>
                            <td data-field="Date" aria-label="15 April 2021" class="datatable-cell"><span style="width: 110px;">15 April 2021</span></td>
                            <td data-field="Mark" aria-label="55" class="datatable-cell"><span style="width: 110px;">55</span></td>            

                        </tr>
                        <tr data-row="8" class="datatable-row" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="9"><span style="width: 20px;">
                               </span></td>
                            <td data-field="Activity" aria-label="Assessment 9" class="datatable-cell"><span style="width: 110px;">Assessment 9</span></td>
                            <td data-field="Description" aria-label="C-sharp" class="datatable-cell"><span style="width: 110px;">C-sharp</span></td>
                            <td data-field="Date" aria-label="22 April 2021" class="datatable-cell"><span style="width: 110px;">22 April 2021</span></td>
                            <td data-field="Mark" aria-label="60" class="datatable-cell"><span style="width: 110px;">60</span></td>            
                           
                        </tr>
                        <tr data-row="9" class="datatable-row datatable-row-even" style="left: 0px;">
                            <td class="datatable-cell datatable-toggle-detail"><a class="datatable-toggle-detail" href=""><i class="fa fa-caret-right"></i></a></td>
                            <td class="datatable-cell-sorted datatable-cell-center datatable-cell datatable-cell-check" data-field="RecordID" aria-label="10"><span style="width: 20px;">
                                </span></td>
                            <td data-field="Activity" aria-label="Assessment 10" class="datatable-cell"><span style="width: 110px;">Assessment 10</span></td>
                           <td data-field="Description" aria-label="HTML + CSS" class="datatable-cell"><span style="width: 110px;">HTML + CSS</span></td>
                            <td data-field="Date" aria-label="28 April 2021" class="datatable-cell"><span style="width: 110px;">28 April 2021</span></td>
                            <td data-field="Mark" aria-label="70" class="datatable-cell"><span style="width: 110px;">70</span></td>            
                           
                        </tr>
                    </tbody>
                </table>
             
        </div>
    </div>
</asp:Content>
