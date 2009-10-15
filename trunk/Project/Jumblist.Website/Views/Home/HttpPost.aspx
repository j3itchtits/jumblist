<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	HttpPost
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>HttpPost</h2>

    <p>Url requested (POST): <%= ViewData["PostUrl"] %></p>
    <pre><%= Html.Encode( ViewData["PostResponse"] )%></pre>
    
</asp:Content>
