<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>

    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm( "save", "posts" )) {%>

        <%= Html.Hidden( "PostId", Model.Item.PostId )%>
        <%= Html.Hidden( "ParentId", Model.Item.ParentId )%>

        <p>
            <label for="Url">Url:</label>
            <%= Html.TextBox( "Url", Model.Item.Url )%>
            <%= Html.ValidationMessage("Url", "*") %>
        </p>
        <p>
            <label for="Title">Title:</label>
            <%= Html.TextBox( "Title", Model.Item.Title )%>
            <%= Html.ValidationMessage("Title", "*") %>
        </p>
        <p>
            <label for="Body">Body:</label>
            <%= Html.TextBox( "Body", Model.Item.Body )%>
            <%= Html.ValidationMessage("Body", "*") %>
        </p>
        <p>
            <label for="DateTime">DateTime:</label>
            <%= Html.TextBox( "DateTime", String.Format( "{0:g}", Model.Item.DateTime ) )%>
            <%= Html.ValidationMessage("DateTime", "*") %>
        </p>
        <p>
            <label for="Latitude">Latitude:</label>
            <%= Html.TextBox( "Latitude", String.Format( "{0:F}", Model.Item.Latitude ) )%>
            <%= Html.ValidationMessage("Latitude", "*") %>
        </p>
        <p>
            <label for="Longitude">Longitude:</label>
            <%= Html.TextBox( "Longitude", String.Format( "{0:F}", Model.Item.Longitude ) )%>
            <%= Html.ValidationMessage("Longitude", "*") %>
        </p>
        <p>
            <label for="Display">Display:</label>
            <%= Html.TextBox( "Display", Model.Item.Display )%>
            <%= Html.ValidationMessage("Display", "*") %>
        </p>
        <p>
            <label for="PostCategoryId">Post Category:</label>
            <%= Html.DropDownList( "PostCategoryId", new SelectList( Model.LookupList<PostCategory>(), "PostCategoryId", "Name", Model.Item.PostCategoryId ), string.Empty )%>
            <%= Html.ValidationMessage("PostCategoryId", "*") %>
        </p>
        <p>
            <label for="UserId">User:</label>
            <%= Html.DropDownList( "UserId", new SelectList( Model.LookupList<User>(), "UserId", "Name", Model.Item.UserId ), string.Empty )%>
            <%= Html.ValidationMessage( "UserId", "*" )%>
        </p>  
                
        <p>
            <label for="FeedId">FeedId:</label>
            <%= Html.DropDownList( "FeedId", new SelectList( Model.LookupList<Feed>(), "FeedId", "Title", Model.Item.FeedId ), string.Empty )%>
            <%= Html.ValidationMessage("FeedId", "*") %>
        </p>
        
        <p>
            <input type="submit" value="Save" />
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

