<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	All Posts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>All Posts</h2>
    
    <% Html.RenderPartial( "ListPosts", Model ); %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "List", new { parameter1 = x } ) )%></p>
    
    <p><%= Html.NextPreviousPageLinks( Model.CurrentPage, Model.HasPreviousPage, Model.HasNextPage, x => Url.Action( "List", new { parameter1 = x } ) )%></p>
    
    <p><% Html.RenderAction( "categories" ); %></p>
    
</asp:Content>
