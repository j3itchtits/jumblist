<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Entity.Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	All Feeds
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>All Feeds</h2>
    
    <% 
        foreach ( var feed in Model )
        {
            Html.RenderPartial( "FeedSummary", feed );
        }
    %>

    <p><%= Html.PagingLinks( Model.CurrentPage, Model.TotalPages, x => Url.Action( "List", new { parameter1 = x } ) )%></p>


</asp:Content>
