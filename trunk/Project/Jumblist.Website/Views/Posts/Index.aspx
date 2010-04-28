<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

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
                <% Html.RenderPartial( "PostListControl", Model.PaginatedList ); %>
            </div>
          
            <div class="paginglinks">
                <%= Html.PagingLinks( Model.PaginatedList.CurrentPage, Model.PaginatedList.TotalPages, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
            </div>
            
            <div class="nextpreviouspagelinks">
                <%= Html.NextPreviousPageLinks( Model.PaginatedList.CurrentPage, Model.PaginatedList.HasPreviousPage, Model.PaginatedList.HasNextPage, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
            </div>
            
		</div>
		
		<div id="tabs-2">

		    <% Html.RenderPartial( "MapDisplayControl", new ViewDataDictionary() {
                { 
                    "Google", 
                    Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .Center(50.853544, 0.56347)
                    .Zoom(9)
                    //.AddPushpin(new Pushpin(50.853544, 0.56347), new Pushpin(50.83,0.57))
                    .AddPushpin( Model.Pushpins )
                }
            }); %> 
                    
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
