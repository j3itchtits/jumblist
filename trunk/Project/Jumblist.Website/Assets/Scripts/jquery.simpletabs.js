/*
simpletabs
This plugin will set-up some nice tabs.
http://jqueryfordesigners.com/jquery-tabs/
*/

jQuery.fn.simpletabs = function(options) {

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