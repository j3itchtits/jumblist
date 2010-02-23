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
            <td><label for="Item.PublishDateTime">Published:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.PublishDateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.PublishDateTime )%></td>
        </tr>
        <tr>
            <td><label for="Item.LastUpdatedDateTime">Last Updated:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.LastUpdatedDateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdatedDateTime )%></td>
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
            <td><%= Html.DropDownListFor( m => m.Item.FeedId, new SelectList( Model.LookupList<Feed>(), "FeedId", "Name", Model.Item.FeedId ), "-- Select --" )%>
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

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            $("input#locationName").autocomplete('<%= Url.Action("findlocationNames", "locations") %>',
                    {
                        minChars: 2
                    }
                );

            $("input#locationArea").autocomplete('<%= Url.Action("findlocationAreas", "locations") %>',
                    {
                        minChars: 2
                    }
                );

            $("input#tag").autocomplete('<%= Url.Action("findtags", "tags") %>',
                {
                    minChars: 2
                }
            );
            
        });
    </script> 
        
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

    <p>
        <b>Locations: </b>
    </p>
    
    <div id="post-locations">
        <% Html.RenderPartial("PostLocationList", Model.Item.PostLocations); %>
    </div>   

    <% using (Ajax.BeginForm("postlocationcreate", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "post-locations" }))
       { %>    
        <p>
            <%= Html.Hidden( "postId", Model.Item.PostId)%>
            <%= Html.TextBox("locationName", null, new { size = 10 })%>
            <%= Html.TextBox("locationArea", null, new { size = 10 })%>
            <%= Html.SubmitButton("postlocationcreatebutton", "Create")%>
        </p> 
    <% } %>
    
    <p>
        <b>Tags: </b>
    </p>
        
    <div id="post-tags">
        <% Html.RenderPartial("PostTagList", Model.Item.PostTags); %>
    </div>
    
    <% using (Ajax.BeginForm("posttagcreate", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "post-tags" }))
       { %>    
        <p>
            <%= Html.Hidden( "postId", Model.Item.PostId)%>
            <%= Html.TextBox("tag", null, new { size = 10 } )%>
            <%= Html.SubmitButton("posttagcreatebutton", "Create")%>
        </p> 
    <% } %>  
        
        
</asp:Content>

