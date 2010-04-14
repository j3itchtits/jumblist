<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <div class="searchbox">
        <% Html.RenderAction("SearchBox"); %>
    </div>
    
    
<%--    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { "Google", Ajax.GoogleMap().CssClass("GoogleMap").Center(50.853544, 0.56347).Zoom(12).AddPushpin(new Pushpin(50.853544, 0.56347)) }
    }); %>--%>
          
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <p>Quick View</p>
    <p><%= Html.ActionLink("Everything", "index", "posts")%><br />
    <%= Html.ActionLink("Wanted", "category", "posts", new { id = "Wanted" }, null ) %><br />
    <%= Html.ActionLink( "Offered", "category", "posts", new { id = "Offered" }, null )%></p>
     
     <p>Latest Items</p>
     <% Html.RenderAction("basiclist", "posts", new { top = 5 } ); %>

</asp:Content>
