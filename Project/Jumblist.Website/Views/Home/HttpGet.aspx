<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	HttpGet
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>HttpGet</h2>

    <p>Current weather conditions in Hastings: <%= Html.Encode( ViewData["Weather"] )%></p>
    
    <p>Url requested (GET): <%= ViewData["GetUrl"] %></p>
    <pre><%= Html.Encode( ViewData["GetResponse"] )%></pre>


    
</asp:Content>
