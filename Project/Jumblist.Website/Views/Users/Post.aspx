<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
    
    <%= Html.ClientSideValidation<Post>( "Item" )%>
    
    <% using ( Html.BeginForm() ) { %>

        <%= Html.HiddenFor( m => m.Item.PostId )%>
        
        <table>
        <tr>
            <td><label for="Item.Title">Title:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Title )%>
            <%= Html.ValidationMessageFor( m => m.Item.Title )%></td>
        </tr>
        <tr>
            <td><label for="Item.Body">Body:</label></td>
            <td><%= Html.TextAreaFor( m => m.Item.Body, new { @rows = "10", @cols = "100" } )%>
            <%= Html.ValidationMessageFor( m => m.Item.Body )%></td>
        </tr>
        <tr>
            <td><label for="Item.Tags">Tags:</label></td>
            <td><%= Html.TextBox( "Item.Tags", Model.Item.Tags.Select( x => x.Name ).ToFormattedStringList( "{0} ", 1 ), new { @size = "40" } )%></td>
        </tr>            
        <tr>
            <td><label for="Item.Display">Display:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.Display )%>
            <%= Html.ValidationMessageFor( m => m.Item.Display )%></td>
        </tr>                
        </table>
        
        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </div>
        
        <div>
            <%= Html.ActionLink( "Back to profile", "profile" ) %>
        </div>

    <% } %>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
        $("input#Item_Tags").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });
        });
    </script> 
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
