<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <div class="post-detail">

        <div style="padding: 20px 0px;">
            <%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaksWithHtmlBrTags()%>
        </div>
        
        <div>
            <b>Publish Date: </b><br />
            <%= Model.Item.PublishDateTime.ToString( "dddd, dd MMMM yyyy" ) %> at <%= Model.Item.PublishDateTime.ToString( "h:mm tt" )%>. <%= (DateTime.Now.Subtract( Model.Item.PublishDateTime )).ToDateTimeDiff( Model.Item.PublishDateTime, true )%>
        </div> 

        <% if ( Model.Item.Url != null )
           { %>
                <div>
                    <b>View: </b><br />
                    <a href="<%= Model.Item.Url %>" target="_blank">Original Post on <%= Model.Item.Feed.Name %></a>      
                </div> <%
           } %>


        <div>
            <%= Ajax.SavePostToBasketLink( "Save", new { id = Model.Item.PostId } )%>
        </div>


        <div>
            <%= Ajax.EmailPostLink( "Email", new { id = Model.Item.PostId } )%>
        </div>
            
             
    </div>
   
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentRight" runat="server">



    <div class="post-category">
        <b>Category: </b><br />
        <%= Html.ActionLink( Model.Item.Category.Name, "category", new { id = Model.Item.Category.Name.ToFriendlyUrlEncode() } ) %>
    </div>

    <% if ( Model.Item.Feed != null )
       { %>
            <div class="post-group">
                <b>Group: </b><br />
                <%= Html.ActionLink( Model.Item.Feed.Name, "group", new { id = Model.Item.Feed.FriendlyUrl } )%>
            </div>
    <% } %>
           
    <div class="post-tags">
        <b>Tags: </b><br />
        <%= Html.TagListLinks( Model.Item.Tags ) %>
    </div>
    
    <div class="post-locations">
        <b>Location: </b><br />
        <%= Html.LocationListLinks( Model.Item.Locations )%>

        <%  if ( Model.Item.HaveLatitudeAndLongitudeValuesBeenPopulated ) 
           { %>
                [ <a title="Approximate location of <%= Html.Encode( Model.Item.Title ) %>" href="#" onclick="mapPopup( <%= Model.Item.Latitude %>, <%= Model.Item.Longitude %>, '<%= Html.Encode( Model.Item.Title ) %>' );">Map</a> ]<% 
           } %>
            
    </div>

    <div class="socialmedia">
        <a name="fb_share" type="button" href="http://www.facebook.com/sharer.php">Share</a><script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script><br />
        <a href="http://twitter.com/home?status=Currently reading <%= Request.Url.ToString()  %>" title="Click to share this post on Twitter" target="_blank">Share on Twitter</a>       <br /><br /><br />
        
        <a class="addthis_button_twitter"><img src="http://www.jhuskisson.com/wp-content/themes/freelance-freedom/images/share/twitter.gif" alt="Share on Twitter" /></a>        
        <a class="addthis_button_facebook"><img src="http://www.jhuskisson.com/wp-content/themes/freelance-freedom/images/share/facebook.gif" alt="Share on Facebook" /></a>        
        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4bd95caa15382da2"></script>
    </div>
    
</asp:Content>

