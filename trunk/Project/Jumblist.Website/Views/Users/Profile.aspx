<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">
   
    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%> <%=Html.ActionLink( "[Edit]", "edit" ) %>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    <p>
        Name:
        <%= Html.Encode( Model.Item.Name )%>
    </p>

    <p>
        Email:
        <%= Html.Encode( Model.Item.Email )%>
    </p>

    <p>
        Postcode:
        <%= Html.Encode( Model.Item.Postcode )%>
    </p>
    
    <p>
        Radius:
        <%= Html.Encode( Model.Item.Radius )%>
    </p>
        
    <div class="user-alerts">
        <div><b>Your alerts</b><br />
        <% foreach ( var alert in Model.Item.UserAlerts )
           { %>
                <%= alert.Name %> <%= Html.ActionLink( "[Edit]", "alert", new { id = alert.UserAlertId } ) %><br /><%
           } %>
        </div>
    </div>
                
    <div class="user-posts">
        <div><b>Your posts</b><br />
        <% foreach ( var post in Model.Item.Posts )
           { %>
                <%= post.Title %> <%= Html.ActionLink( "[Edit]", "post", new { id = post.PostId } ) %><br /><%
           } %>
        </div>
    </div>
      

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

