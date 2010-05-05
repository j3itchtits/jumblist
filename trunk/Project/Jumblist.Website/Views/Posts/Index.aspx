<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel<Post>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    Number of items: <%= Model.ListCount %>

	<div id="tabs">
		
		<ul>
			<li><a href="#tabs-1">Listing</a></li>
			<li><a href="#tabs-2">Map</a></li>
		</ul>
		
		<div id="tabs-1">
		
            <div class="postlist">
                <% Html.RenderPartial( "PostListControl", Model.PagedList ); %>
            </div><br /><br />
          
<%--           <div class="paginglinks">
                <%= Html.PagingLinks( Model.PagedList.PageNumber, Model.PagedList.PageCount, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
            </div><br /><br />
    
            <div class="nextpreviouspagelinks">
                <%= Html.NextPreviousPageLinks( Model.PagedList.PageNumber, Model.PagedList.HasPreviousPage, Model.PagedList.HasNextPage, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
            </div><br /><br />--%>
            
            <div class="pagerlinks">
                <%= Html.Pager( Model.PagedList.PageSize, Model.PagedList.PageNumber, Model.PagedList.TotalItemCount )%>
            </div><br /><br />
            
            <div class="page-sizer">
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=15" title="show 15 items per page" class="<%= ( Model.PagedList.PageSize == 15 ) ? "bold" : "" %>">15</a>
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=30" title="show 30 items per page" class="<%= ( Model.PagedList.PageSize == 30 ) ? "bold" : "" %>">30</a>                
                <a href="<%= Url.RouteUrl( ViewContext.RouteData.Values )%>?pagesize=50" title="show 50 items per page" class="<%= ( Model.PagedList.PageSize == 50 ) ? "bold" : "" %>">50</a>
                per page 
            </div> <br /><br />
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
        string actionName = ViewContext.RouteData.Values["action"].ToString();
        
        if ( actionName == "located" )
            Html.RenderAction( "SelectCategory", "Posts", new { routeValueDic = ViewContext.RouteData.Values, highlightedCategory = Model.PostCategory } );
        else
            Html.RenderPartial( "SearchControl", Model );
    %>
    
</asp:Content>
