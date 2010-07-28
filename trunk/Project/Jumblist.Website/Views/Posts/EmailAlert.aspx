<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>

    <% using ( Html.BeginForm() ) { %>

        <p>
            You are about to create an email alert base on the following criteria:<br />
            Posts: 
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Action ) ? Model.PostListRouteValues.Action + ", " : string.Empty %>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Id ) ? Model.PostListRouteValues.Id + ", " : string.Empty%>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Category ) ? Model.PostListRouteValues.Category + ", " : string.Empty%>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Q ) ? Model.PostListRouteValues.Q + ", " : string.Empty%><br />
            Location: Within <%= Model.UserSearchArea.Radius%> miles of <%= Model.UserSearchArea.LocationName%><br />            
        </p>        
        
        <table>
        
        <tr>
            <td><label for="Item.Name">Name:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Name, new { @size = "40" } )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter a name for your alert
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
			    </div>
            </td>
        </tr>
        
        <tr>
            <td><label for="Item.IsImmediateSend">Send Immediately?:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsImmediateSend )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Send an email as soon as a new post matching your criteria is found?
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
            </td>
        </tr>  
        
        <tr>
            <td><label for="Item.TimetoSend">Send Daily:</label></td>
            
            <td><%= Html.DropDownListFor( m => m.Item.TimetoSend, Model.BuildHoursSelectList( "9" ) )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter a time on the 24 hour clock
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.TimetoSend )%>
			    </div>
            </td>            
        </tr>
        
        </table>
                   
        <div>
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </div>

    <% } %>        
        
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
