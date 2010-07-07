/* all initial functionality goes here - like window.onload() */

$(document).ready(function() {

convertLinksToLowerCase();

$(".fancy-field").focus(function() {
    $(this).parent().parent().addClass("selected");
    $(this).parent().parent().find(".field-info").css("display", "block");
});

$(".fancy-field").blur(function() {
    $(this).parent().parent().removeClass("selected");
    $(this).parent().parent().find(".field-info").css("display", "none");
});    
});


/*
ajax json etc
http://encosia.com/2008/03/27/using-jquery-to-consume-aspnet-json-web-services/
*/

/*
popup modal dialog boxes etc
http://choosedaily.com/1178/15-jquery-popup-modal-dialog-plugins-tutorials/
http://colorpowered.com/colorbox/core/example1/index.html
*/


/*
truncate
This plugin will let you truncate it to a specified length, with a link to expand it to view it's full content.
http://blog.jeremymartin.name/2008/02/building-your-first-jquery-plugin-that.html
*/

jQuery.fn.truncate = function(options) {

    var defaults = {
        length: 300,
        minTrail: 20,
        moreText: "more",
        lessText: "less",
        ellipsisText: "..."
    };
    
    var options = $.extend(defaults, options);

    return this.each(function() {
        obj = $(this);
        var body = obj.html();

        if (body.length > options.length + options.minTrail) {
            var splitLocation = body.indexOf(' ', options.length);
            if (splitLocation != -1) {
                // truncate tip
                var splitLocation = body.indexOf(' ', options.length);
                var str1 = body.substring(0, splitLocation);
                var str2 = body.substring(splitLocation, body.length - 1);
                obj.html(str1 + '<span class="truncate_ellipsis">' + options.ellipsisText + '</span><span  class="truncate_more">' + str2 + '</span>');
                obj.find('.truncate_more').css("display", "none");

                // insert more link
                obj.append('<div class="clearboth"><a href="#" class="truncate_more_link">' + options.moreText + '</a></div>');

                // set onclick event for more/less link
                var moreLink = $('.truncate_more_link', obj);
                var moreContent = $('.truncate_more', obj);
                var ellipsis = $('.truncate_ellipsis', obj);
                moreLink.click(function() {
                    if (moreLink.text() == options.moreText) {
                        moreContent.slideDown('slow');
                        moreLink.text(options.lessText);
                        ellipsis.css("display", "none");
                    } else {
                        moreContent.slideUp('fast');
                        moreLink.text(options.moreText);
                        ellipsis.css("display", "inline");
                    }
                    return false;
                });                
            }
        }
    });
};


/*
autoUpdate
This plugin will auto-update a div with content from an mvc actionresult request using AJAX.
http://stackoverflow.com/questions/220767/auto-refreshing-div-with-jquery
*/
jQuery.fn.autoUpdate = function(url, options) {

    var defaults = {
        requestType: "GET",
        requestTimeout: 3000,
        requestRepeatTime: 10000,
        requestSuccessRepeatTime: 10000,
        requestErrorRepeatTime: 10000,
        divNotice: "#updatenotice",
        divUpdate: "#updatetext"
    };

    var options = $.extend(defaults, options);

    $(options.divNotice).html('Loading..');
    $.ajax({
        type: options.requestType,
        url: url,
        timeout: options.requestTimeout,
        success: function(data) {
            $(options.divUpdate).html(data);
            $(options.divNotice).html('');
            window.setTimeout(function() {
                $.fn.autoUpdate(url);
            }, options.requestSuccessRepeatTime);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $(options.divNotice).html('Timeout contacting server..');
            window.setTimeout(function() {
                $.fn.autoUpdate(url);
            }, options.requestErrorRepeatTime);
        }
    });
}

/*
tabs
This plugin will set-up some nice tabs.
http://jqueryfordesigners.com/jquery-tabs/
*/

jQuery.fn.tabs = function(options) {

    var defaults = {
        tabNavigationElement: "ul.tabNavigation"
    };

    var options = $.extend(defaults, options);

    obj = $(this);

    var tabContainers = obj.children('div');
    //var tabContainers = $('div.tabs > div');
    tabContainers.hide().filter(':first').show();

    var links = obj.find(options.tabNavigationElement + ' a');

    links.click(function() {
        tabContainers.hide();
        tabContainers.filter(this.hash).show();
        links.removeClass('selected');
        $(this).addClass('selected');
        return false;
    }).filter(':first').click();
}


/*
gmap
This plugin gives you a basic google map.
http://awardwinningfjords.com/2009/07/22/google-maps-with-jquery.html
*/

jQuery.fn.gmap = function(options) {

    var defaults = 
    {
        latitude: 0,
        longitude: 0,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        title: ""
    };

    var options = $.extend(defaults, options);

    obj = $(this)[0];

    var latlng = new google.maps.LatLng(options.latitude, options.longitude);
    var myOptions = {
        zoom: options.zoom,
        center: latlng,
        mapTypeId: options.mapTypeId
    };
    //var map = new google.maps.Map(document.getElementById("map_canvas2"), myOptions);
    var map = new google.maps.Map(obj, myOptions);
    var marker = new google.maps.Marker({ position: latlng, map: map, title: options.title });
}






/*
General javascript functions
*/

function convertLinksToLowerCase() {
    $("a").not('.normalcase').each(function() {
        this.href = this.href.toLowerCase();
    });
}

function getTinyURL(longURL, success) {
    var API = 'http://json-tinyurl.appspot.com/?url=', URL = API + encodeURIComponent(longURL) + '&callback=?';
    $.getJSON(URL, function(data) {
        success && success(data.tinyurl);
    });
}

function mapPopup(latitude, longitude, title) {
    var w = window.screen.width;
    var h = window.screen.height;

    var popW = 440;
    var popH = 380;

    var leftPos = (w - (popW + 10)) / 2;
    var topPos = (h - (popH + 50)) / 2;

    newWindow = window.open('', 'map', 'width=' + popW + ', height=' + popH + ', top=' + topPos + ', left=' + leftPos + ', scrollbars=no');
    
    var tmp = newWindow.document;
    tmp.write('<html><head><title>Approximate location of ' + title + '</title>');
    tmp.write('<link rel="stylesheet" href="/assets/stylesheets/jumblist.css">');
    tmp.write('</head><body>');
    tmp.write('<div id="map_canvas" style="width:400px;height:300px;border:1px solid black;"></div>');
    tmp.write('<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"><\/script>');
    tmp.write('<script type="text/javascript">');
    tmp.write('var latlng = new google.maps.LatLng(' + latitude + ', ' + longitude + ');');
    tmp.write('var myOptions = { zoom: 14, center: latlng, mapTypeId: google.maps.MapTypeId.ROADMAP };');
    tmp.write('var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);');
    tmp.write('var marker = new google.maps.Marker({ position: latlng, map: map, title: "' + title + '" });');
    tmp.write('<\/script>');
    tmp.write('<p><a href="javascript:self.close()">close</a> the popup.</p>');
    tmp.write('</body></html>');
    tmp.close();
}

function basicPopup() {
    newwindow2 = window.open('', 'name', 'height=200,width=150');
    var tmp = newwindow2.document;
    tmp.write('<html><head><title>popup</title>');
    tmp.write('</head><body><p>this is once again a popup.</p>');
    tmp.write('<p><a href="javascript:alert(self.location.href)">view location</a>.</p>');
    tmp.write('<p><a href="javascript:self.close()">close</a> the popup.</p>');
    tmp.write('</body></html>');
    tmp.close();
    return false;
}

function initializeMap(latitude, longitude, title) {
    var latlng = new google.maps.LatLng(latitude, longitude);
    var myOptions = {
        zoom: 14,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    var marker = new google.maps.Marker({ position: latlng, map: map, title: title });
}