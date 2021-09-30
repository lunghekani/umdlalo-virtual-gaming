<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin-course-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.admin.admin_course_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form class="form">
 <div class="card-body">
  <h3 class="font-size-lg text-dark font-weight-bold mb-6">1. Course Info:</h3>
  <div class="mb-15">
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Course Name:</label>
    <div class="col-lg-6">
     <input type="text" class="form-control" placeholder="Enter Course Name" id="txt_course_name"/>
     <span class="form-text text-muted">Please enter the name of the course</span>
    </div>
   </div>
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Course Code:</label>
    <div class="col-lg-6">
     <input type="text" class="form-control" placeholder="Enter Course Code" id="txt_course_code"/>
     
    </div>
   </div>
  </div>

  <h3 class="font-size-lg text-dark font-weight-bold mb-6">2. Course Content:</h3>
  <div class="mb-3">
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">ription:</label>
    <div class="col-lg-6">
     <input type="text" class="form-control" placeholder="Description" id="txt_description"/>
     <span class="form-text text-muted">Please enter a short description of the course</span>
    </div>
   </div>
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Start Date</label>
    <div class="col-lg-6">
     <div class="input-group">
      <div class="input-group-prepend"><span class="input-group-text"><i class="la la-chain"></i></span></div>
      <input type="datetime-local" class="form-control" id="Start"/>
     </div>
    </div>
   </div>
       <div class="form-group row">
    <label class="col-lg-3 col-form-label">End Date</label>
    <div class="col-lg-6">
     <div class="input-group">
      <div class="input-group-prepend"><span class="input-group-text"><i class="la la-chain"></i></span></div>
      <input type="datetime-local" class="form-control" id="End"/>
     </div>
    </div>
   </div>
   <div class="form-group row align-items-center">
    <label class="col-lg-3 col-form-label">Communication:</label>
    <div class="col-lg-6">
     <div class="checkbox-inline">
      <label class="checkbox">
       <input type="checkbox"/>
       <span></span>
       Email
      </label>
      <label class="checkbox">
       <input type="checkbox"/>
       <span></span>
       SMS
      </label>
      <label class="checkbox">
       <input type="checkbox"/>
       <span></span>
       Phone
      </label>
     </div>
    </div>
   </div>
  </div>

 </div>
 <div class="card-footer">
  <div class="row">
   <div class="col-lg-3"></div>
   <div class="col-lg-6">
    <button type="submit" class="btn btn-success mr-2" runat="server" onclick="btnSubmit_OnClick">Submit</button>
    <button type="reset" class="btn btn-secondary">Cancel</button>
   </div>
  </div>
 </div>
</form>
</asp:Content>
