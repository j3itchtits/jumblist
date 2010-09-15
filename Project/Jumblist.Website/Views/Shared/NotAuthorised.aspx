<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= ViewData["PageTitle"] %></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= ViewData["PageTitle"]%></h2>
    
    <p><%= ViewData["Message"] %></p> 
    
    <p>You may have been logged out. <%= Html.LoginLink( "Please log back in to view the page", Page.Request.Url.PathAndQuery )%>.</p>
    
    <p>If you think there has been a mistake, please leave some feedback using the tab to the left.</p> 

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

