/* all initial functionality goes here - like window.onload() */

$(document).ready(function() {

    convertLinksToLowerCase();
    replaceAnchorTextWithIcon();
    
    var path = location.pathname;
    var first = path.split('/')[1];
    var second = path.split('/')[2];

    //alert(path == "/posts/add");

    //alert($('#nav ul a[href$="/vacancies/igh"]').parent().parent().html());

    if (path) {
        if (path == "/posts/add" || path == "/home/about") {
            $('#topnavmenu li a[href*="' + path + '"]').parent().attr('class', 'current-page');
        }
        else {
            $('#topnavmenu li a[href$="/' + first + '"]').parent().attr('class', 'current-page');
        }
    }


    $(".fancy-field").focus(function() {
        $(this).parent().parent().addClass("field-selected");
        $(this).parent().parent().find(".field-info").css("display", "block");
    });

    $(".fancy-field").blur(function() {
        $(this).parent().parent().removeClass("field-selected");
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
General javascript functions
*/

function replaceAnchorTextWithIcon() {

    //$("a.icon").each(function() {
        //var anchorText = this.text();
        //this.text("<img src='/assets/images/" + anchorText + "-icon.png' width='25' height='25' alt='" + anchorText + "' />");
        //this.text("arse");
    //});

//    $("a.icon").each(function() {
//        this.text("arse");
//    });

//    $('h2.img').each(function() {
//        string = $(this).text();
//        filename = string.toLowerCase().replace(/ /g, '-').replace(/([^0-9a-z-])/g, '');
//        $(this).html('<img src="/assets/images/' + filename + '-icon.png" width="25" height="25" alt="' + string + '" />');
//    });

//    $('a.alt').each(function() {
//        $(this).html('Hello');
//    });

    $('a.icon').each(function() {
        string = $(this).text();
        filename = string.toLowerCase().replace(/ /g, '-').replace(/([^0-9a-z-])/g, '');
        $(this).html('<img src="/assets/images/' + filename + '-icon.png" alt="' + string + '" />');
    });
        
    //$("a.icon").text("arse");
}

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