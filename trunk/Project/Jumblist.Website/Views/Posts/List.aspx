<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	All Posts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>All Posts</h2>
    
    <% Html.RenderPartial( "ListPosts", Model ); %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "List", new { parameter1 = x } ) )%></p>
    
    <p><%= Html.NextPreviousPageLinks( Model.CurrentPage, Model.HasPreviousPage, Model.HasNextPage, x => Url.Action( "List", new { parameter1 = x } ) )%></p>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderAction( "categories" ); %>
    
</asp:Content>
