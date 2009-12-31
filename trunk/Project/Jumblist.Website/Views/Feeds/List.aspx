<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Model.PageTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( Model ) %>
    <%= Html.MessageBoxAlt( Model )%>
    
    <div id="itemsList">
        <% Html.RenderPartial( "ListPartial", Model.Items ); %>
    </div>
    
    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
    
</asp:Content>
