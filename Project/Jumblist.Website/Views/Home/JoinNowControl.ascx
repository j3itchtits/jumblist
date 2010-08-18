<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<User>" %>

<%

    if (!Model.IsAuthenticated)
    { %>

        <div class="widget-green join-now">
            <%= Html.RegisterLink( "Join now", Page.Request.Url.PathAndQuery, new { @class = "icon" } )%>
        </div>

        <%
    }
%>


