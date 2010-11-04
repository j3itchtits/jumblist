<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <%= Html.AutocompleteProjectRefs()%>
    
    <script src="<%= Url.Script( "jquery.cookie.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.showedithide.js" )%>" type="text/javascript"></script>

  
    <script type="text/javascript">

        $(document).ready(function() {

            $("#tagSearch").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags", new { area = "" } ) %>', { minChars: 1, multiple: true, multipleSeparator: " " }).focus();

            $('#radius-edit').showedithide();

            $("#pane-welcomemessage .hidetext").click(function() {
                $(this).parent()
                    .animate({ backgroundColor: "#eee" }, "fast")
                    .animate({ opacity: "hide" }, "slow");
                $.cookie('hide-welcomemessage', '1', { expires: 365 });
                return false;
            });

            if ($.cookie('hide-welcomemessage') == '1') {
                $("#pane-welcomemessage").hide();
            }



        });
    
    
    </script> 

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h1 class="hide">Jumblist Home Page</h1>
    <h2 class="hide">Freecycling made easy</h2>

    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model ) %>
    </div>

    <%  if (!Model.User.IsAuthenticated)
        { %>
            <div id="pane-welcomemessage">
                Welcome to Jumblist, an open service allowing you to perform location-based searches of UK Freecycle and Freegle groups. If you <%= Html.RegisterLink( "register" ) %>, you can also setup email alerts to let you know when new posts matching your search have been posted.
                <%= Html.ActionLink( "More details...", "about" ) %>
                <a href="#" class="hidetext">Hide</a>
            </div> <%
        } 
    %>
                       
    <div id="home-search-control">
        <% Html.RenderPartial( "SearchControl", Model.User ); %>
    </div>
    
    <div class="widget widget-socialmedia" style="width:210px; margin: 0 auto;">
        <div class="facebook-share-button"><fb:like href="<%= Request.Url.AbsoluteUri %>" layout="button_count"></fb:like></div>
        <a href="http://twitter.com/share" class="twitter-share-button" data-text="Check this out! Jumblist covers all UK free recycling..." data-count="horizontal" data-via="jumblistuk">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <% Html.RenderPartial( "JoinNowControl", Model.User ); %>

       
    <div class="widget widget-green">
        <h3>Latest Posts</h3>
        <% Html.RenderAction( "BasicPostList", "posts", new { top = 5 } ); %>
    </div>
    
</asp:Content>

