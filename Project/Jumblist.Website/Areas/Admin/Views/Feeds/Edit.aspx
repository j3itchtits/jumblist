<%@ Page Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<Feed>( "Item" )%>

        <% using ( Html.BeginForm( "save", "feeds" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.FeedId )%>
        
        <table>
        <tr>
            <td><label for="Item_Name">Name:</label></td>
            <td><%= Html.TextBoxFor(m => m.Item.Name)%>
            <%= Html.ValidationMessageFor(m => m.Item.Name)%></td>
        </tr>
        <tr>
            <td><label for="Item_Url">Url:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Url )%>
            <%= Html.ValidationMessageFor( m => m.Item.Url )%></td>
        </tr>
        <tr>
            <td><label for="Item_Username">Username:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Username )%>
            <%= Html.ValidationMessageFor( m => m.Item.Username )%></td>
        </tr>
        <tr>
            <td><label for="Item_Password">Password:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Password )%>
            <%= Html.ValidationMessageFor( m => m.Item.Password )%></td>
        </tr>
        <tr>
            <td><label for="Item_CheckIntervalTicks">CheckIntervalTicks:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.CheckIntervalTicks )%>
            <%= Html.ValidationMessageFor( m => m.Item.CheckIntervalTicks )%></td>
        </tr>
        
        <tr>
            <td><label for="Item_LastUpdateHttpStatus">LastUpdateHttpStatus:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.LastUpdateHttpStatus, new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateHttpStatus )%></td>
        </tr>
        <tr>
            <td><label for="Item_LastUpdateDateTime">LastUpdateDateTime:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.LastUpdateDateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateDateTime )%></td>
        </tr>
        <tr>
            <td><label for="Item_FeedCategoryId">Feed Category:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.FeedCategoryId, new SelectList( Model.SelectList<FeedCategory>(), "FeedCategoryId", "Name", Model.Item.FeedCategoryId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.FeedCategoryId )%></td>
        </tr>   
        <tr>
            <td><label for="Item_IsActive">Is Active ?:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsActive )%>
            <%= Html.ValidationMessageFor( m => m.Item.IsActive )%></td>
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

    <link href="<%= Url.ImportedAsset( "Autocomplete", "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.ImportedAsset( "Autocomplete", "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            $("input#locationName").autocomplete('<%= Url.Action("ajaxfindlocationNames", "locations") %>',
                {
                    minChars: 2
                }
            );

            $("input#locationArea").autocomplete('<%= Url.Action("ajaxfindlocationAreas", "locations") %>',
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
    
    <div id="feed-locations">
        <% Html.RenderPartial("FeedLocationList", Model.Item.FeedLocations); %>
    </div>   

    <% using (Ajax.BeginForm("feedlocationcreate", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "feed-locations" }))
       { %>    
        <p>
            <%= Html.Hidden( "feedId", Model.Item.FeedId)%>
            <%= Html.TextBox("locationName", null, new { size = 10 })%>
            <%= Html.TextBox("locationArea", null, new { size = 10 })%>
            <%= Html.SubmitButton("feedlocationcreatebutton", "Create")%>
        </p> 
    <% } %>

</asp:Content>

