<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PostViewModel>" %>

<% 
    
    using (Html.BeginForm( "search", "posts" ))
    { 
       
        //PostCategory
%>

        <h3>Category</h3>
        <label for="postCategorySelection" style="display:none;">Select Post Category</label>
        <%= Html.DropDownList( "postCategorySelection", new SelectList( Model.SelectList<PostCategory>(), "SelectListValue", "Name", Model.PostCategory.Name ) )%><br /><br />

<%--<%= Html.DropDownList( "postCategorySelection", Model.BuildSelectList( new[] { "hello", "arse" }, "arse" ) )%><br /><br />
<%= Html.DropDownList( "postCategorySelection", Model.BuildSelectList( new[] { new[] { "0", "yes" }, new[] { "1", "no" } }, "1" ) )%><br /><br />
--%>
        <h3>Tags</h3>
        <label for="tagSearch" style="display:none;">Enter Tags</label>
        <%= Html.TextBox( "tagSearch", ( Model.Tags.Select( x => x.Name ).ToFormattedStringList( "{0} " ) + Model.Q ).Trim() )%><br /><br /> <%

        //User/Location
        if ((Model.User != null) && (ViewContext.RouteData.Values["action"].ToString() != "located") ) 
        { %>
            <h3>Location</h3>
            Within <label for="locationRadius" style="display:none;">Enter seach radius in miles</label><%= Html.TextBox( "locationRadius", Html.LocationRadius( Model.UserSearchArea.Radius ) )%> miles of 
            <label for="locationSearch" style="display:none;">Enter seach location</label><%= Html.TextBox( "locationSearch", Html.LocationName( Model.UserSearchArea.LocationName ) )%><br /><br /> <% 
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
        
        
     }
%>    

