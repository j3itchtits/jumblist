<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IQueryable<Jumblist.Model.Entity.LocationCategory>>" %>

<table cellpadding="5" border="1">
<tr><td colspan="2">Location Categories</td></tr>
<% foreach ( var category in Model )
   { %>
        <tr class="item">
            <td><%= category.Name %></td> 
            <td><%= Html.ActionLink( "Locations", "category", "locations", new { parameter1 = Url.ToFriendlyUrl( category.Name ) }, null )%></td>
        </tr>            
<% } %>
</table>