<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>

            <%= Html.Hidden( "locationSearch", Model.Postcode )%>

            <table class="home-searchcriteria-tag">
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
       
            <%= Html.Hidden( "locationRadius", 5 ) %>

            <table class="home-searchcriteria-taglocation">
            <tr>
                <td>
                    <label for="tagSearch" class="hide">Tagged</label>
                    <%= Html.TextBox( "tagSearch", "Tagged", new { tabindex = "1", @class = "fadedtext", title = "Tagged" } )%>
                </td>
                <td>
                    <%= Html.SubmitButton( "submit", "Search", new { tabindex = "3" } )%>
                </td>                    
            </tr>
            <tr>
                <td>
                    <label for="locationSearch" class="hide">Location</label>
                    <%= Html.TextBox( "locationSearch", "Location", new { tabindex = "2", @class = "fadedtext", title = "Location" } )%>
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
            <label for="categoryAll">All</label>
            <input id="categoryOffered" type="radio" name="postCategorySelection" value="offered" />
            <label for="categoryOffered">Offered</label>
            <input id="categoryWanted" type="radio" name="postCategorySelection" value="wanted" />
            <label for="categoryWanted">Wanted</label>   
        </fieldset>
        
        <%
    }
 
%>


