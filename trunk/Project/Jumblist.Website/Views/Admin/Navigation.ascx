<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>

<table class="navigation">
<tr>
<td><%= Html.ActionLink( "Admin Home", "index" ) %></td>
<td><%= Html.ActionLink( "Posts", "posts" ) %></td>
<td><%= Html.ActionLink( "Tags", "tags" ) %></td>
<td><%= Html.ActionLink( "Locations", "locations" )%></td>
<td><%= Html.ActionLink( "Feeds", "feeds" )%></td>
<td><%= Html.ActionLink( "Authors", "zuthors" )%></td>
</tr>
</table>
