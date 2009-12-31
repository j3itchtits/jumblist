<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    <div id="itemsList">

        <% if ( TempData["notificationmessage"] != null )
           { %>
            <p><%= Html.Encode( TempData["notificationmessage"] )%></p>
        <% } %>
        
        <% Html.RenderPartial( "ListPartial", Model.Items ); %>

    </div>
    
    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
   
</asp:Content>
