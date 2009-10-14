<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
    </p>

    <p>Current weather conditions in Hastings: <%= Html.Encode( ViewData["Weather"] )%></p>
    
    <p>Url requested (GET): <%= ViewData["GetUrl"] %></p>
    <pre><%= Html.Encode( ViewData["GetResponse"] )%></pre>

    <p>Url requested (POST): <%= ViewData["PostUrl"] %></p>
    <pre><%= Html.Encode( ViewData["PostResponse"] )%></pre>
    
    
</asp:Content>
