<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Basket>" %>


<% if (Model.Items.Count > 0) 
    { %>
        <%= Html.ActionLink( "Your basket", "index", "basket", new { returnUrl = Model.ReturnUrl }, null )%> : <%= Model.Items.Count %> items
<%  }
    else
    { %> 
        Basket empty   
<%  } %>
