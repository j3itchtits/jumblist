<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() 
        {
            $("input#Item_Tags").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });
        });
    </script> 
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
    
    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>
    
    <% using ( Html.BeginForm() ) { %>

        <%= Html.HiddenFor( m => m.Item.UserAlertId )%>
        <%= Html.HiddenFor( m => m.Item.PostListRouteValues )%>
        <%= Html.HiddenFor( m => m.Item.SearchArea )%>

        <p>
            Action: <%= Model.PostListRouteValues.Action %><br />
            Id: <%= Model.PostListRouteValues.Id %><br />
            Category: <%= Model.PostListRouteValues.Category %><br />
            Q: <%= Model.PostListRouteValues.Q %><br />
            Location: Within <%= Model.UserSearchArea.Radius%> miles of <%= Model.UserSearchArea.Name %><br /> 
        </p>   
                
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name )%>
            <%= Html.ValidationMessageFor( m => m.Item.Name )%></td>
        </tr>
        <tr>
            <td><label for="Item.IsImmediateSend">IsImmediateSend:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsImmediateSend )%></td>
        </tr>  
        <tr>
            <td><label for="Item.TimetoSend">TimetoSend:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.TimetoSend )%>
            <%= Html.ValidationMessageFor( m => m.Item.TimetoSend )%></td>
        </tr>         
        <tr>
            <td><label for="Item.IsActive">IsActive:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsActive )%></td>
        </tr>              
        <tr>
            <td><label for="Item.DateTimeLastSent">DateTimeLastSent:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.DateTimeLastSent, "{0:g}", new { @readonly = "true" } )%></td>
        </tr>  
        <tr>
            <td><label for="Item.DateTimeCreated">DateTimeCreated:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.DateTimeCreated, "{0:g}", new { @readonly = "true" } )%></td>
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

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
