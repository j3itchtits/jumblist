<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>
            <%= Html.Hidden( "locationRadius", Model.Radius )%>
            <%= Html.Hidden( "locationSearch", Model.Postcode )%>


                <table class="home-searchcriteria-tag" title="Search for Posts">
                <tr>
                <td style="width: 80px;">
	                <label for="tagSearch" style="display:none;">Search</label><%= Html.TextBox( "tagSearch", string.Empty, new { title = "Please enter your search term", @class = "input-left" } )%>
                </td>
                <td>
	                <%= Html.SubmitButton( "submit", "Search", new { @class = "button-right" } )%>
                </td>
                </tr>
                </table>

                <div class="home-searchlocation">
                    Within <%= Model.Radius%> miles of <%= Model.Postcode %>
                </div>

            <%
        }
        else
        { 
            %>
            <%= Html.Hidden( "locationRadius", 5 ) %>

            <table title="Search for Posts">
            <tr>
            <td>

                <table class="home-searchcriteria-taglocation" title="Search for Posts by Tag and Location">
                <tr>
                    <td>
                        <label for="tagSearch">What?</label>
                    </td>
                    <td>
                        <%= Html.TextBox( "tagSearch", string.Empty, new { tabindex = "1" } )%>

                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="locationSearch">Where?</label>
                    </td>
                    <td>
                        <%= Html.TextBox( "locationSearch", string.Empty, new { tabindex = "2" } )%>
                    </td>
                </tr>
                </table>
                        
            </td>
            <td style="padding-top: 85px">
                <%= Html.SubmitButton( "submit", "Search", new { tabindex = "3" } )%>
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


