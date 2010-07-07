<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PostViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2><%= Html.PageTitle( ViewData.Model )%></h2>
    
    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <%= Html.ClientSideValidation<Post>( "Item" )%>

        <% using ( Html.BeginForm() ) { %>

        <table>
        
        <tr>
            <td><label for="Item.Title">Title:</label></td>
            <td><%= Html.TextBoxFor( m => m.Item.Title, new { @size = "40" } )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter a title for your post
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                    <%= Html.ValidationMessageFor( m => m.Item.Title )%>
			    </div>
            </td>            
        </tr>
        
        <tr>
            <td><label for="Item.Body">Body:</label></td>
            <td><%= Html.TextAreaFor( m => m.Item.Body, new { @rows = "10", @cols = "40" } )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please enter a title for your post
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                   <%= Html.ValidationMessageFor( m => m.Item.Body )%>
			    </div>
            </td>               
        </tr>
        
        <tr>
            <td><label for="Item.PostCategoryId">Post Category:</label></td>
            <td><%= Html.DropDownListFor( m => m.Item.PostCategoryId, new SelectList( Model.SelectList<PostCategory>(), "SelectListValue", "Name" ) )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please select a category
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
                </div>
                <div class="label-box error" style="display: none;">
                   <%= Html.ValidationMessageFor( m => m.Item.PostCategoryId )%>
			    </div>
            </td>             
        </tr>   
                
        <tr>
            <td><label for="Item.Tags">Tags:</label></td>
            <td><%= Html.TextBox( "Item.Tags", "", new { @size = "40" } )%></td>
            <td>
                <div class="label-box info" style="display: none;">
                   Please select some tags
                </div>
                <div class="label-box good" style="display: none;">
                    Ok
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


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function() {
        $("input#Item_Tags").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });
        });
    </script> 
        
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

Please create a new post
    
</asp:Content>