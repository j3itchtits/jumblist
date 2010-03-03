<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Feed>>" %>

<table class="list">
<% foreach ( var feed in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink(Html.Encode(feed.Name), "group", "posts", new { id = feed.FriendlyUrl }, null)%></td> 
        </tr> 
<% } %>
</table>         
