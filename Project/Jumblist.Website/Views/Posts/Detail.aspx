<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <div class="post-detail">

        <div>
            <b>Category: </b><%= Model.Item.Category.Name %><br />
        </div>  
        
        <div>
            <b>Number of Views: </b><%= Model.Item.NumberofViews.ToString() %><br />
        </div>  
        
                
        <div style="padding: 20px 0px;">
            <%= Html.Encode( Model.Item.Body ).ReplaceParagraphBreaksWithHtmlBrTags()%>
        </div>
        
        <div>
            <b>Publish Date: </b><br />
            <%= Model.Item.PublishDateTime.ToString( "dddd, dd MMMM yyyy" ) %> at <%= Model.Item.PublishDateTime.ToString( "h:mm tt" )%>. <%= (DateTime.Now.Subtract( Model.Item.PublishDateTime )).ToDateTimeDiff( Model.Item.PublishDateTime, true )%>
        </div> 
        
        <div>
            <%= Ajax.SavePostToBasketLink( "Save", new { id = Model.Item.PostId } )%>
        </div>

        <div>
            <%= Ajax.EmailPostLink( "Email", new { id = Model.Item.PostId } )%>
        </div>

        <% if ( Model.Item.Url != null )
           { %>
                <div>
                    <b>View: </b><br />
                    <a href="<%= Model.Item.Url %>" target="_blank">Original Post on <%= Model.Item.Feed.Name %></a>      
                </div> <%
           } %>



            
             
    </div>
   
    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

<script type="text/javascript">

    $(document).ready(function() {

        getTinyURL('<%= Request.Url.AbsoluteUri %>', function(tinyurl) {
            // Do something with tinyurl:
            $('#twitter-share').attr('href', 'http://twitter.com/home?status=@jumblist: <%= Html.PageTitle( ViewData.Model )%> ' + tinyurl);
        });

    });
        
</script> 

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
        <%= Html.PostTagListLinks( Model.Item.Tags ) %>
    </div>
    
    <div class="post-locations">
        <b>Location: </b><br />
        <%= Html.PostLocationListLinks( Model.Item.Locations )%>

        <%  if ( Model.Item.HaveLatitudeAndLongitudeValuesBeenPopulated ) 
           { %>
                [ <a title="Approximate location of <%= Html.Encode( Model.Item.Title ) %>" href="#" onclick="mapPopup( <%= Model.Item.Latitude %>, <%= Model.Item.Longitude %>, '<%= Html.Encode( Model.Item.Title ) %>' );">Map</a> ]<% 
           } %>
            
    </div>

    <div class="post-socialmedia"> 
        <b>Share: </b><br />
        <a href="http://www.facebook.com/sharer.php?u=<%= Request.Url.AbsoluteUri %>&t=<%= Html.PageTitle( ViewData.Model )%>" title="Share on Facebook" target="_blank"><img src="/assets/images/facebook-icon.png" width="25" height="25" alt="Share on Facebook" /></a> 
        <a id="twitter-share" title="Share on Twitter" target="_blank"><img src="/assets/images/twittericon.png" width="25" height="25" alt="Share on Twitter" /></a>
    </div> 
    

    
</asp:Content>

