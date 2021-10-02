<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="student-course-list.aspx.cs" EnableEventValidation="false" Inherits="UmdlaloVirtualGaming.Pages.student.student_course_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<asp:GridView runat="server" ID="gvCourses"
              CssClass="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded"
                          
              Style="text-align: center; word-wrap: break-word; " AllowPaging="True"
              OnPageIndexChanging="gvCourses_PageIndexChanging"
              OnRowCommand="gvCourses_OnRowCommand"
              AlternatingRowStyle-BorderWidth="0px"
              align-content="center"
              DataKeyNames="ID">
                          
    <AlternatingRowStyle BorderWidth="0px" CssClass="bottomBorder"></AlternatingRowStyle>
    <Columns  >
        <asp:TemplateField >
            <HeaderTemplate>
                Action      
            </HeaderTemplate>
                                                
            <ItemTemplate >
                <asp:Button CommandName="View" runat="server"  Class="btn btn-primary  fa" 
                            Text="&#xf06e;" CommandArgument="<%# Container.DataItemIndex %>" 
                            data-toggle="tooltip" data-placement="top" title="View"/>
                                                    
            </ItemTemplate>
        </asp:TemplateField>
                                    
    </Columns>

</asp:GridView>
    <div class="row">
        
        <div class="row" id="courseInstance" runat="server"></div>

    </div>








</asp:Content>
