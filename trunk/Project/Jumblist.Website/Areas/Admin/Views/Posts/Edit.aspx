<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<Post>( "Item" )%>

        <% using ( Html.BeginForm( "save", "posts" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.PostId )%>
        <%= Html.HiddenFor( m => m.Item.ParentId )%>
        <%= Html.HiddenFor( m => m.Item.Guid )%>
        
        <table>
        <tr>
            <td><label for="Item.Url">Url:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Url, new { @size = "100" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Url )%></td>
        </tr>
        <tr>
            <td><label for="Item.Title">Title:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Title, new { @size = "100" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Title )%></td>
        </tr>
        <tr>
            <td><label for="Item.Body">Body:</label></td>
            <td><%= Html.TextAreaFor( m => m.Item.Body, new { @rows = "10", @cols = "100" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Body )%></td>
        </tr>
        <tr>
            <td><label for="Item.DateTime">DateTime:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.DateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.DateTime )%></td>
        </tr>
        <tr>
            <td><label for="Item.Latitude">Latitude:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Latitude )%>
            <%= Html.ValidationMessageFor( m => m.Item.Latitude )%></td>
        </tr>
        <tr>
            <td><label for="Item.Longitude">Longitude:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Longitude )%>
            <%= Html.ValidationMessageFor( m => m.Item.Longitude )%></td>
        </tr>
        <tr>
            <td><label for="Item.Display">Display:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.Display )%>
            <%= Html.ValidationMessageFor( m => m.Item.Display )%></td>
        </tr>
        <tr>
            <td><label for="Item.PostCategoryId">Post Category:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.PostCategoryId, new SelectList( Model.LookupList<PostCategory>(), "PostCategoryId", "Name", Model.Item.PostCategoryId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.PostCategoryId )%></td>
        </tr>   
        <tr>
            <td><label for="Item.UserId">User:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.UserId, new SelectList( Model.LookupList<User>(), "UserId", "Name", Model.Item.UserId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.UserId )%></td>
        </tr> 
        <tr>
            <td><label for="Item.FeedId">Feed:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.FeedId, new SelectList( Model.LookupList<Feed>(), "FeedId", "Title", Model.Item.FeedId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.FeedId )%></td>
        </tr> 
        
        </table>


                     
        <p>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "list") %>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

    <div class="post-locations">
        <table>
        <tr><td colspan="2"><b>Locations: </b></td></tr>
        <%  foreach ( var postLocation in Model.Item.PostLocations )
            { %>
                <tr>
                <td><%= postLocation.Location.Name %></td>  
                <td><%= Html.ActionLink( "Delete", "locationdelete", new { id = postLocation.Id } )%></td> 
                </tr>
        <%  } %>
        <tr><td colspan="2"><%= Html.ActionLink( "Create", "locationcreate" )%></td></tr>   
        </table>
    </div>
    
    <br /><br />
    <div class="post-tags">
        <table>
        <tr><td colspan="2"><b>Tags: </b></td></tr>
        <%  foreach ( var postTag in Model.Item.PostTags )
            { %>
                <tr>
                <td><%= postTag.Tag.Name%></td>  
                <td><%= Html.ActionLink( "Delete", "tagdelete", new { id = postTag.Id } )%></td> 
                </tr>
        <%  } %>
        <tr><td colspan="2"><%= Html.ActionLink( "Create", "tagcreate" )%></td></tr>   
        </table>
    </div>
        
</asp:Content>

