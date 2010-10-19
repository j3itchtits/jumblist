<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <%= Html.AutocompleteProjectRefs()%>
    
    <script src="<%= Url.Script( "jquery.cookie.js" )%>" type="text/javascript"></script>
    
    <script type="text/javascript">

        $(document).ready(function() {

            $("#tagSearch").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 1, multiple: true, multipleSeparator: " " });

            $('#radius-edit').click(function() {
                $('#radius-value').hide();
                $('#radius-edit').hide();
                $('#locationRadius').fadeIn().focus();
                return false;
            });

            $('#locationRadius').blur(function() {
                $('#locationRadius').hide();
                //need to pass the value from input to span
                $('#radius-value').html($('#locationRadius').val()).fadeIn();
                $('#radius-edit').fadeIn();
                return false;
            });

            $("#pane-tempmessage .hidetext").click(function() {
                $(this).parent()
                    .animate({ backgroundColor: "#eee" }, "fast")
                    .animate({ opacity: "hide" }, "slow");
                $.cookie('hide-welcomemessage', '1', { expires: 365 });
                return false;
            });

            if ($.cookie('hide-welcomemessage') == '1') $("#pane-tempmessage").hide();
        });
    
    
    </script> 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h1 class="hide">Jumblist Home Page</h1>
    <h2 class="hide">Freecycling made easy</h2>

    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>
    
    <% Html.RenderPartial( "SearchControl", Model.User ); %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderPartial( "JoinNowControl", Model.User ); %>
    
    <div class="widget widget-green">
        <h3>Latest Posts</h3>
        <% Html.RenderAction( "BasicPostList", "posts", new { top = 5 } ); %>
    </div>
    
</asp:Content>

