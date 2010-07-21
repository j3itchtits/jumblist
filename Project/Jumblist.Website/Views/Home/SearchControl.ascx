<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>
            <%= Html.Hidden( "locationRadius", Model.Radius )%>
            <%= Html.Hidden( "locationSearch", Model.Postcode )%>

                    <div style="padding: 10px 100px"><%= Html.TextBox( "tagSearch", string.Empty, new { title = "Please enter your search term", @class = "input-left" } )%><%= Html.SubmitButton( "submit", "Search", new { @class = "button-right" } )%></div>
                    <div style="padding: 10px 100px">Within <%= Model.Radius%> miles of <%= Model.Postcode %></div>
            <%
        }
        else
        { 
            %>
            <%= Html.Hidden( "locationRadius", 5 ) %>
            <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td width="100">
                    <label for="tagSearch">What?</label>
                </td>
                <td width="100">
<%--                    <%= Html.TextBox( "tagSearch" ) %>
                    <%= Html.SubmitButton( "submit", "Search" ) %>--%>
                    <input id="tagSearch" name="tagSearch" type="text" value="" />
                </td>
                <td>
                                    <input style="display:inline" id="submit" name="submit" type="submit" value="Search" />

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
        
        <div style="padding: 10px 100px">
            <input type="radio" name="postCategorySelection" value="" checked="checked" /> All 
            <input type="radio" name="postCategorySelection" value="offered" /> Offered 
            <input type="radio" name="postCategorySelection" value="wanted" /> Wanted        
        </div>
        
        <%
    }
 
%>

