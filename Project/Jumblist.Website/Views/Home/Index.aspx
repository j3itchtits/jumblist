<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<asp:Content ID="Content4" ContentPlaceHolderID="HeadContentJavascript" runat="server">

    <script type="text/javascript">

        $(document).ready(function() {
        
    });
       
    </script>  

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentLeft" runat="server">
    
    <% Html.RenderPartial( "SearchControl", Model.User ); %>
          
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentRight" runat="server">

    <p>Quick View</p>
    <p><%= Html.ActionLink("Everything", "index", "posts")%><br />
    <%= Html.ActionLink("Wanted", "category", "posts", new { id = "Wanted" }, null ) %><br />
    <%= Html.ActionLink( "Offered", "category", "posts", new { id = "Offered" }, null )%></p>
     
     <p>Latest Items</p>
     <% Html.RenderAction("BasicList", "posts", new { top = 5 } ); %>

</asp:Content>

