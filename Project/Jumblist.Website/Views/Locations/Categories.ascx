<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IQueryable<Jumblist.Model.Entity.LocationCategory>>" %>

<table cellpadding="5">
<% foreach ( var category in Model )
   { %>
        <tr class="item">
            <td><%= category.Name %></td> 
            <td><%= Html.ActionLink( "Locations", "category", "locations", new { parameter1 = Url.ToFriendlyUrl( category.Name ) }, null )%></td>
        </tr>            
<% } %>
</table>