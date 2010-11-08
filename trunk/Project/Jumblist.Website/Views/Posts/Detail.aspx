<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentDescription" runat="server"><%= Html.Encode( Model.Item.Body ).ToShortDescription() %></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <%= Html.ColorboxProjectRefs()%>

<%--    <script src="http://maps.google.com/maps?file=api&v=2&key=devapikey&sensor=false" type="text/javascript"></script> 
    <script src="<%= Url.Script( "jquery.gmap-v2-alt.js" )%>" type="text/javascript"></script> --%>
    
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.gmap.js" )%>" type="text/javascript"></script>   
     
    <script src="<%= Url.Script( "jquery.highlight-3.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.sendemailpopup.js" )%>" type="text/javascript"></script>
    <script src="http://cdn.topsy.com/topsy.js?init=topsyWidgetCreator" type="text/javascript"></script>
        
    <script type="text/javascript">

        $(document).ready(function() {

            //            getTinyURL('<%= Request.Url.AbsoluteUri %>', function(tinyurl) {
            //                // Do something with tinyurl:
            //                $('#twitter-share').attr('href', 'http://twitter.com/home?status=@jumblist: <%= Html.PageTitle( ViewData.Model ) %>' + tinyurl);
            //            });

            $('h2.post-title').highlight('<%= Model.Item.Tags.Select( x => x.Name ).ToFormattedStringList( "{0}+", 1 ) %>');

            $('.emailPostLink').sendemailpopup({ textfield_defaulttext: '<%= Model.User.Email %>' });

        });
            
    </script> 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2 class="post-title"><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div class="post-functions">
        <%= Ajax.SavePostToBasketImageLink( "Save post to basket", new { id = Model.Item.PostId }, new { title = "Save post to my basket" } )%>
        <%= Html.SendEmailImageLink( Model.Item ) %>
        <%--<%= Ajax.EmailPostImageLink( "Email post", new { id = Model.Item.PostId, title = Model.Item.Title }, new { title = "Email me the post details" } )%>--%>
        <%= Html.MapPostImageLink( "/assets/images/map-icon.png", "Location of post on map", "setMapV3", Model.Item )%> 
    </div>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <% if ( Model.Item.Url != null )
       { %>
            <div class="post-originallink">
                <a href="<%= Model.Item.Url %>" target="_blank" class="red">Contact original poster via <%= Model.Item.Feed.Name %></a>      
            </div> <%
       } %>
           
    <%= Html.EditPostLink( "[Edit]", Model.Item, Model.User ) %>
    
    <div class="post-bodytext">
        <%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaksWithHtmlBrTags()%>
    </div>

    <div class="post-views">
        <b><%= Model.Item.NumberofViews.ToString() %></b> views
    </div>  
    
    <div class="post-date">
        <b>Posted</b> <%= Model.Item.PublishDateTime.ToFriendlyJumblistLongDateTimeString( true ) %>
    </div>        


	<!-- This contains the hidden content for inline map calls --> 
	<% Html.RenderPartial( "GoogleMapPopupControl" ); %>
	
	<!-- This contains the hidden content for inline send email calls --> 	
	<% Html.RenderPartial( "SendEmailControl" ); %>

	   
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentRight" runat="server">


    <div class="widget widget-socialmedia">
        <h3>Share with friends</h3>
        <div class="facebook-share-button"><fb:share-button href="<%= Request.Url.AbsoluteUri %>" type="button"></fb:share-button></div>
        <!--<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script><a href="http://twitter.com/share" class="twitter-share-button" data-count="none" data-via="jumblistuk">Tweet</a>-->
        <div class="topsy_widget_data"><!-- { "url": "<%= Request.Url.AbsoluteUri %>", "nick": "jumblistuk", "order": "retweet,badge,count" } --></div>    
    </div>
          
    <div class="widget widget-green">

        <div class="post-category">
            <h3>Category</h3>
            <%= Html.ActionLink( Model.Item.Category.Name, "category", new { id = Model.Item.Category.Name.ToFriendlyUrlEncode() } ) %>
        </div>

        <% if ( Model.Item.Feed != null )
           { %>
                <div class="post-group">
                    <h3>Group</h3>
                    <%= Html.ActionLink( Model.Item.Feed.Name, "group", new { id = Model.Item.Feed.FriendlyUrl } )%>
                </div>
        <% } %>
               
        <div class="post-tags">
            <h3>Tags</h3>
            <%= Html.PostTagListLinks( Model.Item.Tags ) %>
        </div>
        
        <div class="post-locations">
            <h3>Location</h3>
            <%= Html.PostLocationListLinks( Model.Item.Locations )%>
        </div>

    </div>
     
</asp:Content>

