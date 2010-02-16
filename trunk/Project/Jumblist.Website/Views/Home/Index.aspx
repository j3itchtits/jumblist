<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    
    <p><%= Html.ActionLink("View All Posts", "index", "posts")%> - <%= Html.ActionLink("Wanted", "category", "posts", new { id = "Wanted" }, null ) %> - <%= Html.ActionLink( "Offered", "category", "posts", new { id = "Offered" }, null )%></p>
    
    <p><%= Html.ActionLink( "Tags", "index", "tags" ) %></p>
    
    <p><%= Html.ActionLink("Locations", "index", "locations")%></p>
    
    <p><%= Html.ActionLink("Groups", "index", "groups")%></p>
    

      
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">


     
     <p>Latest Items</p>
     <% Html.RenderAction("basiclist", "posts", new { top = 5 } ); %>

</asp:Content>
