<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= ViewData["Title"] %></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= ViewData["Title"] %></h2>
    
    <p><%= ViewData["Description"]%></p>

    <p>You can send us some feedback using the tab to the left or just <a href="/">return back to the home page</a>.</p> 

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>


