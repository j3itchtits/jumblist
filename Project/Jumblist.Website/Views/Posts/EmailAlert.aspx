<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>

        <% using ( Html.BeginForm() ) { %>

        <%= Html.Hidden( "searchResult", ViewData["searchResult"] ) %>
                
        <p>
            Action: <%= Model.PostListRouteValues.Action %><br />
            Id: <%= Model.PostListRouteValues.Id %><br />
            Category: <%= Model.PostListRouteValues.Category %><br />
            Q: <%= Model.PostListRouteValues.Q %><br />
        </p>        
        
        <table>
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name, new { @size = "40" } )%>
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
        </table>
                   
        <p>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </p>

    <% } %>        
        
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
