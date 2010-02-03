<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PostLocation>>" %>

<table>
<%  foreach ( var postLocation in Model )
    { %>
        <tr>
        <td><%= postLocation.Location.Name %></td>  
        <td><%= Ajax.ActionLink( "Delete", "postlocationdelete", new { postId = postLocation.Post.PostId, postLocationId = postLocation.Id }, new AjaxOptions { HttpMethod = "Delete", UpdateTargetId = "post-locations" } ) %></td> 
        </tr>
<%  } %>
</table>
