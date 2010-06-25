<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PostViewModel>" %>

<% 
    using (Html.BeginForm( "search", "posts" ))
    { 
       
        //PostCategory
%>
        <b>Category</b><br />
        <%= Html.DropDownList( "postCategorySelection", new SelectList( Model.PostCategorySelectList, "Value", "Text", Model.PostCategory.Name ) )%><br /><br />

        <b>Tags</b><br />
        <%= Html.TextBox( "tagSearch", (Model.Tags.Select( x => x.Name ).ToFormattedStringList( "{0} " ) + Model.Q).Trim() )%><br /><br /> <%

        //User/Location
        if ((Model.User != null) && (ViewContext.RouteData.Values["action"].ToString() != "located") ) 
        { %>
            <b>Location</b><br />
            Within <%= Html.TextBox( "locationRadius", Html.LocationRadius( Model.UserLocation.Radius ) )%> miles of <%= Html.TextBox( "locationSearch", Html.LocationName( Model.UserLocation.Name ) )%><br /><br /> <% 
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

