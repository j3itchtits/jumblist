<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

[ <%= Html.LoginLink( "Log In", Page.Request.Url.PathAndQuery ) %> ]
[ <%= Html.RegisterLink( "Register", Page.Request.Url.PathAndQuery ) %> ]  