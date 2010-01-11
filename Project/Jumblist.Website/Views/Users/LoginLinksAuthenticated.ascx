<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DefaultViewModel<User>>" %>

Welcome <b><%= Model.Item.Name %></b>!
[ <%= Html.LogoutLink( "Log Out" )%> ] |

<% if ( Model.Item.Role.UserCanAccessAdminArea ) { %>
       [ <%= Html.ActionLink( "Admin", "Index", new { area = "Admin", controller = "Home" } ) %> ]
<% } %>

