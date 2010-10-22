(function($) {

    $.fn.sendemailpopup = function(options) {

        var defaults = {
            formdiv_obj: $('#sendEmailFormDiv'),
            form_obj: $('#sendEmailFormDiv > form'),
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

        opts.submit_form_obj.click(function() {
            submitform(opts);
            alert('ths is Fired multiple times');
            return false;
        });
        
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

            $('body').click(function() {
                if (o.formdiv_obj.is(':visible')) {
                    closeform(o);
                    return false;
                }
            });

            o.formdiv_obj.click(function(event) {
                event.stopPropagation();
            });

            //            o.formdiv_obj.blur(function() {
            //                closeform(o);
            //                return false;
            //            });



        });
    };

    function closeform($options) {
        $options.formdiv_obj.slideUp('slow');
    };

    function blurform($options) {
        if ($options.textfield_obj.val() == $options.textfield_defaulttext) {
            $options.formdiv_obj.slideUp('slow');
        }
    };

    function openform($object, $options) {
        if ($options.formdiv_obj.is(':hidden')) {

            //reset the form if it has previously been submitted
            $options.form_obj.prev().prev().hide();
            $options.form_obj.show();
            
            var cellPosition = $object.position();
            var horizontalPosition = cellPosition.left - 300;
            var verticalPosition = cellPosition.top + $object.outerHeight();

            $options.formdiv_obj.css({ top: verticalPosition, left: horizontalPosition }).slideDown('slow');
            $options.hiddenfield_obj.val($object.prev().html());
            $options.textfield_obj.val($options.textfield_defaulttext).select().focus();
            $options.message_obj.show().html("<b>Email post...</b>" + $object.prev().prev().html());

        }
        else {
            $options.formdiv_obj.slideUp('slow');
        }
    };

    function submitform($options) {

        //Hide any existing error messages
        $(".error").hide();

        //Get the data from all the fields
        var postId = $options.hiddenfield_obj;
        var emailAddress = $options.textfield_obj;

        if (postId.val() == '') {
            postId.after('<span class="error">No id for some reason</span>');
            return false;
        }

        if (emailAddress.val() == '') {
            emailAddress.after('<span class="error">You forgot to enter the email address to send to</span>');
            return false;
        }

        if (!isValidEmailAddress(emailAddress.val())) {
            emailAddress.after('<span class="error">Please enter a valid email address</span>');
            return false;
        }

        //disabled all the text fields
        //$('input[type="text"]').attr('disabled', 'true');
        //$('input[type="submit"]').attr('disabled', 'true');

        //hide the form object
        $options.form_obj.hide();
        
        //show loading graphic immediately before form object button
        $options.form_obj.prev().show();

        //alert($options.form_obj.attr('action'));


        
        //start the ajax form post
        $.post(
            $options.form_obj.attr('action'),
            { postId: postId.val(), emailAddress: emailAddress.val() },
            //return html is either 1 (success) or 0 (failure)
            function(html) {
                if (html == 1) {
                    //show the success message and hide the loading graphic
                    $options.form_obj.prev().prev().show();
                    $options.form_obj.prev().hide();
                    //remove the form
                    $options.formdiv_obj.delay(1000).slideUp('slow');
                    
                } else {
                    alert('Sorry, an unexpected error occurred. Please try again later.');
                }
            }
        );

        //cancel the submit button default behaviours
        return false;
    };



})(jQuery);