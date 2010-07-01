<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%
    using (Html.BeginForm("search", "posts"))
    {
        if (Model.IsAuthenticated)
        { %>
            <%= Html.Hidden( "locationRadius", Model.Radius )%>
            <%= Html.Hidden( "locationSearch", Model.Postcode )%>
            <table>
            <tr>
                <td>
                    <div><%= Html.TextBox( "tagSearch" ) %></div>
                    <div>Within <%= Model.Radius%> miles of <%= Model.Postcode %></div>
                 </td>
                <td>
                    <%= Html.SubmitButton( "submit", "Search" ) %>
                </td>
            </tr>
            </table> <%
        }
        else
        { 
            %>
            <%= Html.Hidden( "locationRadius", 5 ) %>
            <table>
            <tr>
                <td>
                    <label for="tagSearch">What?</label>
                </td>
                <td>
                    <%= Html.TextBox( "tagSearch" ) %></td><td> <%= Html.SubmitButton( "submit", "Search" ) %>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="locationSearch">Where?</label>
                </td>
                <td>
                    <%= Html.TextBox( "locationSearch" ) %>
                </td>
            </tr>
            </table>
            <% 
        }
        
        %>
        
        <input type="radio" name="postCategorySelection" value="" checked="checked" /> All 
        <input type="radio" name="postCategorySelection" value="offered" /> Offered 
        <input type="radio" name="postCategorySelection" value="wanted" /> Wanted        
        
        <%
    }
 
%>

