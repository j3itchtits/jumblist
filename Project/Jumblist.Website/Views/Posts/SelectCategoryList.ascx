<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Link>>" %>

<table cellpadding="5" border="1" width="100%">
<tr><td>Categories</td></tr>
<% foreach ( var link in Model ) { %>
        <tr class="item">
            <td><a href="<%= Url.RouteUrl( link.RouteValues )%>" class="<%= link.IsSelected ? "selected" : "" %>"><%= link.Text %></a></td>
        </tr>            
<% } %>
</table><br />