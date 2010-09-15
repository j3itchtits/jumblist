<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Location>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <% Html.RenderPartial( "LocationListControl", Model.List ); %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
