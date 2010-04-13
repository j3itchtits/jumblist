<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server">
	<%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    Number of items: <%= Model.ListCount %>


       
<%--    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        { 
            "Google", Ajax.GoogleMap()
            .CssClass("GoogleMap")
            .Center(50.853544, 0.56347)
            .Zoom(12)
            .AddPushpin(new Pushpin(50.853544, 0.56347), new Pushpin(50.83,0.57)) 
        }
    }); %>--%>
    

            
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
            
            <%--<p>test postcode: <%= Html.Encode( Model.User.Postcode ) %></p>--%>
		</div>
		
		<div id="tabs-2">

		    <% Html.RenderPartial( "MapDisplay", new ViewDataDictionary() {
                { 
                    "Google", 
                    Ajax.GoogleMap()
                    .CssClass("GoogleMap")
                    .Center(50.853544, 0.56347)
                    .Zoom(9)
                    .AddPushpin( Model.Pushpins )
                }
            }); %> 
            
<%--    <% Html.RenderPartial("MapDisplay", new ViewDataDictionary() {
        //{ "Bing", Ajax.BingMap().CssClass("BingMap").Center(50.853544, 0.56347).Zoom(12).AddPushpin(new Pushpin(50.853544, 0.56347)) },
        { "Google", Ajax.GoogleMap().CssClass("GoogleMap").Center(50.853544, 0.56347).Zoom(12).AddPushpin(new Pushpin(50.853544, 0.56347)) }
    }); %>--%>
                
		</div>
	</div>
	
        
    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "ui.tabs.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery-ui-1.7.2.custom.min.js" )%>" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function() {
            $('#tabs').tabs();
        });
    </script> 
            
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderAction("categorylist", "posts", new { routeValueDic = ViewContext.RouteData.Values, highlightedCategory = Model.PostCategory }); %>

</asp:Content>
