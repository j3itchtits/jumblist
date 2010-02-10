<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<p>List By</p>

<p><%= Html.ActionLink( "Tags", "index", "tags" ) %></p>

<p><%= Html.ActionLink("Locations", "index", "locations")%></p>

<p><%= Html.ActionLink("Groups", "index", "groups")%></p>