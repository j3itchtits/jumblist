<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PostTag>>" %>

<table>
<%  foreach ( var postTag in Model )
    { %>
        <tr>
        <td><%= postTag.Tag.Name%></td>  
        <td><%= Ajax.ActionLink("Delete", "posttagdelete", new { id = postTag.Id }, new AjaxOptions { Confirm = "Delete '" + postTag.Tag.Name + "'?", HttpMethod = "Delete", UpdateTargetId = "post-tags" })%></td> 
        </tr>
<%  } %>
</table>
