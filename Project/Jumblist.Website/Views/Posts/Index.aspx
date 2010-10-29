<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <%= Html.JQueryUIProjectRefs()%>
    <%= Html.AutocompleteProjectRefs()%>
    <%= Html.ColorboxProjectRefs()%>

<%--    <script src="http://maps.google.com/maps?file=api&v=2&key=devapikey&sensor=false" type="text/javascript"></script> 
--%>    <script src="<%= Url.Script( "jquery.gmap-v2-alt.js" )%>" type="text/javascript"></script> 
    
<%--    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.gmap.js" )%>" type="text/javascript"></script>    --%> 
         
    <script src="<%= Url.Script( "jquery.highlight-3.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.cookie.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.sendemailpopup.js" )%>" type="text/javascript"></script>
    
    <script type="text/javascript">

        $(document).ready(function() {


            $('div#tabs').tabs();
            $("input#tagSearch").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 1, multiple: true, multipleSeparator: " " });
            $('a.post-link').highlight('<%= Model.Tags.Select( x => x.Name ).ToFormattedStringList( "{0}+", 1 ) %>');
            $('a.post-link').highlight('<%= Model.Q %>');

            $('td.post-title ').click(function() {
                var href = $(this).find("a.post-link").attr("href");
                if (href) {
                    window.location = href;
                }
            });

            $("#pane-welcomemessage .hidetext").click(function() {
                $(this).parent()
                    .animate({ backgroundColor: "#eee" }, "fast")
                    .animate({ opacity: "hide" }, "slow");
                $.cookie('hide-alertsmessage', '1', { expires: 365 });
                return false;
            });

            //$('.emailPostLink').sendemailpopup();
            $('.emailPostLink').sendemailpopup({ textfield_defaulttext: '<%= Model.User.Email %>' });


            if ($.cookie('hide-alertsmessage') == '1') {
                $("#pane-welcomemessage").hide();
            }
            


        });
        
    </script>   
                 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">
<%--<% UserSearchArea usa = ( (JumblistSession)HttpContext.Current.Session["_jumblist"] ).UserSearchArea; %>
--%>

    <h2 class="postlist-title"><%= Html.PageTitle( ViewData.Model )%></h2>

    <div id="postlist-header-icons">
        <span class="icons-title">
            <%= Html.ActionLink( "Alerts", "EmailAlert", new { returnUrl = Request.Url.PathAndQuery }, new { title = "Setup an email alert for this list" } )%>
        </span>
        <span class="icons">
            <%= Html.ImageLink( "/assets/images/email-alert-icon.png", "Email Alert", "EmailAlert", "Posts", new { returnUrl = Request.Url.PathAndQuery }, new { title = "Setup an email alert for this list" }, null ) %>
            <%= Html.ImageLink( "/assets/images/rss-feed-icon.png", "RSS Feed", "Rss", "Posts", new { rssActionName = ViewContext.RouteData.Values["action"], rssActionId = ViewContext.RouteData.Values["id"], rssActionCategory = ViewContext.RouteData.Values["category"], q = Model.Q }, new { title = "View RSS Feed" }, null )%>
        </span>
    </div>


        
<%--        <div style="margin: 20px;">
            User: <%= Model.User.Postcode %>, <%= Model.User.Radius %>, <%= Model.User.Latitude %>, <%= Model.User.Longitude %><br />
            UserSearchArea: <%= Model.UserSearchArea.LocationName %>, <%= Model.UserSearchArea.Radius %>, <%= Model.UserSearchArea.Latitude %>, <%= Model.UserSearchArea.Longitude %><br />
            Session: <%= usa.LocationName%>, <%= usa.Radius%>, <%= usa.Latitude%>, <%= usa.Longitude%><br />
        </div>--%>
            
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <div>
        <b>Number of items: <%= Model.ListCount %></b>
    </div>

<%  if ( !Model.User.IsAuthenticated )
    { %>
        <div id="pane-welcomemessage">
            You can set-up email alerts for any list generated by a search. However you will need to <%= Html.RegisterLink( "register first" ) %>.
            <a href="#" class="hidetext">Hide</a>
        </div>   
<%  } %>

	<div id="tabs">
		
		<ul class="tabNavigation">
			<li><a href="#tabbedpostlist">Listing</a></li>
			<li><a href="#tabbedmaplist">Map</a></li>
		</ul>

		<div id="tabbedpostlist">
    
            <% Html.RenderPartial( "PostListControl", Model.PagedList ); %>
          
            <div class="pagerlinks">
                <%= Html.Pager( Model.PagedList.PageSize, Model.PagedList.PageNumber, Model.PagedList.TotalItemCount )%>
            </div>
            
            <div class="pagesizer">
                <%= Html.PageSize( Model.PagedList.PageSize )%>
            </div> 
            
		</div>
				
		<div id="tabbedmaplist">
		
            <% Html.RenderPartial( "GoogleMapControl", Model.Pushpins ); %>
            <% Html.RenderPartial( "BasicMapListControl", Model.Pushpins ); %>

		</div>
		

	</div>

	<!-- This contains the hidden content for inline map calls --> 
	<% Html.RenderPartial( "GoogleMapPopupControl" ); %>
	
	<!-- This contains the hidden content for inline send email calls --> 	
	<% Html.RenderPartial( "SendEmailControl" ); %>
	
	
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <div class="widget widget-green">

    <% 
        //string actionName = ViewContext.RouteData.Values["action"].ToString();
        
        //if ( actionName == "located" )
        //    Html.RenderAction( "SelectCategory", "Posts", new { routeValueDic = ViewContext.RouteData.Values, highlightedCategory = Model.PostCategory } );
        //else
            Html.RenderPartial( "SearchControl", Model );
    %>
    
<%--    <%= Html.ActionLink<PostsController>( x => x.Rss( ViewContext.RouteData.Values["action"], ViewContext.RouteData.Values["id"], Model.PostCategory.Name, Model.Q, Model.User ), "RSS feed" ) %>
--%>    


<%--    <%= Html.ActionLink( "Email alert", "EmailAlert", new { postcategory = (Model.PostCategory == null) ? string.Empty : Model.PostCategory.Name, tags = (Model.Tags == null) ? string.Empty : Model.Tags.Select( x => x.Name ).ToFriendlyUrlEncode(), locations = (Model.Locations == null) ? string.Empty : Model.Locations.Select( x => x.Name ).ToFriendlyUrlEncode(), group = (Model.Group == null) ? string.Empty : Model.Group.Name, q = Model.Q, returnUrl = Request.Url.PathAndQuery } )%><br />
--%><%--    <%= Ajax.ActionLink( "Email ajax alert", "EmailAlert", new { postcategory = (Model.PostCategory == null) ? string.Empty : Model.PostCategory.Name, tags = (Model.Tags == null) ? string.Empty : Model.Tags.Select( x => x.Name ).ToFriendlyUrlEncode(), locations = (Model.Locations == null) ? string.Empty : Model.Locations.Select( x => x.Name ).ToFriendlyUrlEncode(), group = (Model.Group == null) ? string.Empty : Model.Group.Name, q = Model.Q, returnUrl = Request.Url.PathAndQuery }, new AjaxOptions { HttpMethod = "Post" } )%>
--%>    

    </div>

    
</asp:Content>
