<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel<Feed>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <%= Html.PageTitle( Model, HtmlTextWriterTag.H2 )%>
    
    <%= Html.MessageBox( Model ) %>


    <p>
        FeedId:
        <%= Html.Encode(Model.Item.FeedId) %>
    </p>
    <p>
        Title:
        <%= Html.Encode( Model.Item.Title )%>
    </p>
    <p>
        TitleUrlEncoded:
        <%= Html.Encode( Model.Item.TitleUrlEncoded )%>
    </p>
    <p>
        Url:
        <%= Html.Encode( Model.Item.Url )%>
    </p>
    <p>
        Username:
        <%= Html.Encode( Model.Item.Username )%>
    </p>
    <p>
        Password:
        <%= Html.Encode( Model.Item.Password )%>
    </p>
    <p>
        CheckIntervalTicks:
        <%= Html.Encode( Model.Item.CheckIntervalTicks )%>
    </p>
    <p>
        LastUpdateHttpStatus:
        <%= Html.Encode( Model.Item.LastUpdateHttpStatus )%>
    </p>
    <p>
        LastUpdateDateTime:
        <%= Html.Encode( String.Format( "{0:g}", Model.Item.LastUpdateDateTime ) )%>
    </p>

    <div>
        <%=Html.ActionLink("Back to List", "list") %>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
    <%= Html.PageTitle( Model )%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

