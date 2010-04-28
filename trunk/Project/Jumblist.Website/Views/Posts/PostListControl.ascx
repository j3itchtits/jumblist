<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PaginatedList<Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink(post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() }, new { title = Html.Encode( post.Body ) })%></td>  
            <td><% if (post.HaveLatitudeAndLongitudeValuesBeenPopulated) 
               { %>
                    <a title="Approximate location of <%= Html.Encode( post.Title ) %>" href="#" onclick="mapPopup( <%= post.Latitude %>, <%= post.Longitude %>, '<%= Html.Encode( post.Title ) %>' );">Map</a> <% 
               } %>
            </td>
            <td><%= Html.ActionLink( post.Feed.Name, "group", new { id = post.Feed.Name.ToFriendlyUrlEncode() } )%></td>
            <td><%= Html.Encode( post.Category.Name ) %></td>
            <% if ( Page.Request.IsAuthenticated )
               { %>
                   <td><% Html.RenderPartial( "AddToBasketControl", post ); %></td>
                   <td>Email me</td> <%
               } %>
        </tr>            
<% } %>
</table>

