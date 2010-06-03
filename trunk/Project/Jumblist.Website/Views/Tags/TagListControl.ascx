<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Tag>>" %>

<table class="list">
<% foreach ( var tag in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink( tag.Name, "tagged", "posts", new { id = tag.FriendlyUrl }, null ) %> (<%= tag.PostTags.Count( x => x.Post.Display == true ) %>)</td>             
            <td><%= Html.ActionLink( "Offered", "tagged", "posts", new { id = tag.FriendlyUrl, category = "offered" }, null )%> (<%= tag.PostTags.Count( x => x.Post.Display == true && x.Post.Category.Name == "Offered" )%>)</td> 
            <td><%= Html.ActionLink( "Wanted", "tagged", "posts", new { id = tag.FriendlyUrl, category = "wanted" }, null )%> (<%= tag.PostTags.Count( x => x.Post.Display == true && x.Post.Category.Name == "Wanted" )%>)</td> 
        </tr> 
<% } %>
</table>         
