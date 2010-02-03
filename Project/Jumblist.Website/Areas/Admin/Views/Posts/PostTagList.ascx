<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PostTag>>" %>

<table>
<%  foreach ( var postTag in Model )
    { %>
        <tr>
        <td><%= postTag.Tag.Name%></td>  
        <td><%= Ajax.ActionLink( "Delete", "posttagdelete", new { postId = postTag.Post.PostId, postTagId = postTag.Id }, new AjaxOptions { HttpMethod = "Delete", UpdateTargetId = "post-tags" } )%></td> 
        </tr>
<%  } %>
</table>
