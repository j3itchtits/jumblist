<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<Feed>( "Item" )%>

        <% using ( Html.BeginForm( "save", "feeds" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.FeedId )%>
        
        <table>
        <tr>
            <td><label for="Item.Title">Title:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Title ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Title )%></td>
        </tr>
        <tr>
            <td><label for="Item.Url">Url:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Url )%>
            <%= Html.ValidationMessageFor( m => m.Item.Url )%></td>
        </tr>
        <tr>
            <td><label for="Item.Username">Username:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Username )%>
            <%= Html.ValidationMessageFor( m => m.Item.Username )%></td>
        </tr>
        <tr>
            <td><label for="Item.Password">Password:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Password )%>
            <%= Html.ValidationMessageFor( m => m.Item.Password )%></td>
        </tr>
        <tr>
            <td><label for="Item.CheckIntervalTicks">CheckIntervalTicks:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.CheckIntervalTicks )%>
            <%= Html.ValidationMessageFor( m => m.Item.CheckIntervalTicks )%></td>
        </tr>
        
        <tr>
            <td><label for="Item.LastUpdateHttpStatus">LastUpdateHttpStatus:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.LastUpdateHttpStatus, new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateHttpStatus )%></td>
        </tr>
        <tr>
            <td><label for="Item.LastUpdateDateTime">LastUpdateDateTime:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.LastUpdateDateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateDateTime )%></td>
        </tr>
        <tr>
            <td><label for="Item.FeedCategoryId">Feed Category:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.FeedCategoryId, new SelectList( Model.LookupList<FeedCategory>(), "FeedCategoryId", "Name", Model.Item.FeedCategoryId ), "-- Select --" )%>
            <%= Html.ValidationMessageFor( m => m.Item.FeedCategoryId )%></td>
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
</asp:Content>

