<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

        <h2><%= ViewData["PageTitle"]%></h2>
        
        <p><%= ViewData["Message"] %></p> 
        
        <p>You will need to contact the administrator if you think this is a mistake or <a href="/">return home</a>.</p> 


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
