<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DefaultViewModel<User>>" %>

<div class="homepagesearch">
<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.Item.IsAuthenticated)
        { %>
            <p>
                <%= Html.TextBox( "tagSearch" ) %><br />
                Within <%= Model.Item.Radius%> miles of <%= Model.Item.Postcode %><br />
                <%= Html.Hidden( "locationRadius", Model.Item.Radius )%>
                <%= Html.Hidden( "locationSearch", Model.Item.Postcode )%>
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
        UserIsAuth: <%= Model.Item.IsAuthenticated %><br />
        UserName: <%= Model.Item.Name %><br />
        UserLocation: <%= Model.Item.Postcode %>, <%= Model.Item.Radius %> - <%= Model.Item.Latitude %> | <%= Model.Item.Longitude %><br />
        UserSearch: <%= Model.Item.Search.LocationName %>, <%= Model.Item.Search.LocationRadius %> - <%= Model.Item.Search.LocationLatitude %> | <%= Model.Item.Search.LocationLongitude %><br />
        
        <%
    }
 
%>

</div>