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