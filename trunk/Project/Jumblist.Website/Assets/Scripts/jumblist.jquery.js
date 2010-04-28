
$(document).ready(function() {
    convertLinksToLowerCase();
});

function convertLinksToLowerCase() {
    $("a").each(function() {
        this.href = this.href.toLowerCase();
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