<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

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
		
            <div id="itemsList">
                <% Html.RenderPartial( "PostList", Model.PaginatedList ); %>
            </div>
          
            <p><%= Html.PagingLinks( Model.PaginatedList.CurrentPage, Model.PaginatedList.TotalPages, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%></p>
            
            <p><%= Html.NextPreviousPageLinks( Model.PaginatedList.CurrentPage, Model.PaginatedList.HasPreviousPage, Model.PaginatedList.HasNextPage, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%></p>

		</div>
		
		<div id="tabs-2">
		    <% Html.RenderPartial( "MapDisplay", new ViewDataDictionary() {
                { "Google", Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .DynamicMap( new { controller = "Posts", action = "Tagged", id = "Baby" })
                    }
            }); %>
		</div>
	</div>
	
        
    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

   <link href="<%= Url.Stylesheet( "ui.tabs.css" )%>" rel="stylesheet" type="text/css"/>
<%--     <link href="<%= Url.Stylesheet( "jquery-ui-1.7.2.custom.css" )%>" rel="stylesheet" type="text/css"/>--%>
    
<%--    <script src="<%= Url.Script( "jquery-ui-1.7.2.custom.min.js" )%>" type="text/javascript"></script>--%>
    <script src="<%= Url.Script( "ui.core.min.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "ui.tabs.min.js" )%>" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function() {
            $('#tabs').tabs();
        });
    </script> 
            
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderAction( "categorylist", "posts", new { highlightedCategory = ViewContext.RouteData.Values["id"].ToString() } ); %>

</asp:Content>
