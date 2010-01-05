<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( Model ) %>

    <%= Html.ClientSideValidation<Feed>( "Item" )%>

    <% using ( Html.BeginForm<FeedsController>( f => f.Save(null) ) ) { %>

        <%= Html.HiddenFor( m => m.Item.FeedId )%>
        
        <p>
            <label for="Item.Title">Title:</label>
            <%= Html.TextBoxFor( m => m.Item.Title ) %>
            <%= Html.ValidationMessageFor( m => m.Item.Title )%>
        </p>
        <p>
            <label for="Item.Url">Url:</label>
            <%= Html.TextBoxFor( m => m.Item.Url )%>
            <%= Html.ValidationMessageFor( m => m.Item.Url )%>
        </p>
        <p>
            <label for="Item.Username">Username:</label>
            <%= Html.TextBoxFor( m => m.Item.Username )%>
            <%= Html.ValidationMessageFor( m => m.Item.Username )%>
        </p>
        <p>
            <label for="Item.Password">Password:</label>
            <%= Html.TextBoxFor( m => m.Item.Password )%>
            <%= Html.ValidationMessageFor( m => m.Item.Password )%>
        </p>
        <p>
            <label for="Item.CheckIntervalTicks">CheckIntervalTicks:</label>
            <%= Html.TextBoxFor( m => m.Item.CheckIntervalTicks )%>
            <%= Html.ValidationMessageFor( m => m.Item.CheckIntervalTicks )%>
        </p>
        
        <p>
            <label for="Item.LastUpdateHttpStatus">LastUpdateHttpStatus:</label>
            <%= Html.TextBoxFor( m => m.Item.LastUpdateHttpStatus, new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateHttpStatus )%>
        </p>
        <p>
            <label for="Item.LastUpdateDateTime">LastUpdateDateTime:</label>
            <%= Html.TextBoxFor( m => m.Item.LastUpdateDateTime, "{0:g}", new { @readonly = "true" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.LastUpdateDateTime )%>
            
<%--<%= Html.TextBox( "feed.LastUpdateDateTime", String.Format( "{0:g}", Model.Item.LastUpdateDateTime ), new { @readonly = "true" } )%>
            <%= Html.ValidationMessage( "feed.LastUpdateDateTime" )%>--%>
        </p>
        
                
        <p>
            <label for="Item.FeedCategoryId">Feed Category:</label>
            <%= Html.DropDownListFor( m => m.Item.FeedCategoryId, new SelectList( Model.LookupList<FeedCategory>(), "FeedCategoryId", "Name", Model.Item.FeedCategoryId ) ) %>
            <%= Html.ValidationMessageFor( m => m.Item.FeedCategoryId )%>
            
<%--            <%= Html.DropDownList( "feed.FeedCategoryId", new SelectList( Model.LookupList<FeedCategory>(), "FeedCategoryId", "Name", Model.Item.FeedCategoryId ), string.Empty )%>
            <%= Html.ValidationMessage( "feed.FeedCategoryId" )%>--%>
        </p>            
        <p>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "list") %>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

