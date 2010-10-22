<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%-- 
<div id="sendEmailFormDiv" class="hide widget-green">
    <% using ( Ajax.BeginForm( "email", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "system-message" } ) )
       { %>    
            <div id="messageSendEmailForm" class="hide"></div>
            <%= Html.Hidden( "postId" )%>
            <%= Html.TextBox( "emailAddress" ) %>
            <%= Html.SubmitButton( "submitSendEmailForm", "Send" )%> <a href="#" id="closeSendEmailForm">Cancel</a>
    <% } %>
</div>
 --%>
           

	<div id="sendEmailFormDiv" class="hide widget-green"> 
        <div class="hide"><b>Success. Your email was sent.</b></div>
        <img src="/assets/images/loading.gif" alt="Loading" class="hide" />	  
	    <form action="<%= Url.Action( "email", "posts" ) %>" method="post">
	        <div id="messageSendEmailForm" class="hide"></div>
	        <input id="postId" name="postId" type="hidden" />
	        <label for="emailAddress" class="hide">Email address</label>
	        <input id="emailAddress" name="emailAddress" type="text" value="" />
	        <input id="submitSendEmailForm" type="submit" value="Send" /> <img src="/assets/images/loading.gif" alt="Loading" class="hide" /> <a href="#" id="closeSendEmailForm">Cancel</a>
	    </form>
	</div> 
