<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Home</h2>
    
    <p><%= Html.ActionLink( "View All Posts", "list", "posts" ) %></p>
    
    <p><%= Html.ActionLink( "View All Tags", "list", "tags" ) %></p>
    
    <p><%= Html.ActionLink( "View All Locations", "list", "locations" ) %></p>
    
    <p><%= Html.ActionLink( "View All Authors", "list", "authors" ) %></p>
    
    <p><%= Html.ActionLink( "View All Feeds", "list", "feeds" ) %></p>
      
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <p><%= Html.ActionLink( "View Posts By Tag", "tagged", "posts", new { id = "Fridge".ToFriendlyUrl() } )%></p>
    <p><%= Html.ActionLink( "View Posts By Location", "location", "posts", new { id = "TN38".ToFriendlyUrl() } )%></p>
 
</asp:Content>
