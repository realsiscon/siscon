$(document).ready(function () {
    $('#nav > li > a').click(function () {
        if ($(this).attr('class') != 'active') {
            $('#nav li ul').slideUp();
            $(this).next().slideToggle();
            $('#nav li a').removeClass('active');
            $(this).addClass('active');
        } else {
            $('#nav li ul').slideUp();
            $('#nav li a').removeClass('active');
        }
    });

    setTimeout(function () {
        for (i = 1; i <= $('#nav li.pri').length + 1 ; i++) {
            if ($('#li' + i + ' li').length == 0) {
                $('#li' + i + ' a').css('background-image', 'none');
            }

            if ($('#li' + i + ' a').attr('class') == 'active') {
                $('#li' + i + ' ul').slideToggle();
            }
        }
    }, 500);
});



