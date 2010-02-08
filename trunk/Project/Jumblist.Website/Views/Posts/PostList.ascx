<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PaginatedList<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= post.Title %></td>  
            <td><%= post.Category.Name %></td>
            <td><%= Html.ActionLink( "Detail", "detail", new { id = post.PostId } )%></td>  
            <td>
            <% using(Html.BeginForm("additem", "basket")) { %>
                <%= Html.Hidden("postId", post.PostId) %>
                <%= Html.Hidden("returnUrl", ViewContext.HttpContext.Request.Url.PathAndQuery) %>
                <input type="submit" value="+ Add to cart" />
            <% } %>
            </td>            
        </tr>            
<% } %>
</table>