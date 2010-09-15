<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.ImportedAsset( "Autocomplete", "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.ImportedAsset( "Autocomplete", "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
    
        $(document).ready(function() {
            $("input#Item_Tags").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 1, multiple: true, multipleSeparator: " " });
        });
        
    </script> 
        
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <%= Html.ClientSideValidation<Post>( "Item" )%>

        <% using ( Html.BeginForm() ) { %>

        <table>
        
        <tr>
            <td class="field-label"><label for="Item_Title">Title</label></td>
            <td class="field-input"><%= Html.TextBoxFor( m => m.Item.Title, new { @class = "fancy-field", @size = "40" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter a title
                </span>
                <span class="field-validation-error">
                    <%= Html.ValidationMessageFor( m => m.Item.Title )%>
                </span>
            </td>
        </tr>
        
        <tr>
            <td class="field-label"><label for="Item_Body">Body</label></td>
            <td class="field-input"><%= Html.TextAreaFor( m => m.Item.Body, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please enter some text for your post
                </span>
                <span class="field-validation-error">
                   <%= Html.ValidationMessageFor( m => m.Item.Body )%>
			    </span>
            </td>               
        </tr>
        
        <tr>
            <td class="field-label"><label for="Item_PostCategoryId">Category</label></td>
            <td class="field-input"><%= Html.DropDownListFor( m => m.Item.PostCategoryId, new SelectList( Model.SelectList<PostCategory>(), "SelectListValue", "Name" ), new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please select a category for your post
                </span>            
                <span class="field-validation-error">
                   <%= Html.ValidationMessageFor( m => m.Item.PostCategoryId )%>
			    </span>
            </td>             
        </tr>   
                
        <tr>
            <td class="field-label"><label for="Item_Tags">Tags (optional)</label></td>
            <td class="field-input"><%= Html.TextBox( "Item.Tags", string.Empty, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please select some tags
                </span>             
            </td>             
        </tr>           
        
        </table>
                   
        <div class="button-submit">
            <%= Html.AntiForgeryToken() %>
            <%= Html.SubmitButton( "submit", "Create" ) %>
        </div>

    <% } %>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

    
</asp:Content>