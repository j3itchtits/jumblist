<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<HandleErrorInfo>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    Error
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>My error page</h2>
    
    <p>
        There was a <b><%= Html.Encode( Model.Exception.GetType().Name ) %></b> while attempting to display the <b><%= Html.Encode( Model.ControllerName ) %> <%=Html.Encode( Model.ActionName )%></b> page.
    </p>
    <p>
        Message: <%= Html.Encode( Model.Exception.Message ) %>
    </p>
    
    <%--<p>
      Stack Trace: <%= Html.Encode( Model.Exception.StackTrace ) %>
    </p>--%>

</asp:Content>
