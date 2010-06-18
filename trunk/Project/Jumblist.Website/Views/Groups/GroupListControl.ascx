<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Feed>>" %>

<table>
<% foreach ( var feed in Model )
   { %>
        <tr>
            <td><%= Html.ActionLink( feed.Name, "group", "posts", new { id = feed.FriendlyUrl }, null )%> (<%= feed.Posts.Count( x => x.Display == true )%>)</td> 
            <td><%= Html.ActionLink( "Offered", "group", "posts", new { id = feed.FriendlyUrl, category = "offered" }, null )%> (<%= feed.Posts.Count( x => x.Display == true && x.Category.Name == "Offered" )%>)</td> 
            <td><%= Html.ActionLink( "Wanted", "group", "posts", new { id = feed.FriendlyUrl, category = "wanted" }, null )%> (<%= feed.Posts.Count( x => x.Display == true && x.Category.Name == "Wanted" )%>)</td> 
        </tr> 
<% } %>
</table>         
