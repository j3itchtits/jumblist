<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<Jumblist.Website.Services.Paging.PaginatedList<Jumblist.Data.Entity.Post>>" %>

<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink( post.Title, "Post-Detail", new { id = post.PostId, name = Url.ToFriendlyUrl( post.Title ) } )%></td>  
            <td><a href="<%= post.Url %>">Linkback</a></td>      
            <td><%= post.DateTime.ToShortDateString() %></td>
            <td><%= post.Category.Name %></td>
            <td><%= post.Author.Name %></td>
            <td><%= post.Feed.Title %></td>
            <td><% Html.RenderPartial( "AddToBasket", post ); %></td>
        </tr>            
<% } %>
</table>