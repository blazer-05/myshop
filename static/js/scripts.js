var mainImage = $("#mainImage");
$(".item-gallery img").hover(function(){
   var src = $(this).attr("src");
    $("#mainImage").attr("src",src);
});
cackle_widget = window.cackle_widget || [];
cackle_widget.push({widget: 'Comment', id: 51004});
(function() {
    var mc = document.createElement('script');
    mc.type = 'text/javascript';
    mc.async = true;
    mc.src = ('https:' == document.location.protocol ? 'https' : 'https') + '://cackle.me/widget.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(mc, s.nextSibling);
})();

$(document).ready(function(){
$('.owl-carousel').owlCarousel({
    animateOut: 'slideOutDown',
    animateIn: 'flipInX',
    items:3,
    margin:35,
    autoplay:true,
    smartSpeed:450,
    loop:true,
     responsiveClass:true,
    responsive:{
        0:{
            items:1,
            margin:5,
            autoplay:true,
        },
        600:{
            items:1,
            margin:5,
            autoplay:true,
        },
        1000:{
            items:3,
            autoplay:true,
            
            
        }
    }
    
});
    
$('.action-btn, .f-btn').on('click',function(){
$('.overlay').css({"visibility": "visible"});
$('.form-pop-up').css({"visibility": "visible"});
});   
$('.overlay').on('click',function(){
 $('.overlay').css({"visibility": "hidden"});
$('.form-pop-up').css({"visibility": "hidden"});   
});    
    
});

(function($){				
    jQuery.fn.lightTabs = function(options){
        
        var createTabs = function(){
            tabs = this;
            i = 0;
            
            showPage = function(i){
                $(tabs).children("div").children("div").hide();
                $(tabs).children("div").children("div").eq(i).show();
                $(tabs).children("ul").children("li").removeClass("active");
                $(tabs).children("ul").children("li").eq(i).addClass("active");
            }
            
            showPage(0);				
            
            $(tabs).children("ul").children("li").each(function(index, element){
                $(element).attr("data-page", i);
                i++;                        
            });
            
            $(tabs).children("ul").children("li").click(function(){
                showPage(parseInt($(this).attr("data-page")));
            });				
        };		
        return this.each(createTabs);
    };	
})(jQuery);

$(document).ready(function(){
    $(".tabs").lightTabs();
    $(".item-desc-tabs").lightTabs();
});

jQuery(".acc-faq-block-title").hover(function(){
                 jQuery(this).children('.acc-img').css('background-color','#bc0909');
        }, function(){
                jQuery(this).children('.acc-img').css('background-color','#e96656');
        });
        jQuery(".acc-faq-block-title").click(function(){
               if(jQuery(this).attr('rel') == 'show'){        
                       jQuery(this).next().slideUp('200');
                       jQuery(this).children().css('background-position-x','1px');
                       jQuery(this).attr('rel','hide');
               }else{
                       //if(jQuery(".acc-faq-block-title").attr('rel') == 'show'){
                                jQuery(".acc-faq-block-title").attr('rel','hide');
                               jQuery(".acc-faq-block-title").next().slideUp('200');
                               jQuery(".acc-faq-block-title").children().css('background-position-x','1px');
                              
                       //}
                       jQuery(this).next().slideDown('200');
                        jQuery(this).children().css('background-position-x','-24px');
                        jQuery(this).attr('rel','show');
               }
        });
$(window).on('load', function() { 
                var open = false;
                 
           
                function resizeMenu() {
                    if ($(this).width() <= 1024) {
                      
                        if (!open) {
                            $("#header-wrap").hide();
							
                        }
                      
                        $("#mobile-wrap").show();
                        
                    }
                    else if ($(this).width() > 1024) {
                        if (!open) {
                            $("#header-wrap").show();
							
                        }
                        $("#mobile-wrap").hide();
                       
                    }
                }

                function setupMenuButton() {
                    $("#menu-button").click(function(e) {
                        e.preventDefault();

                        if (open) {
                            $(".mobile-navigation").slideUp();
                            $("#hamburger").toggleClass("is-active");
                        }
                        else {
                            $(".mobile-navigation").slideDown();
                            $("#hamburger").toggleClass("is-active");
                        }
                        open = !open;
                    });
                }


                $(window).resize(resizeMenu);

                resizeMenu();
                setupMenuButton();
            }); 
