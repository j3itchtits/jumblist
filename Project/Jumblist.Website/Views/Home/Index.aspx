<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Home</h2>
    
    <%= Html.ActionLink("About","About","hadsf" ) %>
    <%= Html.ActionLink("About", "about", new { controller = "welcome", id = 50 } )%>
    <%= Html.RouteLink("About", "SinglePage", new { action = "About" })%>
    
    <p><%= Html.ActionLink("About","About",new { id = 40 } ) %> | <%= Html.ActionLink("Help", "Help")%></p>
    
    <p><%= Html.ActionLink("View All Posts","Index","Posts") %></p>
    
    <p><%= Html.ActionLink("View Posts By Tag", "Tag", "Posts", new { id = "Fridge" }, null)%></p>
    
</asp:Content>
