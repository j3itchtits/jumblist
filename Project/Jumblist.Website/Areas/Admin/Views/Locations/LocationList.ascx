<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Location>>" %>

<table class="list">
<% foreach ( var location in Model )
   { %>
        <tr class="item">
            <td class="bold"><%= Html.Encode( location.Name )%></td>  
            <td><%= Html.ActionLink( "Edit", "edit", new { id = location.LocationId } )%></td>  
            <td><%= Ajax.ActionLink( "Delete", "delete", new { id = location.LocationId }, new AjaxOptions { Confirm = "Delete '" + location.Name + "' Post?", HttpMethod = "Delete", UpdateTargetId = "itemsList" } )%></td> 
            <td>[ <%= Html.ActionLink( "List Posts", "listbylocation", "posts", new { id = location.LocationId }, null )%> ]</td> 
            <td>[ <%= Html.ActionLink( "List Posts", "listbylocation", "posts", new { id = location.Name.ToFriendlyUrlEncode() }, null )%> ]</td> 
            <td>[ <%= ((!string.IsNullOrEmpty(location.Area)) ? Html.ActionLink("List Feeds", "listbylocation", "feeds", new { id = location.LocationId }, null) : MvcHtmlString.Create(string.Empty)) %> ]</td>
            
<%--            <%
       
                var bingLocationService = new StuartClode.Mvc.Service.Bing.BingLocationService( location.BingSearch );
        %>
            <td><%= location.LocationId %></td> 
            <td><%= location.BingSearch %></td>
            <td><%= location.Latitude %></td>  
            <td><%= location.Longitude %></td>    --%>
            
        </tr> 
<% } %>
</table>         
