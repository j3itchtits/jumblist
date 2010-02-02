<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PaginatedList<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= post.Title %></td>  
            <td><%= post.Category.Name %></td>
            <td><%= Html.ActionLink( "Detail", "detail", new { id = post.PostId } )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = post.PostId } )%></td>  
            <td><%= Html.ActionLink( "Delete", "delete", new { id = post.PostId } )%></td>  
        </tr>            
<% } %>
</table>