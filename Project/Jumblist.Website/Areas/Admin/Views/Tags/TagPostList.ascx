<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PostTag>>" %>

<table>
<%  foreach ( var postTag in Model )
    { %>
        <tr>
        <td><%= postTag.Post.Title.Substring(0, 10)%></td>  
        </tr>
<%  } %>
</table>
