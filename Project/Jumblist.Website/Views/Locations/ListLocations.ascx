<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Location>>" %>

<div>
<% foreach ( var location in Model )
   { %>
        <p>
            <%= Html.ActionLink( location.Name, "location", "posts", new { parameter1 = Url.ToFriendlyUrl( location.Name ) }, null )%>
        </p>            
<% } %>
</div>