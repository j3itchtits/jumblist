<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

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
    
    <%= Html.ClientSideValidation<Post>( "Item" )%>
    
    <% using ( Html.BeginForm() ) { %>

        <%= Html.HiddenFor( m => m.Item.PostId )%>
        
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
            <td class="field-label"><label for="Item_Tags">Tags (optional)</label></td>
            <td class="field-input"><%= Html.TextBox( "Item.Tags", Model.Item.Tags.Select( x => x.Name ).ToFormattedStringList( "{0} ", 1 ), new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Please select some tags
                </span>             
            </td>             
        </tr>   
        
        <tr>
            <td class="field-label"><label for="Item_Display">Display ?</label></td>
            <td class="field-input"><%= Html.CheckBoxFor( m => m.Item.Display, new { @class = "fancy-field" } )%></td>
            <td class="field-helptext">
                <span class="field-info" style="display: none;">
                   Do you want your post to be visible?
                </span>   
                <span class="field-validation-error">
                   <%= Html.ValidationMessageFor( m => m.Item.Display )%>
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
        [ <%= Html.ActionLink( "Back to profile", "profile" ) %> ]
    </div>
            
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>
