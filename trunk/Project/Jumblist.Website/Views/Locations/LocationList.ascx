<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Location>>" %>

<table class="list">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td><%= Html.ActionLink(Html.Encode(location.Name), "location", "posts", new { id = location.Name.ToFriendlyUrl() }, null)%></td> 
        </tr> 
<% } %>
</table>         
