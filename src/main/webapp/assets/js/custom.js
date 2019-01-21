$(document).ready(function() {

    //Show Content
    $('.show-content').click(function(e) {
        $(this).toggleClass('minus').parents('.block-title').siblings('.block-content').slideToggle();


    });

    //Show Subnav
    $('.sidebar-nav li.parent>a').click(function(e) {
        e.preventDefault();
        $(this).next('ul').slideToggle();
        $(this).parent().toggleClass('open');
        $(this).parent('.parent').siblings().find('.sub-nav').slideUp();
        $(this).parent('.parent').siblings().removeClass('open');


    });

    //Marquee 
    if (window.innerWidth > 980) {
        timeDuration = 17000
    } else {
        timeDuration = 10000
    }

    $('.marquee').marquee({
        duration: 15000,
        delayBeforeStart: 1000,
        duplicated: false,
        allowCss3Support: true,
        startVisible: false

    });

    if ($('.equalHeightParent').length) {
        var maxHeight = $('.equalHeightParent .alerts-table.equalHeightChild').height();
        $('.equalHeightChild:not(.alerts-table) .bg-white ').height(maxHeight);
    }
    if ($('.heightEqualizerStrip'.length)) {
        $('.heightEqualizerStrip').each(function(index) {
            var thiparentWidth = $(this).parents('.bg-white').outerWidth(true);
            // $(this).width(thiparentWidth);

        })

    }

    //Custom Scroll//
    $(".scroll").mCustomScrollbar({
        scrollbarPosition: 'inside',
        updateOnContentResize: true,
        // scrollInertia: 0
        /*mouseWheel:{ preventDefault: true }*/
    });
    //Menu Button 
    $('.menu-btn').click(function() {
        $('body').toggleClass('nav-open');

    })

    //Accordion//
    $('.accordion > li .accord-head').click(function() {
        if (!$(this).next('.accord-content').is(':visible')) {
            $(this).addClass('open').next('.accord-content').slideDown();
            $(this).parents('.accord-item').siblings().find('.accord-head').removeClass('open').next('.accord-content').slideUp();
        } else {
            $(this).removeClass('open').next('.accord-content').slideUp();
        }
    });

    //Bootstrap Tooltip//
    $('[data-toggle="tooltip"]').tooltip()

    // usage:
    $(window).smartresize(function() {

        if ($('.equalHeightParent').length) {

            var maxHeight = $('.equalHeightParent .alerts-table.equalHeightChild').height();
            $('.equalHeightChild:not(.alerts-table) .bg-white ').height(maxHeight);
        }
        if ($('.heightEqualizerStrip'.length)) {
            $('.heightEqualizerStrip').each(function(index) {
                var thiparentWidth = $(this).parents('.bg-white').outerWidth(true);
                // $(this).width(thiparentWidth);

            })

        }
    });

    //Home questions count length 
    if ($('.questions-counter-block .counter-yellow figure .count').length) {
        var len = $('.questions-counter-block .counter-yellow figure .count').html().length;
        var customClass = "length" + len
        $('.questions-counter-block .counter-yellow figure .count').addClass(customClass);

    }
    //Star Toggle//
    $('.star-toggle').click(function(e) {
        e.preventDefault();
        $(this).toggleClass('on');
        $(this).find('i').tooltip('destroy');
        $(this).find('i').tooltip();

        // if ($(this).hasClass('on')) {
        //     $(this).removeClass('on');
        //     $(this).find('i').tooltip('destroy');
        //     $(this).find('i').tooltip();

        // } else {
        //     $(this).addClass('on');
        //     $(this).find('i').tooltip('destroy');
        //     $(this).find('i').tooltip();
        // }
    });
    //Tree List //
    /*$('.treeList .parent>h4').click(function() {
        $(this).parent('li').toggleClass('open');
        $(this).next('ul').toggle();
    });*/
    $(document).on("click", ".treeList .parent>h4", function() {
        $(this).parent('li').toggleClass('open');
        $(this).next('ul').toggle();
    })


});





(function($, sr) {

    // debouncing function from John Hann
    // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
    var debounce = function(func, threshold, execAsap) {
            var timeout;

            return function debounced() {
                var obj = this,
                    args = arguments;

                function delayed() {
                    if (!execAsap)
                        func.apply(obj, args);
                    timeout = null;
                };

                if (timeout)
                    clearTimeout(timeout);
                else if (execAsap)
                    func.apply(obj, args);

                timeout = setTimeout(delayed, threshold || 100);
            };
        }
        // smartresize 
    jQuery.fn[sr] = function(fn) { return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery, 'smartresize');