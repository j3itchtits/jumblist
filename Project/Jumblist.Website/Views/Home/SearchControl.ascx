<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>

            <%= Html.Hidden( "locationSearch", Model.Postcode )%>

            <table class="home-searchcriteria-tag" title="Search for Posts">
            <tr>
            <td style="width: 80px;">
                <label for="tagSearch" class="hide">Search</label><%= Html.TextBox( "tagSearch", string.Empty, new { title = "Please enter your search term", @class = "input-left" } )%>
            </td>
            <td>
                <%= Html.SubmitButton( "submit", "Search", new { @class = "button-right" } )%>
            </td>
            </tr>
            </table>

            <div class="home-searchlocation">
                Within 
                <span id="span-value"><%= Model.Radius%></span><input id="locationRadius" name="locationRadius" value="<%= Model.Radius%>" class="hide" style="width:1.5em;" /> <a href="#" id="radius-edit" style="font-size:0.75em;">[Edit]</a> miles of 
                <%= Model.Postcode %>
            </div>
            

            <%
        }
        else
        { 
            %>
            
            <div id="pane-welcomemessage">
                Welcome to Jumblist, an open service allowing you to perform location-based searches of UK Freecycle and Freegle groups. If you <%= Html.RegisterLink( "register" ) %>, you can also setup email alerts to let you know when new posts matching your search have been posted.
                <%= Html.ActionLink( "More details...", "about" ) %>
                <a href="#" class="hidetext">Hide</a>
            </div>           
        
            <%= Html.Hidden( "locationRadius", 5 ) %>

            <table class="home-searchcriteria-taglocation" title="Search for Posts by Tag and Location">
            <tr>
                <td>
                    <label for="tagSearch">Tagged</label>
                </td>
                <td>
                    <%= Html.TextBox( "tagSearch", string.Empty, new { tabindex = "1" } )%>
                </td>
                <td>
                    <%= Html.SubmitButton( "submit", "Search", new { tabindex = "3" } )%>
                </td>                    
            </tr>
            <tr>
                <td>
                    <label for="locationSearch">Location</label>
                </td>
                <td>
                    <%= Html.TextBox( "locationSearch", string.Empty, new { tabindex = "2" } )%>
                </td>
                <td>
                </td>                    
            </tr>
            </table>
                        

 
            <% 
        }
        
        %>
        
        <fieldset class="home-searchcategory">
            <legend>Please select a post category to filter your search by</legend>
            <input id="categoryAll" type="radio" name="postCategorySelection" value="" checked="checked" />
            <label for="categoryAll">All</label>  &nbsp;
            <input id="categoryOffered" type="radio" name="postCategorySelection" value="offered" />
            <label for="categoryOffered">Offered</label>  &nbsp;
            <input id="categoryWanted" type="radio" name="postCategorySelection" value="wanted" />
            <label for="categoryWanted">Wanted</label>  &nbsp;   
        </fieldset>
        
        <%
    }
 
%>


