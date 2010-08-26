<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentDescription" runat="server"><%= Html.Encode( Model.Item.Body ).ToShortDescription() %></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <script src="<%= Url.Script( "jquery.highlight-3.js" )%>" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function() {

            getTinyURL('<%= Request.Url.AbsoluteUri %>', function(tinyurl) {
                // Do something with tinyurl:
                $('#twitter-share').attr('href', 'http://twitter.com/home?status=@jumblist: <%= Html.PageTitle( ViewData.Model ) %>' + tinyurl);
            });

            $('h2.post-title').highlight('<%= Model.Item.Tags.Select( x => x.Name ).ToFormattedStringList( "{0}+", 1 ) %>');
        });
            
    </script> 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2 class="post-title"><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div class="post-functions">
        <%= Ajax.SavePostToBasketLink( "Save", new { id = Model.Item.PostId }, new { @class = "icon", title = "Save post to my basket" } )%>
        <%= Ajax.EmailPostLink( "Email", new { id = Model.Item.PostId }, new { @class = "icon", title = "Email me the post details" } )%>
        <%= Html.MapLink( "Map", "icon", Model.Item )%> 
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
        <b>Number of Views: </b><%= Model.Item.NumberofViews.ToString() %>
    </div>  
    
    <div class="post-date">
        <b>Publish Date: </b><%= Model.Item.PublishDateTime.ToFriendlyJumblistLongDateTimeString( true ) %>
    </div>        
   
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentRight" runat="server">
      
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

    <div class="widget widget-plain">
        <h3>Share with friends</h3>

        <div class="facebook-share-button"><fb:share-button href="<%= Request.Url.AbsoluteUri %>" type="button"></fb:share-button></div>
        <a href="http://twitter.com/share" class="twitter-share-button" data-count="none" data-via="jumblistuk">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>

        
    </div>
    
   

     
</asp:Content>

