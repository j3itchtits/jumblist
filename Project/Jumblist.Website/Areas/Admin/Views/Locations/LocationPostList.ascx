<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PostLocation>>" %>

<table>
<%  foreach ( var postLocation in Model )
    { %>
        <tr>
        <td><%= postLocation.Post.Title.Substring( 0, 10 ) %></td>  
        </tr>
<%  } %>
</table>
