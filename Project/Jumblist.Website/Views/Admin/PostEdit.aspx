<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Data.Entity.Post>" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
	<title>Admin - Edit Post - <%= Model.Title %></title>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Post - <%= Model.Title %></h2>

    <% using (Html.BeginForm( "PostEdit", "Admin" )) { %>

        <%= Html.Hidden("PostId") %>
        
        <table border="1" style="margin: 10px 0px">
        <tr>
            <td>Url:</td>
            <td><%= Html.TextBox( "Url" )%> <%= Html.ValidationMessage( "Url" )%></td>
        </tr>

        <tr>
            <td>Title: </td>
            <td><%= Html.TextBox( "Title" )%> <%= Html.ValidationMessage( "Title" )%></td>
        </tr>
        
        <tr>
            <td>Body: </td>
            <td><%= Html.TextBox( "Body" )%> <%= Html.ValidationMessage( "Title" )%></td>
        </tr>
        
        <tr>
            <td>DateTime: </td>
            <td><%= Html.TextBox( "DateTime" )%> <%= Html.ValidationMessage( "DateTime" )%></td>
        </tr>
        
        <tr>
            <td>Latitude: </td>
            <td><%= Html.TextBox( "Latitude" )%> <%= Html.ValidationMessage( "Latitude" )%></td>
        </tr>
        
        <tr>
            <td>Longitude: </td>
            <td><%= Html.TextBox( "Longitude" )%> <%= Html.ValidationMessage( "Longitude" )%></td>
        </tr>
        
        <tr>
            <td>Display: </td>
            <td><%= Html.CheckBox( "Display" )%> <%= Html.ValidationMessage( "Display" )%></td>
        </tr>
        
        <tr>
            <td>PostCategoryId: </td>
            <td><%= Html.TextBox( "PostCategoryId", Model.Category.PostCategoryId )%> <%= Html.ValidationMessage( "PostCategoryId" )%></td>
        </tr>
        
        <tr>
            <td>AuthorId: </td>
            <td><%= Html.TextBox( "AuthorId", Model.Author.AuthorId )%> <%= Html.ValidationMessage( "AuthorId" )%></td>
        </tr>
        
        <tr>
            <td>FeedId: </td>
            <td><%= Html.TextBox( "FeedId", Model.Feed.FeedId )%> <%= Html.ValidationMessage( "FeedId" )%></td>
        </tr>
        </table>       
        
        <input type="submit" value="Save" /> &nbsp;&nbsp;<%= Html.ActionLink( "Cancel", "posts" ) %>
        
    <% } %>
    
</asp:Content>

