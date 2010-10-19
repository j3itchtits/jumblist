<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>


<div id="sendEmailForm" class="hide widget-green">
    <% using ( Ajax.BeginForm( "email", new AjaxOptions { HttpMethod = "POST", UpdateTargetId = "system-message" } ) )
       { %>    
            <div id="messageSendEmailForm" class="hide"></div>
            <%= Html.Hidden( "postId" )%>
            <%= Html.TextBox( "emailAddress" ) %>
            <%= Html.SubmitButton( "submitSendEmailForm", "Send" )%> <a href="#" id="closeSendEmailForm">Cancel</a>
    <% } %>
</div>

           
<%--<div class="hide"> 
	<div id="colorboxSendEmailContent" style="padding:10px; background:#fff;"> 
	    <form action="/posts/emailunauthenticated" method="post">
	    <p><strong><span id="posttitle"></span></strong></p>
	    <input id="postid" name="postid" type="hidden" />
	    <label for="email" style="display:none;">Email address</label><input id="postemailaddress" name="postemailaddress" type="text" value="Enter Email Address" />
	    <input type="submit" value="Send" />  
	    </form>
	</div> 
</div> --%>