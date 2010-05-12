<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% 
    if (!(ViewContext.Controller is UsersController))
    { %>
        <div id="loginarea">
            <% Html.RenderAction("LoginLinks", "Users"); %>
        </div> <%
    } 
%>


