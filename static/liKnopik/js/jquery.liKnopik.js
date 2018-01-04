/*
 * jQuery liKnopik v 2.1
 *
 * Copyright 2013, Linnik Yura | LI MASS CODE | http://masscode.ru
 * http://masscode.ru/index.php/k2/item/47-liknopik
 * Free to use
 * 
 * Last Update 30.03.2014
 */
(function($){
	$.fn.liKnopik = function(params){
		var p = $.extend({
			topPos:'center',	//'center' или целое число в пикселях
			sidePos:'left',		//'left' или 'right'
			startVisible:false	//true или false, Если "true" - содержание кнопки по умолчанию открыто
		}, params);
		return this.each(function(){
			var 
			knopik = $(this).addClass('knopikWrap'),
			knopikIndex = 'kn_'+$('.knopikWrap').index(knopik),
			knopikBut = $('.knopikBut',knopik);
			knopikBut.wrapInner('<div class=knopikButText>').wrapInner('<div class=knopikButPos>');
			var
			knopikButText = $('.knopikButText',knopik),
			knopikButPos = $('.knopikButPos',knopik),
			knopikCont = $('.knopikCont',knopik),
			knopikClone = knopik.clone().css({left:'-9999px',top:'-9999px',position:'absolute'}).appendTo('body'),
			knopikH = knopikClone.height(),
			knopikW = knopikClone.width(),
			knopikButTextH = knopikButText.outerHeight(),
			knopikButTextW = knopikButText.outerWidth(),
			knS = (knopikButTextW - knopikButTextH),
			knopikContH = knopikCont.outerHeight(),
			startVisible = p.startVisible;
			knopikClone.remove();
			//Читаем куку
			if($.cookie(knopikIndex)){
				startVisible = $.cookie(knopikIndex);
			}
			
			//Закрываем кнопку по умолчанию
			if(startVisible == 'false' || startVisible == false){
				knopik.addClass('hidden');
			}

			//Устанавливаем вертикальное положение кнопки
			if(!parseFloat(p.topPos)){
				knopik.css({marginTop:-knopikH/2});
			}else{
				knopik.css({top:parseFloat(p.topPos),marginTop:'0'});	
			}
			
			//Присваиваем расчетные стили
			knopik.css({width:knopikW});
			knopikBut.css({marginTop:-knopikButTextW/2});
			if(p.sidePos == 'right'){
				////Устанавливаем стили для кнопки справа
				knopik.addClass('sidePosRight').css({right:-knopikW,left:'auto'});
				knopikButText.rotate(-90);
				knopikButPos.css({marginTop:knS});
				knopikBut
				.css({height:knopikButTextW,width:knopikButTextH,left:0})
				.animate({left:-knopikButTextH},function(){
					if(!knopik.is('.hidden')){
						knopik.css({right:-knopikW}).animate({right:'0'});
					}	
				});	
			}else{
				////Устанавливаем стили для кнопки слева
				knopik.css({left:-knopikW,right:'auto'});
				knopikButText.rotate(-90);
				knopikButPos.css({marginTop:knS});
				knopikBut
				.css({height:knopikButTextW,width:knopikButTextH,right:0})
				.animate({right:-knopikButTextH},function(){
					if(!knopik.is('.hidden')){
						knopik.css({left:-knopikW,right:'auto'}).animate({left:'0'});
					}
				});
			}
			
			//Поворот кнопки для IE 7 и 8 версии
			var ua = navigator.userAgent.toLowerCase();
			if(ua.indexOf("msie 8") != -1 || ua.indexOf("msie 7") != -1){
				knopikButPos.css({marginTop:knS/2,marginLeft:-knS/2});
			}

			//Устанавливаем на кнопку событие "клац"
			knopikBut.on('click',function(){
				if(p.sidePos == 'right'){
					if(knopik.is('.hidden')){
						$.cookie(knopikIndex,'true');
						knopik.removeClass('hidden').css({right:-knopikW,left:'auto'}).animate({right:'0'});
					}else{
						$.cookie(knopikIndex,'false');
						knopik.addClass('hidden').css({right:0,left:'auto'}).animate({right:-knopikW});		
					}
				}else{
					if(knopik.is('.hidden')){
						$.cookie(knopikIndex,'true');
						knopik.removeClass('hidden').css({left:-knopikW,right:'auto'}).animate({left:'0'});
					}else{
						$.cookie(knopikIndex,'false');
						knopik.addClass('hidden').css({right:'auto',left:0}).animate({left:-knopikW});		
					}
				}
			});
		});
	};
})(jQuery);