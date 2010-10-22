(function($) {

    $.fn.showedithide = function(options) {

        var defaults = {
        span_obj: $('#span-value'),
        input_obj: $('#locationRadius')
        };


        // Compile default options and user specified options.
        var opts = $.extend(defaults, options);


        return this.each(function() {

            var obj = $(this);
            var o = $.meta ? $.extend({}, opts, obj.data()) : opts;

            obj.click(function() {
                o.span_obj.hide();
                obj.hide();
                o.input_obj.fadeIn().focus();
                return false;
            });

            o.input_obj.blur(function() {
                o.input_obj.hide();
                //need to pass the value from input to span
                o.span_obj.html(o.input_obj.val()).fadeIn();
                obj.fadeIn();
                return false;
            });
            
            


        });
    };



})(jQuery);