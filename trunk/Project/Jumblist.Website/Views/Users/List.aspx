<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( Model ) %>
    
    <div id="itemsList">
        <% Html.RenderPartial( "ListPartial", Model.List ); %>
    </div>
    
    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
   
</asp:Content>

