<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-calendar-view.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.student_calendar_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card card-custom">

        <div class="card-header flex-wrap border-0 pt-6 pb-0">
										<h3 class="card-title align-items-start flex-column">
											<span class="card-label font-weight-bolder text-dark">My Calendar</span>
											<span class="text-muted mt-1 font-weight-bold font-size-sm">Upcoming Events &amp; Happenings</span>
										</h3>


										<div class="card-toolbar">
											<a href="#" class="btn btn-success font-weight-bold py-3 px-6">
											<i class="ki ki-plus icon-1x mr-2"></i>New Event</a>
										</div>
									</div>


        <asp:Calendar ID="Calendar1" runat="server" Height="800px" Width="1000px" ></asp:Calendar>

    </div>
	
	<%--<div id="AddTaskPane" onblur="this.style.visibility='hidden'" style="position:absolute; visibility:hidden; width:200px; height:100px; background-color:#FFFF66">

      

       Enter Title: <asp:TextBox ID="txtTitle" runat="server" />

      

           <asp:Button ID="Btn_AddTask" runat="server" Text="Add Task" OnCommand="Btn_AddTask_Command" />        

       </div>--%>

</asp:Content>
