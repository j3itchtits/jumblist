﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HandleErrorInfo>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    Error
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Page Not Found</h2>

        <p>We couldn't find the page you requested. We did, however, find this program.</p> 
        <ul>    
        <li>Try <a href="/search">searching for it</a></li> 
        <li>Browse <a href="/questions">recent questions</a></li> 
        <li>Browse <a href="/tags">popular tags</a></li> 
        </ul> 
        <p>Occasionally questions or answers may be removed from Stack Overflow for reasons of moderation: spam, off topic, abuse, etcetera.</p> 
        <p>If you feel something is missing that should be here, <a href="mailto:team@stackoverflow.com">contact us</a>.</p> 
            
<%--    <p>
        There was a <b><%= Html.Encode( Model.Exception.GetType().Name ) %></b> while attempting to display the <b><%= Html.Encode( Model.ControllerName ) %> <%=Html.Encode( Model.ActionName )%></b> page.
    </p>
    <p>
        Message: <%= Html.Encode( Model.Exception.Message ) %>
    </p>
    --%>
    
    <%--<p>
      Stack Trace: <%= Html.Encode( Model.Exception.StackTrace ) %>
    </p>--%>

</asp:Content>
