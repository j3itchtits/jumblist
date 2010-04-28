<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">
    
    <% Html.RenderAction("Search"); %>
          
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <p>Quick View</p>
    <p><%= Html.ActionLink("Everything", "index", "posts")%><br />
    <%= Html.ActionLink("Wanted", "category", "posts", new { id = "Wanted" }, null ) %><br />
    <%= Html.ActionLink( "Offered", "category", "posts", new { id = "Offered" }, null )%></p>
     
     <p>Latest Items</p>
     <% Html.RenderAction("BasicList", "posts", new { top = 5 } ); %>

</asp:Content>
