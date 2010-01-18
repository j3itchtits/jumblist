<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/Admin/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<Jumblist.Core.Model.Feed>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BodyContentLeft" runat="server">

    <h2>Test</h2>

    <fieldset>
        <legend>Fields</legend>
        <p>
            FeedId:
            <%= Html.Encode(Model.FeedId) %>
        </p>
        <p>
            Title:
            <%= Html.Encode(Model.Title) %>
        </p>
        <p>
            Url:
            <%= Html.Encode(Model.Url) %>
        </p>
        <p>
            Username:
            <%= Html.Encode(Model.Username) %>
        </p>
        <p>
            Password:
            <%= Html.Encode(Model.Password) %>
        </p>
        <p>
            CheckIntervalTicks:
            <%= Html.Encode(Model.CheckIntervalTicks) %>
        </p>
        <p>
            LastUpdateHttpStatus:
            <%= Html.Encode(Model.LastUpdateHttpStatus) %>
        </p>
        <p>
            LastUpdateDateTime:
            <%= Html.Encode(String.Format("{0:g}", Model.LastUpdateDateTime)) %>
        </p>
        <p>
            FeedCategoryId:
            <%= Html.Encode(Model.FeedCategoryId) %>
        </p>
    </fieldset>
    <p>

        <%=Html.ActionLink("Edit", "Edit", new { id=Model.FeedId }) %> |
        <%=Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentTitle" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContentJavascript" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentRight" runat="server">
</asp:Content>

