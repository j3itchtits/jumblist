<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Home</h2>
    
    
    <p><%= Html.ActionLink("View All Posts", "index", "posts")%></p>
    
    <p><%= Html.ActionLink( "Tags", "index", "tags" ) %></p>
    
    <p><%= Html.ActionLink("Locations", "index", "locations")%></p>
    
      
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

     <p>London weather: <%= HttpContext.Current.Items["Temp"] %></p>

</asp:Content>
