<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>
            <%= Html.Hidden( "locationRadius", Model.Radius )%>
            <%= Html.Hidden( "locationSearch", Model.Postcode )%>


                <table border="0" cellpadding="0" cellspacing="0" style="margin: 80px auto 0px;width:40%;">
                <tr>
                <td width="80" style="padding:0px">
	                <%= Html.TextBox( "tagSearch", string.Empty, new { title = "Please enter your search term", @class = "input-left" } )%>
                </td>
                <td style="padding:0px">
	                <%= Html.SubmitButton( "submit", "Search", new { @class = "button-right" } )%>
                </td>
                </tr>
                </table>

                <div style="width: 100%; text-align: center; margin-top: 20px;">
                    Within <%= Model.Radius%> miles of <%= Model.Postcode %>
                </div>

            <%
        }
        else
        { 
            %>
            <%= Html.Hidden( "locationRadius", 5 ) %>
            <table border="0" cellpadding="0" cellspacing="0" style="margin: 80px auto 0px;width:40%;">
            <tr>
                <td>
                    <label for="tagSearch">What?</label>
                </td>
                <td>
<%--                    <%= Html.TextBox( "tagSearch" ) %>
                    <%= Html.SubmitButton( "submit", "Search" ) %>--%>
                    <input id="tagSearch" name="tagSearch" type="text" value="" />
                </td>
                <td>
                    <input id="submit" name="submit" type="submit" value="Search" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="locationSearch">Where?</label>
                </td>
                <td>
                    <%= Html.TextBox( "locationSearch" ) %>
                </td>
                <td>
                </td>
            </tr>
            </table>
            <% 
        }
        
        %>
        
        <div style="width: 100%; text-align: center; margin-top: 20px;">
            <input type="radio" name="postCategorySelection" value="" checked="checked" /> All &nbsp;
            <input type="radio" name="postCategorySelection" value="offered" /> Offered &nbsp;
            <input type="radio" name="postCategorySelection" value="wanted" /> Wanted   &nbsp;     
        </div>
        
        <%
    }
 
%>


