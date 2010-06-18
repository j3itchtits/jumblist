<%@ Page Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Post>>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Model.PageTitle %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( ViewData.Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( ViewData.Model )%>
    
    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
    
    <div id="itemsList">
        <% Html.RenderPartial( "PostList", Model.PagedList ); %>
    </div>

    <p>
        <%= Html.ActionLink( "Create", "create" )%>
    </p> 
    
    <div class="nextpreviouspagelinks">
        <%= Html.NextPreviousPageLinks( Model.PagedList.PageNumber, Model.PagedList.HasPreviousPage, Model.PagedList.HasNextPage, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
    </div>

    <div class="paginglinks">
        <%= Html.PagingLinks( Model.PagedList.PageNumber, Model.PagedList.PageCount, x => Url.Action( ViewContext.RouteData.Values["action"].ToString(), new { id = ViewContext.RouteData.Values["id"].ToString(), page = x } ) )%>
    </div>
                 


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">

    <%= Html.ActionLink( "Edit Post Categories", "categorylist" )%><br />

</asp:Content>
