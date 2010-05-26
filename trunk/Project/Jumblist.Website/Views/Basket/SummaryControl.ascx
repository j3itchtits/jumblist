<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Basket>" %>


<% if (Model.Items.Count > 0) 
    { %>
        <span class="caption"><%= Html.ActionLink( "Your jumblist", "index", "basket", new { returnUrl = Request.Url.PathAndQuery }, null )%> : <%= Model.Items.Count %> items</span>
<%  }
    else
    { %> 
        Your jumblist is empty   
<%  } %>
