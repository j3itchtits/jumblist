<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PaginatedList<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink( post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrl() })%></td>  
            <td><%= Html.Encode( post.Category.Name ) %></td>
            <td><% Html.RenderPartial( "AddToBasket", post ); %></td>             
        </tr>            
<% } %>
</table>