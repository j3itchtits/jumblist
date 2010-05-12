<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Post>>" %>

<ul class="basiclist">
<% foreach ( var post in Model )
   { %>
        <li><%= Html.RouteLink( post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() } ) %></li>            
<% } %>
</ul>