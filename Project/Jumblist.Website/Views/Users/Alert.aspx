<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <%= Html.AutocompleteProjectRefs()%>
    
    <script type="text/javascript">
        $(document).ready(function() 
        {
            $("input#Item_Tags").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });
        });
    </script> 
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
    
    <p><%=Html.ActionLink( "[ Back to profile ]", "profile" ) %></p>

    <p>
        <b>Alert Definition</b><br />
        <%= Html.AlertDefinition( Model.PostListRouteValues, Model.UserSearchArea )%>
    </p>   
            
    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>
    
    <% using ( Html.BeginForm() ) { %>

        <%= Html.HiddenFor( m => m.Item.UserAlertId )%>

        <table>
        <tr>
            <td class="field-label"><label for="Item_Name">Name</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Name, new { @class = "fancy-field" } )%>
            <td class="field-helptext">
                <span class="field-info hide">
                   Please enter a name for your alert
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
                </span>
            </td>
        </tr>
        <tr>
            <td class="field-label"><label for="Item_IsImmediateSend">Send Immediately ?</label></td>
            <td class="field-input"><%= Html.CheckBoxFor( m => m.Item.IsImmediateSend, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info hide">
                   Send an email as soon as a new post matching your criteria is found?
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.IsImmediateSend )%>
                </span>
            </td>            
        </tr>  
        <tr>
            <td class="field-label"><label for="Item_TimetoSend">Time to Send</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.TimetoSend, new { @class = "fancy-field" } )%>
            <td class="field-helptext">
                <span class="field-info hide">
                   Please enter a time on the 24 hour clock
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.TimetoSend )%>
                </span>
            </td>   
        </tr>         
        <tr>
            <td class="field-label"><label for="Item_IsActive">Is Active ?</label></td>
            <td class="field-input"><%= Html.CheckBoxFor( m => m.Item.IsActive, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info hide">
                   Is this alert active?
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.IsActive )%>
                </span>
            </td>               
        </tr>              
        <tr>
            <td class="field-label"><label for="Item_DateTimeLastSent">Last Sent</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.DateTimeLastSent, "{0:g}", new { @readonly = "true" } )%></td>
            <td class="field-helptext">

            </td>              
        </tr>  
        <tr>
            <td class="field-label"><label for="Item_DateTimeCreated">Created</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.DateTimeCreated, "{0:g}", new { @readonly = "true" } )%></td>
            <td class="field-helptext">

            </td>              
        </tr>                     
        </table>
        
        <div class="button-submit">
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
            <%= Html.ActionLink( "[ Cancel ]", "profile" ) %>
        </div>

    <% } %>
            
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
