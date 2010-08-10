<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

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
    
    <div id="post-functions">
        <%= Ajax.SavePostToBasketLink( "Save", new { id = Model.Item.PostId }, new { @class = "icon", title = "Save post to your basket" } )%>
        <%= Ajax.EmailPostLink( "Email", new { id = Model.Item.PostId }, new { @class = "icon", title = "Email post details to yourself" } )%>
        <%= Html.MapLink( "Map", "icon", Model.Item )%>         
    </div>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <% if ( Model.Item.Url != null )
       { %>
            <div class="post-originallink">
                <a href="<%= Model.Item.Url %>" target="_blank">Link to original post on <%= Model.Item.Feed.Name %></a>      
            </div> <%
       } %>
           
    <div class="post-bodytext">
        <%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaksWithHtmlBrTags()%>
    </div>

    <div class="post-views">
        <b>Number of Views: </b><%= Model.Item.NumberofViews.ToString() %>
    </div>  
    
    <div class="post-date">
        <b>Publish Date: </b><%= Model.Item.PublishDateTime.ToString( "dddd, dd MMMM yyyy" ) %> at <%= Model.Item.PublishDateTime.ToString( "h:mm tt" )%>. <%= (DateTime.Now.Subtract( Model.Item.PublishDateTime )).ToDateTimeDiff( Model.Item.PublishDateTime, true )%>
    </div>        
   
    
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentRight" runat="server">
      
    <div class="widget-green">

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

    <div class="widget-plain">
        <h3>Share</h3>
        <a href="http://www.facebook.com/sharer.php?u=<%= Request.Url.AbsoluteUri %>&t=<%= Html.PageTitle( ViewData.Model )%>" title="Share on Facebook" target="_blank"><img src="/assets/images/facebook-icon.png" width="25" height="25" alt="Share on Facebook" /></a> 
        <a id="twitter-share" title="Share on Twitter" target="_blank"><img src="/assets/images/twitter-icon.png" width="25" height="25" alt="Share on Twitter" /></a>
    </div>
    
   

     
</asp:Content>

