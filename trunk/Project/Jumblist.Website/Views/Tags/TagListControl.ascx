<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<table class="list">
<% foreach ( var tag in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink(tag.Name, "tagged", "posts", new { id = tag.FriendlyUrl }, null)%></td>             
            <td><%= Html.ActionLink("Offered", "tagged", "posts", new { id = tag.FriendlyUrl, category = "offered" }, null)%></td>
            <td><%= Html.ActionLink("Wanted", "tagged", "posts", new { id = tag.FriendlyUrl, category = "wanted" }, null)%></td>
        </tr> 
<% } %>
</table>         
