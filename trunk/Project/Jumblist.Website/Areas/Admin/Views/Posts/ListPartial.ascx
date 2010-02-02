<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td class="bold"><a href="<%= Html.Encode( post.Url ) %>"><%= Html.Encode( post.Title ) %></a></td>  
            <td><%= Html.Encode( post.Category.Name ) %></td> 
            <td><%= Html.Encode( post.User.Name ) %></td> 
            <td><%= Html.Encode( post.Feed.Title ) %></td>  
            <td><%= Html.Encode( post.Display.ToString() ) %></td> 
            <td><%= Html.Encode( post.DateTime.ToString() ) %></td> 
            <td><%= Html.ActionLink( "Edit", "edit", new { id = post.PostId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = post.PostId }, new AjaxOptions { Confirm = "Delete '" + post.Title + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
        </tr> 
<% } %>
</table>         
