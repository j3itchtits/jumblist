<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Model.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Posts By Category
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Posts By Category - <%= ViewData["CategoryName"]%></h2>

    <% Html.RenderPartial( "ListPosts", Model ); %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "Category", new { parameter1 = ViewData["CategoryName"], parameter2 = x } ) )%></p>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderAction( "categories", "posts", new { highlightedCategory = ViewData["CategoryName"] } ); %>
    
</asp:Content>