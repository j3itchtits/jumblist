<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>

    <%= Html.ClientSideValidation<Post>( "Item" )%>
    
    <% using ( Html.BeginForm() ) { %>

        <%= Html.HiddenFor( m => m.Item.PostId )%>
        
        <table>
        <tr>
            <td><label for="Item.Url">Url:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Url )%>
            <%= Html.ValidationMessageFor( m => m.Item.Url )%></td>
        </tr>        
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
            <td><label for="Item.Display">Display:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.Display )%>
            <%= Html.ValidationMessageFor( m => m.Item.Display )%></td>
        </tr>                
        </table>
        
        <p>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>
        
        <p>
            <%= Html.ActionLink( "Back to profile", "profile" ) %>
        </p>

    <% } %>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
