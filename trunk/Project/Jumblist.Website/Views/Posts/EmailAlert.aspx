<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<UserAlert>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <script type="text/javascript">
        $(document).ready(function() {

            $('#Item_IsImmediateSend').change(function() {
                if ($(this).attr("checked")) {
                    $('#timetosend').hide();
                    return;
                }
                $('#timetosend').show();
            });


        });
    </script>  
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<UserAlert>( "Item" )%>

    <% using ( Html.BeginForm() ) { %>

        <p>
            You are about to create an email alert based on the following criteria.
        </p>
            
        <p>    
            Posts: 
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Action ) ? Model.PostListRouteValues.Action + ", " : string.Empty %>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Id ) ? Model.PostListRouteValues.Id + ", " : string.Empty%>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Category ) ? Model.PostListRouteValues.Category + ", " : string.Empty%>
            <%= !string.IsNullOrEmpty( Model.PostListRouteValues.Q ) ? Model.PostListRouteValues.Q + ", " : string.Empty%><br />
            Location: Within <%= Model.UserSearchArea.Radius%> miles of <%= Model.UserSearchArea.LocationName%><br />            
        </p>        
        
        <table>
        
        <tr>
            <td class="field-label"><label for="Item_Name">Name</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Name, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a name for your alert
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
                </span>
            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="Item_IsImmediateSend">Send Immediately ?</label></td>
            <td class="field-input"><%= Html.CheckBoxFor( m => m.Item.IsImmediateSend, new { @class = "fancy-field", @checked = "true" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Send an email as soon as a new post matching your criteria is found?
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.IsImmediateSend )%>
                </span>
            </td>
        </tr>  
        
        <tr id="timetosend" style="display:none;">
            <td class="field-label"><label for="Item_TimetoSend">Time to Send</label></td>
            <td class="field-input"><%= Html.DropDownListFor( m => m.Item.TimetoSend, Model.BuildHoursSelectList( "9" ), new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a time on the 24 hour clock
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.TimetoSend )%>
                </span>
            </td>            
        </tr>
        
        </table>
                   
        <div class="button-submit">
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </div>

    <% } %>        
        
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
