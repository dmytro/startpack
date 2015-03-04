//= require jquery-1.9.1.min
//= require bootstrap.min
//= require material.min
//= require ripples.min

$(document).ready(function() {
    $(document).ready(function() {
        $.material.init();
    });

    $("#toTop").css("display", "none");
    $(window).scroll(function(){
        if($(window).scrollTop() > 0){
            $("#toTop").fadeIn("slow");
        }
        else {
            $("#toTop").fadeOut("slow");

        }
    });

    $("#toTop").click(function(){
        event.preventDefault();
        $("html, body").animate({ scrollTop:0 }, "slow");
    });
});
