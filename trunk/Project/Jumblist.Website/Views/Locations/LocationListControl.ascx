<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Location>>" %>

<table class="list">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink(Html.Encode(location.Name), "located", "posts", new { id = location.FriendlyUrl }, null)%></td> 
            <td><%= Html.ActionLink("Offered", "located", "posts", new { id = location.FriendlyUrl, category = "offered" }, null)%></td> 
            <td><%= Html.ActionLink("Wanted", "located", "posts", new { id = location.FriendlyUrl, category = "wanted" }, null)%></td> 
        </tr> 
<% } %>
</table>         
