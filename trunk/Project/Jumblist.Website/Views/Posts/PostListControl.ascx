<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<PaginatedList<Post>>" %>

<script type="text/javascript">
    function mapPopup( lat, long, title ) 
    {
        newwindow2 = window.open('', 'name', 'height=200,width=150');
        var tmp = newwindow2.document;
        var arse = '<p style="color: #7df">hello blossom</p>';
        arse += '<p>second para</p>';
        
        tmp.write('<html><head><title>popup</title>');
        tmp.write('<link rel="stylesheet" href="js.css">');
        tmp.write('</head><body><p>this is once again a popup.<br/>lat = ' + lat + '.<br/>long = ' + long + '.<br/>title = ' + title + '</p>');
        tmp.write('<p><a href="javascript:alert(self.location.href)">view location</a>.</p>');
        tmp.write('<p><a href="javascript:self.close()">close</a> the popup.</p>');
        tmp.write(arse);
        tmp.write('</body></html>');
        tmp.close();
    }  
</script>
        
<table class="list">
<% foreach ( var post in Model )
   { %>
        <tr class="item">
            <td><%= Html.RouteLink(post.Title, "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() }, new { title = Html.Encode( post.Body ) })%></td>  
            <td><% if (post.HaveLatitudeAndLongitudeValuesBeenPopulated) 
               { %>
                    <a href="#" onclick="mapPopup( <%= post.Latitude %>, <%= post.Longitude %>, '<%= Html.Encode( post.Title ) %>' );">Map</a> <% 
               } %>
            </td>
            <td><%= Html.ActionLink( post.Feed.Name, "group", new { id = post.Feed.Name.ToFriendlyUrlEncode() } )%></td>
            <td><%= Html.Encode( post.Category.Name ) %></td>
            <% if ( Page.Request.IsAuthenticated )
               { %>
                   <td><% Html.RenderPartial( "AddToBasketControl", post ); %></td>
                   <td>Email me</td> <%
               } %>
<%--            <div class="popupContact" id="pc-<%= post.PostId %>"><a id="popupContactClose">x</a><p>Title of our cool popup, yay!</p><p style="height:100px">Id of this map = <%= post.PostId %> </p></div><div id="backgroundPopup"></div>              
--%>        </tr>            
<% } %>
</table>

