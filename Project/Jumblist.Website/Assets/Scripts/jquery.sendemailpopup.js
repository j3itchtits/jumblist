(function($) {

    $.fn.sendemailpopup = function(options) {

        var defaults = {
            form_obj: $('#sendEmailForm'),
            close_form_obj: $('#closeSendEmailForm'),
            submit_form_obj: $('#submitSendEmailForm'),
            hiddenfield_obj: $('#postId'),
            message_obj: $('#messageSendEmailForm'),
            textfield_obj: $('#emailAddress'),
            textfield_defaulttext: 'Enter Email Address'
        };

        if (options.textfield_defaulttext.length == 0 || options.textfield_defaulttext == null) options.textfield_defaulttext = defaults.textfield_defaulttext;

        // Compile default options and user specified options.
        var opts = $.extend(defaults, options);


        return this.each(function() {

            var obj = $(this);
            var o = $.meta ? $.extend({}, opts, obj.data()) : opts;

            obj.click(function() {
                openform(obj, o);
                return false;
            });

            o.close_form_obj.click(function() {
                closeform(o);
                return false;
            });

            o.textfield_obj.blur(function() {
                blurform(o);
                return false;
            });

            o.submit_form_obj.click(function() {
                submitform(o);
                return false;
            });

        });
    };

    function closeform($options) {
        $options.form_obj.slideUp('slow');
    };

    function blurform($options) {
        if ($options.textfield_obj.val() == $options.textfield_defaulttext) {
            $options.form_obj.slideUp('slow');
        }
    };

    function openform($object, $options) {
        if ($options.form_obj.is(':hidden')) {

            var cellPosition = $object.position();
            var horizontalPosition = cellPosition.left - 300;
            var verticalPosition = cellPosition.top + $object.outerHeight();

            $options.form_obj.css({ top: verticalPosition, left: horizontalPosition }).slideDown('slow');
            $options.hiddenfield_obj.val($object.prev().html());
            $options.textfield_obj.val($options.textfield_defaulttext).select().focus();
            $options.message_obj.show().html("<b>Email post...</b>" + $object.prev().prev().html());

        }
        else {
            $options.form_obj.slideUp('slow');
        }
    };

    function submitform($options) {
        $options.message_obj.show().html("<b>Sending emails...</b>");
        setTimeout('$options.form_obj.slideUp("slow")', 2000);
        //$options.submit_form_obj.parent().submit();
    };

    function enterkeypress($e, $options) {
        if (($e.which && $e.which == 13) || ($e.keyCode && $e.keyCode == 13)) {
            submitform($options);
            return false;
        } else {
            return true;
        }
    };

})(jQuery);