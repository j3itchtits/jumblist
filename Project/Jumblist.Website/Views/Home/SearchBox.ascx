<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DefaultViewModel<User>>" %>

<%

    using (Html.BeginForm("search", "posts"))
    {
        if (Model.Item.IsAuthenticated)
        {
            %><p>
                <%= Html.TextBox( "tagSearch" ) %><br />
                Within <%= Model.Item.SearchRadiusMiles %> miles of <%= Model.Item.Postcode %><br />
                <%= Html.Hidden( "locationRadius", Model.Item.SearchRadiusMiles )%>
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
        
        %><input type="radio" name="postCategorySearch" value="" checked="checked" /> All 
        <input type="radio" name="postCategorySearch" value="offered" /> Offered 
        <input type="radio" name="postCategorySearch" value="wanted" /> Wanted        <%
    }
 
%>