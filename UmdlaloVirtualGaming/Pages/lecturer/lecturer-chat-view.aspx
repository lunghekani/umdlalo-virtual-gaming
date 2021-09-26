<%@ Page Title="" Language="C#" MasterPageFile="~/Lecturer.Master" AutoEventWireup="true" CodeBehind="lecturer-chat-view.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.lecturer.lecturer_chat_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <h3>Private Chat Course List</h3>
  <ul class="list-group">
	<%
        foreach (var item in  chat.CURRENT_ADMIN_All_COURSE_ID_AND_NAME()	)
        {  
	%>
          <li class="list-group-item">
              <a href="lecture-private-chat.aspx?course_code=<%=item.course_id %>"><%=item.course_name %></a>
          </li>
          
        

    <% } %>
</ul>
					
</asp:Content>
