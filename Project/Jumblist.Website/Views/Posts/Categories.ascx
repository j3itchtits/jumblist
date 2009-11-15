<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Jumblist.Website.Services.Navigation.Link>>" %>

<table cellpadding="5" border="1" width="100%">
<tr><td colspan="2">Post Categories</td></tr>
<% foreach ( var link in Model ) { %>
        <tr class="item">
            <td><%= link.Text %></td> 
            <td><a href="<%= Url.RouteUrl( link.RouteValues )%>" class="<%= link.IsSelected ? "selected" : "" %>">Posts</a></td>
        </tr>            
<% } %>
</table>