<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Entity.Location>>" %>

<div>
<% foreach ( var location in Model )
   { %>
        <% Html.RenderPartial( "LocationSummar", location ); %>     
<% } %>
</div>