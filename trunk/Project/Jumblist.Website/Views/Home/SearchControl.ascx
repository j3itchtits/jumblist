<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<div class="homepagesearch">
<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>
            <p>
                <%= Html.TextBox( "tagSearch" ) %><br />
                Within <%= Model.Radius%> miles of <%= Model.Postcode %><br />
                <%= Html.Hidden( "locationRadius", Model.Radius )%>
                <%= Html.Hidden( "locationSearch", Model.Postcode )%>
                <%= Html.SubmitButton( "submit", "Search" ) %>
            </p> <%
        }
        else
        { 
            %><p>
                What <%= Html.TextBox( "tagSearch" ) %><br />
                Where <%= Html.TextBox( "locationSearch" ) %> <br />
                <%= Html.Hidden( "locationRadius", 5 ) %>
                <%= Html.SubmitButton( "submit", "Search" ) %>
            </p>
            
            <% 
        }
        
        
        
        %>
        
        <input type="radio" name="postCategorySearch" value="" checked="checked" /> All 
        <input type="radio" name="postCategorySearch" value="offered" /> Offered 
        <input type="radio" name="postCategorySearch" value="wanted" /> Wanted        
                
        <br /><br />Testing: <br />
        PageIsAuth: <%= Page.User.Identity.IsAuthenticated %><br />
        UserCookieIsAuth: <%= Model.IsAuthenticated %><br />
        UserCookieName: <%= Model.Name %><br />
        UserCookieLocation: <%= Model.Postcode %>, <%= Model.Radius %> - <%= Model.Latitude %> | <%= Model.Longitude %><br />
        UserSessionLocation: <%= Model.Session.LocationName %>, <%= Model.Session.LocationRadius%> - <%= Model.Session.LocationLatitude%> | <%= Model.Session.LocationLongitude%><br />
        UserSessionPageSize: <%= Model.Session.PageSize%><br />
        
        <%
    }
 
%>

</div>