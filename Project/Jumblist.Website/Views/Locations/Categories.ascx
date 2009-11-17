<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IQueryable<Jumblist.Data.Model.LocationCategory>>" %>

<table cellpadding="5" border="1" width="100%">
<tr><td>Location Categories</td></tr>
<% foreach ( var category in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( category.Name, "category", "locations", new { parameter1 = Url.ToFriendlyUrl( category.Name ) }, null )%></td> 
        </tr>            
<% } %>
</table>