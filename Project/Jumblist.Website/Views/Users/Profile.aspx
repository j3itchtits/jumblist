<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">
   
    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model ) %>
    
    <p>
        Name:
        <%= Html.Encode( Model.Item.Name )%>
    </p>

    <p>
        Email:
        <%= Html.Encode( Model.Item.Email )%>
    </p>
    
    <div class="post-locations">
        <div><b>Posts by this user: </b><br />
        <% foreach ( var post in Model.Item.Posts )
           {
               Response.Write( post.Title + "<br />" );
           } %>
        </div>
    </div>
       
    <p style="padding-top:10px;">
        <%=Html.ActionLink( "Back to List", "list" ) %>
    </p>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

