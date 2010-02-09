<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink(post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrl() })%></td>  
        </tr>            
<% } %>
</table>