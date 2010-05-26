﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<DefaultViewModel>" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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
    <script src="<%= Url.Script( "jquery.alerts.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.customdata.js" )%>" type="text/javascript"></script>
    <script src="<%= Url.Script( "jquery.jsonviewer.js" )%>" type="text/javascript"></script>
    
    <script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>

    <link href="<%= Url.Stylesheet( "jquery.autocomplete.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "jquery.colorbox.css" )%>" rel="stylesheet" type="text/css"/>
    <link href="<%= Url.Stylesheet( "jquery.alerts.css" )%>" rel="stylesheet" type="text/css"/>
        
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

            $("#launchColorbox").colorbox({
                width: "50%",
                inline: true,
                href: "#colorboxContent",
                onComplete: function() { $("#colorboxMap").gmap({ latitude: 50.9645, longitude: 0.553, zoom: 11, title: "arse" }); }
            });

            $("#map_canvas2").gmap({ latitude: 50.9645, longitude: 0.553, zoom: 14, title: "hello" });

            $("#alert_button").click(function() {
                jAlert('This is a custom alert box', 'Alert Dialog');
            });

            $("#confirm_button").click(function() {
                jConfirm('Can you confirm this?', 'Confirmation Dialog', function(r) {
                    jAlert('Confirmed: ' + r, 'Confirmation Results');
                });
            });

            $("#prompt_button").click(function() {
                jPrompt('Type something:', 'Prefilled value', 'Prompt Dialog', function(r) {
                    if (r) alert('You entered ' + r);
                });
            });

            $("#alert_button_with_html").click(function() {
                jAlert('You can use HTML, such as <strong>bold</strong>, <em>italics</em>, and <u>underline</u>!');
            });

            $(".alert_style_example").click(function() {
                $.alerts.dialogClass = $(this).attr('id'); // set custom style class
                jAlert('This is the custom class called &ldquo;style_1&rdquo;', 'Custom Styles', function() {
                    $.alerts.dialogClass = null; // reset to default
                });
            });

            $("#girls").find('a').each(function() {
                var obj = $(this);
                if (obj.attr('rel') == 'girl' && obj.attr('hotness') >= 9) {
                    obj.css("font-weight", "bold");
                }

            });

            $("#delete_link").click(function() {
                jAlert($(this).customdata());
                return false;
            });

            $("#btnFillList").click(function() {

                //this one works but is a potential security risk as it is using a GET request (this is OK for non-sensitve data though)  
                //                $.getJSON('<%= Url.Action( "JsonTagsGet", "Tags" ) %>', null, function(data) {
                //                    $("#tagList").fillSelect(data);
                //                });

                //this one works nicely - and seems to be easily the quickest!
                $.post('<%= Url.Action( "JsonTagsPost", "Tags" ) %>', null, function(data, textStatus) {
                    //data contains the JSON object
                    //textStatus contains the status: success, error, etc
                    $("#tagList").fillSelect(data);
                    //$('#basic_usage').jsonviewer({ json_name: 'tags', json_data: data });
                }, "json");

                //this also works - what a choice!!
                //                $.ajax({
                //                    type: "POST",
                //                    url: '<%= Url.Action( "JsonTagsPost", "Tags" ) %>',
                //                    data: {},
                //                    contentType: "application/json; charset=utf-8",
                //                    dataType: "json",
                //                    success: function(data) {
                //                        $("#tagList").fillSelect(data);
                //                    }
                //                });                

            });

            $("#btnClearList").click(function() {
                $("#tagList").clearSelect();
            });

            $.fn.clearSelect = function() {
                return this.each(function() {
                    if (this.tagName == 'SELECT')
                        this.options.length = 0;
                });
            }

            $.fn.fillSelect = function(data) {
                return this.clearSelect().each(function() {
                    if (this.tagName == 'SELECT') {
                        var dropdownList = this;
                        $.each(data, function(index, optionData) {
                            var option = new Option(optionData.Name, optionData.Id);
                            dropdownList.add(option);
                        });
                    }
                });
            }

            var myobj = { name: "Numbers", data: [1, 2, 3] };
            var test_object = {
                test_number: 1,
                test_string: "test string",
                test_string2: new String("another test string"),
                test_date: new Date(),
                test_boolean: true,
                test_array: [[1, 2, 3], [4, 5, 6]],
                test_object: { a: 1, b: "2", another: { internal_array: [{ fate: true }, 34]} }
            }
            $('#basic_usage').jsonviewer({ json_name: 'myobj', json_data: myobj });
            //$('#json_viewer').jsonviewer({ json_name: 'test', type_prefix: false, json_data: test_object });

            //json diff stuff
            //http://tlrobinson.net/projects/javascript-fun/jsondiff/
            //{"tag": [{"id":1,"name":"foot"}]}
            //{"tag": [{"id":1,"name":"foot"},{"id":2,"name":"ball"}]}

        });

        
        
    </script> 
            
</head>
<body>
    <div>
        <h2><%= Model.PageTitle %></h2>

        <p><strong>Client-side JSON</strong></p> 
        <div id="basic_usage"></div> 
        <div id="json_viewer"></div> 

        <p><strong>Server-side JSON</strong></p> 
        <input id="btnFillList" type="button" value="Fill Dropdown List" />
        <input id="btnClearList" type="button" value="Clear Dropdown" />
        <select id="tagList"></select>
        
        <p><strong>Custom data (attributes)</strong></p>
        <a id="delete_link" data-method="delete" data-remote="true" href="#">
          Unobtrusive delete link
        </a>        
        
        <p><strong>Custom attributes</strong></p>        
        <ol id="girls">
            <li><a rel="girdl" hotness="9.0">Sarah</a></li>
            <li><a rel="girl" hotness="8.0">Libby</a></li>
            <li><a rel="girl" hotness="9.0">Azure</a></li>
            <li><a rel="girl" hotness="8.5">Cindy</a></li>
        </ol>

        <p><strong>Dialog boxes</strong></p>
        <input id="alert_button" type="button" value="Show Alert" />
        <input id="confirm_button" type="button" value="Show Confirm" />
        <input id="prompt_button" type="button" value="Show Prompt" /> 
        <input id="alert_button_with_html" type="button" value="Show Alert" />
        <input id="style_1" class="alert_style_example" type="button" value="Style 1" /> 
        
        <p><strong>Map</strong></p>
        <div id="map_canvas2" style="width:400px;height:300px;border:1px solid black;"></div>
        
        <p><strong>Popup</strong></p>
        <p><a id="launchColorbox" href="#">Inline HTML</a></p> 

		<!-- This contains the hidden content for inline calls --> 
		<div style="display:none"> 
			<div id="colorboxContent" style="padding:10px; background:#fff;"> 
			<p><strong>Map</strong></p> 
			<div id="colorboxMap" style="width:400px;height:300px;border:1px solid black;"></div>
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
