<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>jQueryTest</title>

    <script src="<%= Url.Script( "MicrosoftAjax.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "MicrosoftMvcAjax.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery-1.3.2.min.js" )%>" type="text/javascript"></script>
    <script src="~/Assets/Scripts/jquery-1.3.2.min-vsdoc.js" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.autocomplete.min.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.highlight-3.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.jumblist.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.timer.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.colorbox-min.js" )%>" type="text/javascript"></script>

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "colorbox.css" )%>" rel="stylesheet" type="text/css"/>
    
    <style type="text/css">
        .highlight { background-color: yellow; }
        .highlightedlink { background-color: #eee; }
        #dataDisplay { background-color: yellow; border: 1px solid black; }


		UL.tabNavigation {
		    list-style: none;
		    margin: 0;
		    padding: 0;
		}
 
		UL.tabNavigation LI {
		    display: inline;
		}
 
		UL.tabNavigation LI A {
		    padding: 3px 5px;
		    background-color: #ccc;
		    color: #000;
		    text-decoration: none;
		}
 
		UL.tabNavigation LI A.selected,
		UL.tabNavigation LI A:hover {
		    background-color: #333;
		    color: #fff;
		    padding-top: 7px;
		}
		
		UL.tabNavigation LI A:focus {
			outline: 0;
		}        
        
		div.tabs > div {
			padding: 5px;
			margin-top: 3px;
			border: 5px solid #333;
		}
		
		div.tabs > div h2 {
			margin-top: 0;
		}
 
		#first {
		    background-color: #f00;
		}
 
		#second {
		    background-color: #0f0;
		}
 
		#third {
		    background-color: #00f;
		}
		        
    </style>


    <script type="text/javascript">

        $(document).ready(function() {

            $('div.tabs').tabs();

            $.fn.autoUpdate('<%= Url.Action( "AjaxTags", "Tags" ) %>');

            $.fn.timer(5000, function(timer) {
                $('#dataDisplay').prepend('hello some text goes here<br/>').fadeIn('slow');
                timer.stop();
            });

            $("input#locationName").autocomplete('<%= Url.Action( "AjaxFindLocationNames", "Locations" ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });
            $("input#tagName").autocomplete('<%= Url.Action( "AjaxFindTags", "Tags" ) %>', { minChars: 2, multiple: true, multipleSeparator: " " });

            //            var hello = $('#location-value').html();
            //            hello = hello.replace('hello', 'never');
            //            $('#location-value').html(hello);

            $('#location-edit').hide();

            $('a#show-location-edit').click(function() {
                $('#location-value').hide();
                $('#show-location-edit').hide();
                $('#location-edit').fadeIn();
                $('#location-edit').focus();
                return false;
            });

            $('input#location-edit').blur(function() {
                $('#location-edit').hide();
                //need to pass the value from #location-edit to #location-value
                $('#location-value').html($('#location-edit').val()).fadeIn();
                $('#show-location-edit').fadeIn();
                return false;
            });


            $("ul#listselect-click li").click(function() {
                //var clicked = $(this).attr("id");
                $("ul#listselect-click li").each(function() {
                    $(this).css("color", "black");
                });
                $(this).css("color", "red");
                return false;
            });

            $("ul#toggleselect li").toggle(
                    function() {
                        $(this).css("color", "red");
                    },
                    function() {
                        $(this).css("color", "");
                    }
                );


            var hightlight = "ul#highlight li";

            $(hightlight).click(function() {
                var thisClicked = $(this).text();

                $(hightlight).each(function() {
                    if (thisClicked == $(this).text() && $(this).css("color") != "red") {
                        $(this).css("color", "red");
                    } else {
                        $(this).css("color", "");
                    }
                });

            });

            $('p.para').highlightlink('ipsum', 'highlightedlink');
            $('p.para').highlight('dolor');

            $('.tip').truncate({ moreText: "some more please" });

            $(".example8").colorbox({ width: "50%", inline: true, href: "#inline_example1" });

            //$(".myMap").html("arse");
            
        });

        function basicMap(latitude, longitude, title) {
            $(this).html("bum");
            alert("hello");
        }
        
    </script> 
            
</head>
<body>
    <div>
        <h2><%= Model.PageTitle %></h2>
        
        <p><strong>Popup</strong></p>
        <p><a class="example8" href="#">Inline HTML</a></p> 

		<!-- This contains the hidden content for inline calls --> 
		<div style="display:none"> 
			<div id="inline_example1" style="padding:10px; background:#fff;"> 
			<p><strong>Map</strong></p> 
			
			<a href="#" onclick="basicMap(3,3,'hello')" class="myMap">Click me</a>
			<p onload="basicMap(3,3,'hello')"></p> 
			</div> 
		</div> 
		        
        <p><strong>Auto-update 1</strong></p>
        <div id="updatenotice"></div>
        <div id="updatetext"></div>

        <p><strong>Auto-update 2</strong></p>
        <div id="dataDisplay">this will update every 5 secs</div> 
                
        <p><strong>Autocomplete</strong><br />
        Location: <%= Html.TextBox( "locationName", null, new { size = 10 } )%><br />
        Tag: <%= Html.TextBox( "tagName", null, new { size = 10 } )%><br />
        </p>
        
        <p><strong>Edit in-place</strong><br />
        <span id="location-value">hello</span><input id="location-edit" value="hello" /> <a href="#" id="show-location-edit">Edit</a>
        </p>
        
        <p><strong>List select - click function</strong></p>
        
        <ul id="listselect-click">
        <li>First</li>
        <li>Second</li>
        <li>Third</li>
        </ul>        

        <p><strong>List select - toggle function</strong></p>
        
        <ul id="toggleselect">
        <li>One</li>
        <li>More</li>
        <li>Time</li>
        </ul>          
        
        <p><strong>List select - highlight one row at a time</strong></p>
        
        <ul id="highlight">
        <li>One</li>
        <li>More</li>
        <li>Time</li>
        </ul>        
            
        <p><strong>Highlight text</strong></p>        
        <p class="para">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
        </p>
        <p class="para">
            Quisque bibendum sem ut lacus. Integer dolor ullamcorper libero.
            Aliquam rhoncus eros at augue. Suspendisse vitae mauris dum ipsum.
        </p>        

        


        <p><strong>Tabs</strong></p>  
                
        <div class="tabs"> 
            <ul class="tabNavigation"> 
                <li><a href="#first">First</a></li> 
                <li><a href="#second">Second</a></li> 
                <li><a href="#third">Third</a></li> 
            </ul> 
            <div id="first"> 
                <h2>First</h2> 
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> 
            </div> 
            <div id="second"> 
                <h2>Second</h2> 
                <p>asdf ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> 
            </div> 
            <div id="third"> 
                <h2>Third</h2> 
                <p>Loraddddsem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> 
            </div> 
        </div> 

        <p><strong>Truncate</strong></p>  
        
        <div class="tip" style="width:200px;background-color:#ccc;padding:10px;">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam fringilla, purus a ultrices blandit,
            odio ante scelerisque neque, vitae imperdiet odio velit ac nisl. Sed tortor metus, placerat condimentum,
            feugiat in, feugiat adipiscing, mi. Donec pulvinar sem vitae leo. Vestibulum eget lectus et ligula hendrerit
            pharetra. Sed porta justo ac nisl. Aliquam nisi erat, pellentesque sed, sagittis eu, fringilla sit amet,
            dolor. Nam ac mi. Pellentesque pede purus, mattis aliquet, semper nec, cursus a, orci. Duis bibendum nibh
            ac massa. Integer eu tortor. Aenean convallis quam at nunc. Nunc mollis tincidunt nisi. Suspendisse mauris
            odio, iaculis ut, feugiat vitae, ultrices in, tortor. Quisque at elit. In hac habitasse platea dictumst.
        </div>
        
    </div>
</body>
</html>
