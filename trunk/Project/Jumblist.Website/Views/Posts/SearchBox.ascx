<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PostViewModel<Post>>" %>

<% 
    using (Html.BeginForm( "search", "posts" ))
    { 
       
        //PostCategory
        if ( Model.PostCategory != null )
        { %>
            <b>Category</b><br />
            <%= Html.DropDownList( "postCategorySearch", new SelectList( Model.PostCategoryList, "Value", "Text", Model.PostCategory.Name ) )%><br /><br /> <%
        }

        //Tags
        if (Model.Tags != null ) 
        { %>
            <b>Tags</b><br />
            <%= Html.TextBox("tagSearch", Model.Tags.Select(x => x.Name).ToFormattedStringList("{0}, ", 2))%><br /><br /> <%
        }

        //User/Location
        if (Model.User != null ) 
        {  
            //string radius = (Model.Search.LocationRadius == 0) ? string.Empty : Model.Search.LocationRadius.ToString();
            string location = ( ( Model.User.Search.LocationName ).Split( new string[] { ", " }, StringSplitOptions.None ) )[0];
            //if (string.IsNullOrEmpty(radius)) Response.Write(Html.Hidden("locationRadius", 0)); %>
            Within <%= Html.TextBox( "locationRadius", Model.User.Search.LocationRadius )%> miles of <%= Html.TextBox( "locationSearch", location ) %><br /><br /> <% 
        }
        else
        { %>
            <%= Html.Hidden("locationRadius", 0)%><%= Html.Hidden("locationSearch", string.Empty)%><br /><br /> <%
        }
        
        //Group
        if (Model.Group != null ) 
        { %>
            <%= Html.Hidden("groupSearch", Model.Group.FriendlyUrl)%>  <%
        }
        
        %>
        
        <%= Html.SubmitButton( "submit", "Search" ) %> <%
        
        if (Model.User != null ) 
        {  %>
            <br /><br />Testing: <br />
            PageIsAuth: <%= Page.User.Identity.IsAuthenticated %><br />
            UserIsAuth: <%= Model.User.IsAuthenticated %><br />
            UserName: <%= Model.User.Name%><br />
            UserLocation: <%= Model.User.Postcode%>, <%= Model.User.Radius%> - <%= Model.User.Latitude%> | <%= Model.User.Longitude%><br />
            UserSearch: <%= Model.User.Search.LocationName%>, <%= Model.User.Search.LocationRadius%> - <%= Model.User.Search.LocationLatitude%> | <%= Model.User.Search.LocationLongitude%><br /><%
        }
    }
%>    

