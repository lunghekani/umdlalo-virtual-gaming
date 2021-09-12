<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-assessment-add.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_assessment_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form class="form">
    <div class="card-body">
     <h3 class="font-size-lg text-dark font-weight-bold mb-6">1. Assessment:</h3>
     <div class="mb-15">
      <div class="form-group row">
       <label class="col-lg-3 col-form-label">Asseeement Name:</label>
       <div class="col-lg-6">
        <span class="form-text text-muted">Enter Asseeement Name:</span>
        <input type="Name" class="form-control" placeholder="Enter Asseeement Name"/>
        <br><label class="col-lg-3 col-form-label">Assessment Information:</label>
       <div class="col-lg-6">
        <span class="form-text text-muted">Enter Assessment Information:</span>
        <input type="Name" class="form-control" placeholder="Enter Assessment Information"/>

        
        
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
