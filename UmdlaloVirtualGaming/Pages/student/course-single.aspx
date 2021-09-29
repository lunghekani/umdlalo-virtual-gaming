<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="course-single.aspx.cs" Inherits="UmdlaloVirtualGaming.Pages.student.course_single" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView runat="server" ID="gvTopics"
        CssClass="datatable datatable-bordered datatable-head-custom datatable-default datatable-primary datatable-loaded"
        Style="text-align: center; word-wrap: break-word;" AllowPaging="True"
        OnPageIndexChanging="gvTopics_OnPageIndexChanging"
        OnRowCommand="gvTopics_OnRowCommand"
        AlternatingRowStyle-BorderWidth="0px"
        align-content="center"
        DataKeyNames="ID">

        <AlternatingRowStyle BorderWidth="0px" CssClass="bottomBorder"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    Action      
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Button CommandName="View" runat="server" Class="btn btn-primary  fa"
                        Text="&#xf06e;" CommandArgument="<%# Container.DataItemIndex %>"
                        data-toggle="tooltip" data-placement="top" title="View" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>
</asp:Content>
