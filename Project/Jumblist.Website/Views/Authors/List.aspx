<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Entity.Author>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	All Authors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>All Authors</h2>
    
    <% 
        foreach ( var author in Model )
        {
            Html.RenderPartial( "AuthorSummary", author );
        }
    %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "List", new { parameter1 = x } ) ) %></p>

</asp:Content>
