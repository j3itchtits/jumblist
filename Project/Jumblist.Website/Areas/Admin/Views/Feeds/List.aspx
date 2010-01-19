<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Model.PageTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>
    <%= Html.MessageBoxAlt( ViewData.Model )%>
    
    <div id="itemsList">
        <% Html.RenderPartial( "ListPartial", Model.List ); %>
    </div>
    
    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
    
</asp:Content>
