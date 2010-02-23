<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<FeedLocation>>" %>

<table>
<%  foreach ( var feedLocation in Model )
    { %>
        <tr>
        <td><%= feedLocation.Location.Name%></td>  
        <td><%= Ajax.ActionLink("Delete", "feedlocationdelete", new { feedId = feedLocation.Feed.FeedId, feedLocationId = feedLocation.Id }, new AjaxOptions { HttpMethod = "Delete", UpdateTargetId = "feed-locations" })%></td> 
        </tr>
<%  } %>
</table>
