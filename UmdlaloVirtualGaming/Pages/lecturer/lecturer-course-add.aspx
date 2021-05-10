<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-course-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_course_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form">
 <div class="card-body">
  <h3 class="font-size-lg text-dark font-weight-bold mb-6">1. Customer Info:</h3>
  <div class="mb-15">
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Full Name:</label>
    <div class="col-lg-6">
     <input type="email" class="form-control" placeholder="Enter full name"/>
     <span class="form-text text-muted">Please enter your full name</span>
    </div>
   </div>
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Email address:</label>
    <div class="col-lg-6">
     <input type="email" class="form-control" placeholder="Enter email"/>
     <span class="form-text text-muted">We'll never share your email with anyone else</span>
    </div>
   </div>
  </div>

  <h3 class="font-size-lg text-dark font-weight-bold mb-6">2. Customer Account:</h3>
  <div class="mb-3">
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Holder:</label>
    <div class="col-lg-6">
     <input type="email" class="form-control" placeholder="Enter full name"/>
     <span class="form-text text-muted">Please enter your account holder</span>
    </div>
   </div>
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Contact</label>
    <div class="col-lg-6">
     <div class="input-group">
      <div class="input-group-prepend"><span class="input-group-text"><i class="la la-chain"></i></span></div>
      <input type="text" class="form-control" placeholder="Phone number"/>
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
    <button type="reset" class="btn btn-success mr-2">Submit</button>
    <button type="reset" class="btn btn-secondary">Cancel</button>
   </div>
  </div>
 </div>
</form>
</asp:Content>
