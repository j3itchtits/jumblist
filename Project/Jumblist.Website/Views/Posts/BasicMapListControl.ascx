<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Pushpin>>" %>

<ul class="basicmaplist">
<% foreach ( Pushpin p in Model )
   { %>
    <li><%= p.Description %></li>            
<% } %>
</ul>
