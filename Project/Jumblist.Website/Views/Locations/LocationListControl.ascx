<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Location>>" %>

<table class="list">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( location.Name, "located", "posts", new { id = location.FriendlyUrl }, null) %> (<%= location.PostLocations.Count( x => x.Post.Display == true )%>)</td>
            <td><%= Html.ActionLink( "Offered", "located", "posts", new { id = location.FriendlyUrl, category = "offered" }, null) %> (<%= location.PostLocations.Count( x => x.Post.Display == true && x.Post.Category.Name == "Offered" )%>)</td> 
            <td><%= Html.ActionLink( "Wanted", "located", "posts", new { id = location.FriendlyUrl, category = "wanted" }, null) %> (<%= location.PostLocations.Count( x => x.Post.Display == true && x.Post.Category.Name == "Wanted" )%>)</td>  
        </tr> 
<% } %>
</table>         
