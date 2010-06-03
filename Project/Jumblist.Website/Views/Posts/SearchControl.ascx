﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PostViewModel<Post>>" %>

<% 
    using (Html.BeginForm( "search", "posts" ))
    { 
       
        //PostCategory
%>
        <b>Category</b><br />
        <%= Html.DropDownList( "postCategorySelection", new SelectList( Model.PostCategoryList, "Value", "Text", Model.PostCategory.Name ) )%><br /><br />

        <b>Tags</b><br />
        <%= Html.TextBox( "tagSearch", (Model.Tags.Select( x => x.Name ).ToFormattedStringList( "{0} " ) + Model.Q).Trim() )%><br /><br /> <%

        //User/Location
        if ((Model.User != null) && (ViewContext.RouteData.Values["action"].ToString() != "located") ) 
        { %>
            <b>Location</b><br />
            Within <%= Html.TextBox( "locationRadius", Html.LocationRadius( Model.User.Session.LocationRadius ) )%> miles of <%= Html.TextBox( "locationSearch", Html.LocationName( Model.User.Session.LocationName ) )%><br /><br /> <% 
        }
        
        //Group
        if ( Model.Group != null ) 
        { %>
            <%= Html.Hidden("groupHidden", Model.Group.FriendlyUrl)%>  <%
        }
       
        //Location
        if ( Model.Locations != null ) 
        { %>
            <%= Html.Hidden( "locationHidden", Model.Locations.Select( x => x.FriendlyUrl ).ToFormattedStringList( "{0}+", 1 ) )%>  <%
        }
         
        %>
        
        <%= Html.SubmitButton( "submit", "Search" ) %> <%
        
        if (Model.User != null ) 
        {  %>
            <br /><br />Testing: <br />
            PageIsAuth: <%= Page.User.Identity.IsAuthenticated %><br />
            UserCookieIsAuth: <%= Model.User.IsAuthenticated %><br />
            UserCookieName: <%= Model.User.Name%><br />
            UserCookieLocation: <%= Model.User.Postcode%>, <%= Model.User.Radius%> - <%= Model.User.Latitude%> | <%= Model.User.Longitude%><br />
            UserSessionLocation: <%= Model.User.Session.LocationName%>, <%= Model.User.Session.LocationRadius%> - <%= Model.User.Session.LocationLatitude%> | <%= Model.User.Session.LocationLongitude%><br />
            UserSessionPageSize: <%= Model.User.Session.PageSize%><br /><%
        }
    }
%>    
