<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.Encode( post.Title ) %></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = post.PostId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = post.PostId }, new AjaxOptions { Confirm = "Delete '" + post.Title + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
