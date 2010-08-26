<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Pushpin>>" %>

<p><strong>Most Recent Posts</strong></p>
<ul class="basicmaplist">
<% foreach ( Pushpin p in Model )
   { %>
    <li><%= p.Description %></li>            
<% } %>
</ul>
