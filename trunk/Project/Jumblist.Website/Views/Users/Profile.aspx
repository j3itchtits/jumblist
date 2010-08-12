<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( ViewData.Model )%>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">
   
    <h2><%= Html.PageTitle( ViewData.Model )%></h2>

    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
        
    <p><%=Html.ActionLink( "[Edit]", "edit" ) %></p>
   
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
       <b>Your alerts</b><br />
        <% foreach ( var alert in Model.Item.UserAlerts )
           { %>
                <%= alert.Name %> <%= Html.ActionLink( "[Edit]", "alert", new { id = alert.UserAlertId } ) %><br /><%
           } %>
    </div>
                
    <div class="user-posts">
        <b>Your posts</b><br />
        <% foreach ( var post in Model.Item.Posts.OrderByDescending( t => t.PublishDateTime ) )
           { %>
                <%= post.Title %> <%= Html.RouteLink( "[View]", "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() } ) %> <%= Html.ActionLink( "[Edit]", "post", new { id = post.PostId } ) %><br /><%
           } %>
    </div>
      

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

