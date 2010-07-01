<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IList<Post>>" %>

<table>
<% foreach( var item in Model ) { %>
    <tr>
        <td><%= Html.RouteLink( item.Title, "Post-Detail", new { id = item.PostId, name = item.Title.ToFriendlyUrlEncode() }, new { title = item.Body } )%></td>
        <td>
            <%= Ajax.ActionLink( "Remove", "removeitem", new { postId = item.PostId }, new AjaxOptions { HttpMethod = "Post", UpdateTargetId = "basket-items" } ) %>
        </td>                    
    </tr>
<% } %>
</table>