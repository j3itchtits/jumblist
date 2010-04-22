<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Link>>" %>

<b>Categories</b><br />
<ul>
<% foreach ( var link in Model ) { %>
       <li><a href="<%= Url.RouteUrl( link.RouteValues )%>" class="<%= link.IsSelected ? "selected" : "" %>"><%= link.Text %></a></td>
<% } %>
</ul>
<br />

<b>Tags</b><br />
<%= Html.TextBox("tagSearch")%>