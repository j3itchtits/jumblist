<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>

    <%= Html.ClientSideValidation<User>( "Item" )%>

    <% using ( Html.BeginForm( "save", "users" ) ) { %>

        <%= Html.HiddenFor( m => m.Item.UserId )%>
        
        <table>
        <tr>
            <td class="field-label"><label for="Item_Name">Name:</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Name, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Your username
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Name )%>
                </span>            
            </td>
        </tr>
        <tr>
            <td class="field-label"><label for="Item_Email">Email:</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Email, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Your email address
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Email )%>
                </span>            
            </td>
        </tr>
        <tr>
            <td class="field-label"><label for="Item_Postcode">Postcode:</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Postcode, new { @class = "fancy-field text-upper" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Your postcode
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Postcode )%>
                </span>            
            </td>
        </tr>      
        <tr>
            <td class="field-label"><label for="Item_Radius">Radius:</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Radius, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Search radius in miles centered on your postcode
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Radius )%>
                </span>            
            </td>
        </tr> 

        </table>
        
        <div class="button-submit">
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Save" ) %>
        </div>


    <% } %>
    
    <div>
        [ <%=Html.ActionLink( "Back to profile", "profile" ) %> ]
    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <div class="widget-green">
    
        <h3>Reset Password</h3>
        
        <% using (Html.BeginForm( "savepassword", "users" )) { %>
            
            <%= Html.Hidden( "userid", Model.Item.UserId ) %>
            
            <table>
            <tr>
                <td><label for="Password">Old Password</label></td>
                <td><%= Html.Password( "OldPassword" )%>
                <%= Html.ValidationMessage( "Reset.OldPassword" )%>     </td>       
            </tr>        
            <tr>
                <td><label for="Password">New Password</label></td>
                <td><%= Html.Password( "NewPassword" )%>
                <%= Html.ValidationMessage( "Reset.NewPassword" )%>     </td>       
            </tr>
            <tr>
                <td><label for="ConfirmPassword">Confirm New Password</label></td>
                <td><%= Html.Password( "ConfirmNewPassword" )%>
                <%= Html.ValidationMessage( "Reset.ConfirmNewPassword" )%>  </td>
            </tr>
            </table>
            <p>
                <%= Html.AntiForgeryToken() %>
                <%= Html.SubmitButton( "submit", "Reset Password" ) %>
            </p>        
            
        <% } %>
    
    </div>
    
</asp:Content>
