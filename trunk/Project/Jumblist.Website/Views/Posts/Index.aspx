<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    Number of items: <%= Model.ListCount %>

	<div id="tabs">
		
		<ul>
			<li><a href="#tabs-1">Listing</a></li>
			<li><a href="#tabs-2">Map</a></li>
		</ul>
		
		<div id="tabs-1">
		
            <div class="postlist">
                <% Html.RenderPartial( "PostListControl", Model.PagedList ); %>
            </div>
          
            <div class="pagerlinks">
                <%= Html.Pager( Model.PagedList.PageSize, Model.PagedList.PageNumber, Model.PagedList.TotalItemCount )%>
            </div>
            
            <div class="pagesizer">
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=15" title="show 15 items per page" class="<%= ( Model.PagedList.PageSize == 15 ) ? "bold" : "" %>">15</a>
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=30" title="show 30 items per page" class="<%= ( Model.PagedList.PageSize == 30 ) ? "bold" : "" %>">30</a>                
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=50" title="show 50 items per page" class="<%= ( Model.PagedList.PageSize == 50 ) ? "bold" : "" %>">50</a>
                per page 
            </div> 
            
		</div>
		
		<div id="tabs-2">
    
            <% Html.RenderPartial( "GoogleMapControl", Model.Pushpins ); %>

            <br /><br />
            
            <div class="basicmaplist">
                <% Html.RenderPartial( "BasicMapListControl", Model.Pushpins ); %>
            </div>
                    
		</div>
	</div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "ui.tabs.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery-ui-1.7.2.custom.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
       
       $('#tabs').tabs();
       });
    </script>   
                 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% 
        //string actionName = ViewContext.RouteData.Values["action"].ToString();
        
        //if ( actionName == "located" )
        //    Html.RenderAction( "SelectCategory", "Posts", new { routeValueDic = ViewContext.RouteData.Values, highlightedCategory = Model.PostCategory } );
        //else
            Html.RenderPartial( "SearchControl", Model );
    %>
    
<%--    <%= Html.ActionLink<PostsController>( x => x.Rss( ViewContext.RouteData.Values["action"], ViewContext.RouteData.Values["id"], Model.PostCategory.Name, Model.Q, Model.User ), "RSS feed" ) %>
--%>    

    <%= Html.ActionLink( "RSS Feed", "Rss", new { rssActionName = ViewContext.RouteData.Values["action"], rssActionId = ViewContext.RouteData.Values["id"], rssActionCategory = ViewContext.RouteData.Values["category"], q = Model.Q } )%><br />
    <%= Html.ActionLink( "Email alert", "EmailAlert", new { returnUrl = Request.Url.PathAndQuery } )%><br />

<%--    <%= Html.ActionLink( "Email alert", "EmailAlert", new { postcategory = (Model.PostCategory == null) ? string.Empty : Model.PostCategory.Name, tags = (Model.Tags == null) ? string.Empty : Model.Tags.Select( x => x.Name ).ToFriendlyUrlEncode(), locations = (Model.Locations == null) ? string.Empty : Model.Locations.Select( x => x.Name ).ToFriendlyUrlEncode(), group = (Model.Group == null) ? string.Empty : Model.Group.Name, q = Model.Q, returnUrl = Request.Url.PathAndQuery } )%><br />
--%><%--    <%= Ajax.ActionLink( "Email ajax alert", "EmailAlert", new { postcategory = (Model.PostCategory == null) ? string.Empty : Model.PostCategory.Name, tags = (Model.Tags == null) ? string.Empty : Model.Tags.Select( x => x.Name ).ToFriendlyUrlEncode(), locations = (Model.Locations == null) ? string.Empty : Model.Locations.Select( x => x.Name ).ToFriendlyUrlEncode(), group = (Model.Group == null) ? string.Empty : Model.Group.Name, q = Model.Q, returnUrl = Request.Url.PathAndQuery }, new AjaxOptions { HttpMethod = "Post" } )%>
--%>    
</asp:Content>
