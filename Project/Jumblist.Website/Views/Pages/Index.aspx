<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Home</h2>
    
   
    <p><%= Html.ActionLink( "View All Posts", "list", "posts" ) %></p>
    
    <p><%= Html.ActionLink( "View All Tags", "list", "tags" ) %></p>
    
    <p><%= Html.ActionLink( "View All Locations", "list", "locations" ) %></p>
    
    <p>-----------</p>
    
    <p><%= Html.ActionLink( "View Posts By Tag", "tagged", "posts", new { parameter1 = Url.ToFriendlyUrl( "Fridge" ) }, null )%></p>
    <p><%= Html.ActionLink( "View Posts By Location", "location", "posts", new { parameter1 = Url.ToFriendlyUrl( "TN38" ) }, null )%></p>
    
</asp:Content>
