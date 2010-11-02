<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server"><%= Html.PageTitle( ViewData.Model )%></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">
   
    <h2><%= Html.PageTitle( ViewData.Model )%></h2>

    <div id="system-message">
        <%= Html.MessageBox( ViewData.Model )%>
    </div>
        
    <p><%=Html.ActionLink( "[ Edit Profile ]", "edit" ) %>  </p>  
   
    <p>
        Name: <%= Html.Encode( Model.Item.Name )%><br />
        Email:  <%= Html.Encode( Model.Item.Email )%><br />
        Postcode: <%= Html.Encode( Model.Item.Postcode )%><br />
        Default Search Radius: <%= Html.Encode( Model.Item.Radius )%> miles<br />
    </p>
        
    <table class="user-alerts">
       <tr><th colspan="2">Your alerts</th></tr>
        <% foreach ( var alert in Model.Item.UserAlerts )
           { %>
                <tr><td><%= alert.Name %></td><td><%= Html.ActionLink( "[ Edit ]", "alert", new { id = alert.UserAlertId } ) %></td></tr><%
           } %>
    </table>
                
    <table class="user-posts">
        <tr><th colspan="3">Your posts</th></tr>
        <% foreach ( var post in Model.Item.Posts.OrderByDescending( t => t.PublishDateTime ) )
           { %>
                <tr><td><%= post.Title %></td><td><%= Html.RouteLink( "[ View ]", "Post-Detail", new { id = post.PostId, name = post.Title.ToFriendlyUrlEncode() } ) %></td><td><%= Html.ActionLink( "[ Edit ]", "post", new { id = post.PostId } ) %></td></tr><%
           } %>
    </table>
      

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

