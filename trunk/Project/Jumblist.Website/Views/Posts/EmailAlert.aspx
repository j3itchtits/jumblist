<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>

    <% using ( Html.BeginForm() ) { %>

        <p>
            Action: <%= Model.PostListRouteValues.Action %><br />
            Id: <%= Model.PostListRouteValues.Id %><br />
            Category: <%= Model.PostListRouteValues.Category %><br />
            Q: <%= Model.PostListRouteValues.Q %><br />
            Location: Within <%= Model.UserSearchArea.Radius%> miles of <%= Model.UserSearchArea.Name%><br />            
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
            <td><label for="Item.IsImmediateSend">IsImmediateSend:</label></td>
            <td><%= Html.CheckBoxFor( m => m.Item.IsImmediateSend )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Remember the details on this computure?
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
            </td>
        </tr>  
        
        <tr>
            <td><label for="Item.TimetoSend">TimetoSend:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.TimetoSend )%></td>
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

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
