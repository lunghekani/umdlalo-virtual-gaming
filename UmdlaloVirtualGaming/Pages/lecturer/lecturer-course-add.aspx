<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-course-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_course_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form class="form">
 <div class="card-body">
  <b><h3 class="font-size-lg text-dark font-weight-bold mb-6">Course Creation:</h3></b>
  <div class="mb-15">
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Course Name:</label>
    <div class="col-lg-6">
     <input type="email" class="form-control" placeholder="Enter Course Name"/>
     <span class="form-text text-muted">Please enter the course</span>
    </div>
   </div>
   <div class="form-group row">
    <label class="col-lg-3 col-form-label">Course Information:</label>
    <div class="col-lg-6">
     <input type="email" class="form-control" placeholder="Enter Course Information"/>
    </div>
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
