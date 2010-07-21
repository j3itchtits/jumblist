<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>

    <script type="text/javascript">
    
        $(document).ready(function() {
            $("input#tagSearch").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 1, multiple: true, multipleSeparator: " " });
        });
    
    </script> 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <div id="messages">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <% Html.RenderPartial( "SearchControl", Model.User ); %>
          
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <div id="fancy-greenbox">
        <p class="heading">Latest Posts</p>
        <% Html.RenderAction( "BasicPostList", "posts", new { top = 5 } ); %>
    </div>
    
    <div id="plain-box">
        <% Html.RenderPartial( "BasketControl" ); %>
    </div>
    
</asp:Content>

