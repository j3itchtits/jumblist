<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Helpers.PaginatedList<Jumblist.Model.Entity.Location>>" %>

<table cellpadding="5">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( location.Name, "location", "posts", new { parameter1 = Url.ToFriendlyUrl( location.Name ) }, null )%></td>
             
        </tr>            
<% } %>
</table>