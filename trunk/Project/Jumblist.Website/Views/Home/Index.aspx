<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Home
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">


    <% using (Html.BeginForm("homepagesearch", "search"))
       { %>
            <p><%= Html.TextBox( "searchstring" ) %> <%= Html.SubmitButton( "submit", "Search" ) %></p>
<%--            <p><%= Html.RadioButtonList("searchoptions", new[] { "All", "Offered", "Wanted" }, "All" )%></p>
--%>    <% } %>
    
    <p><%= Html.ActionLink("View All Posts", "index", "posts")%> - <%= Html.ActionLink("Wanted", "category", "posts", new { id = "Wanted" }, null ) %> - <%= Html.ActionLink( "Offered", "category", "posts", new { id = "Offered" }, null )%></p>
    
      
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">


     
     <p>Latest Items</p>
     <% Html.RenderAction("basiclist", "posts", new { top = 5 } ); %>

</asp:Content>
