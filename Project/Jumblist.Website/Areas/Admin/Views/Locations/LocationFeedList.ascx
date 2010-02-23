<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<FeedLocation>>" %>

<table>
<%  foreach ( var feedLocation in Model )
    { %>
        <tr>
        <td><%= feedLocation.Feed.Name%></td>  
        </tr>
<%  } %>
</table>
