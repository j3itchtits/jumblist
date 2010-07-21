<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PagedList<Post>>" %>


<table class="post-list">
<% foreach ( var post in Model )
   { %>
   
    <tr class="post-item">
        <td>
            <%= Html.Encode( post.Category.Name ) %>
        </td>
        <td>
            <%= Html.Encode( post.NumberofViews ) %><br />Views
        </td>
        <td>

            <table class="post-detail">
            <tr>
                <td colspan="3" class="post-title">
                    <%= Html.RouteLink( post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() }, new { title = post.Body } ) %> <%= Html.MapLink( post )%>
                </td>
            </tr>
            <tr>
                <td class="post-tags">
                    <%= Html.PostTagListLinks( post.Tags )%>
                </td>
                <td class="post-time">
                    <%= (DateTime.Now.Subtract( post.PublishDateTime )).ToDateTimeDiff( post.PublishDateTime )%>
                </td>
                <td class="post-groupuser">
                    <%= Html.PostOriginLink( post )%>
                </td>
            </tr>
            </table>

        </td>
        <td>
            <%= Ajax.SavePostToBasketLink( "Save", new { id = post.PostId } )%>
        </td>
        <td>
            <%= Ajax.EmailPostLink( "Email", new { id = post.PostId } )%>
        </td>
    </tr>
        
<% } %>
</table>

