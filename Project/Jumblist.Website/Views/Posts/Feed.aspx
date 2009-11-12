<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	Posts By Feed
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Posts By Feed</h2>

    <% Html.RenderPartial( "ListPosts", Model ); %>
    
    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "Feed", new { parameter1 = Model.FirstOrDefault().Feed.TitleUrlEncoded, parameter2 = x } ) )%></p>
    
</asp:Content>
