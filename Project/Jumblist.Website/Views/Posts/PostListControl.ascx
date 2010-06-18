<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PagedList<Post>>" %>

<table>
<% foreach ( var post in Model )
   { %>
        <tr>
            <td>
                <%= Html.RouteLink(post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() }, new { title = post.Body })%>
            </td>  
            <td>
                Tags: <%= Html.TagListLinks( post.Tags )%>
            </td>            
            <td>
                <%= Html.MapLink( post )%>
            </td>
            <td>
            
            <% if ( post.Feed != null )
               { %>
                    <%= Html.ActionLink( post.Feed.Name, "group", new { id = post.Feed.Name.ToFriendlyUrlEncode() } )%>
            <% } %>            
            
            </td>
            <td>
                <%= (DateTime.Now.Subtract( post.PublishDateTime )).ToDateTimeDiff( post.PublishDateTime )%>
            </td>
            <td>
                <%= Html.Encode( post.Category.Name ) %>
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

