var Huaweimain = {
	share : function () {

		$(document)
		.on("click", ".js-print, .js-print-btn", function (e) {
			window.print();
			return false;
		})
		.on("click", ".js-email-btn", function (e) {
			var title = $(this).attr("data-email-title") || "";
			var body = $(this).attr("data-email-body") || "";
			var email = $(this).attr("data-email-addr") || "information@huawei.com";
			var url = $(this).attr("data-email-url") || document.URL;

			title = title.replace("{\u7f51\u9875title}", document.title);
			body = body.replace("{\u7f51\u9875title}", document.title);
			body = body.replace("{\u7f51\u9875url}", url);

			$(this).attr("href", "mailto:" + email + "?subject=" + title + " &body=" + body);

			//return false;
		})
		.on("click", ".js-share-item-btn", function (e) {
			var share_url_list = {
				"twitter" : "https://twitter.com/intent/tweet?url=%url%&text=%title%&via=huawei.com",
				"facebook" : "https://facebook.com/sharer.php?u=%url%&s=100&p[title]=%title%&p[summary]=%description%&p[url]=%url%&p[images][0]=%img%",
				"googleplus" : "https://plus.google.com/share?url=%url%",
				"weibo" : "http://service.weibo.com/share/share.php?url=%url%&title=%title%&pic=%img%&searchPic=true",
				"linkedin" : "http://www.linkedin.com/shareArticle?mini=true&url=%url%&title=%title%&summary=%description%&source=%url%",

			};
			var $this = $(this);
			var cmd = $this.attr("data-cmd");
			var title = $this.attr("data-share-title") || $this.parent().attr("data-share-title") || document.title;
			var description = $this.attr("data-share-description") || $this.parent().attr("data-share-description") || $("meta[name='description']").attr("content") || "";
			var img = $this.attr("data-share-img") || $this.parent().attr("data-share-img") || "";
			var url = $this.attr("data-share-url") || $this.parent().attr("data-share-url") || document.URL;
			description = encodeURIComponent(description);

			if (cmd == "weixin") {
				var weixin_qrcode = $("#js-weixin-qrcode");
				if (!weixin_qrcode.length)
					weixin_qrcode = $('<div id="js-weixin-qrcode" class="weixin-qrcode"/>').appendTo("body").wrap('<div class="hidden"/>');
				weixin_qrcode.children("table").remove().end().qrcode({
					render : "table",
					text : url
				}).fadeIn();
				$("#fancyboxHandle").attr("href", "#js-weixin-qrcode").trigger("click");

				return false;
			}
			title = encodeURIComponent(title);
			img = encodeURIComponent(img);
			url = encodeURIComponent(url);
			var share_url = share_url_list[cmd] || "";
			share_url = share_url.replace("%title%", title);
			share_url = share_url.replace("%description%", description);
			share_url = share_url.replace(/%url%/g, url);
			share_url = share_url.replace("%img%", img);

			window.open(share_url);
			return false;
		});
	},
	pageNav : function () {
		var timer = null;
		var timer2 = null;
		var navbgIndex = null;
 
		function navbg(){
		//	navbgIndex = $('#nav-cont .navlist a.navbg').attr("id") ; 
			$('#'+navbgIndex).addClass("navbg");
		}

		function navlisttitle() {
			$('#nav-want-cont-wrap .nav-cont-wrap').stop(true, true).slideUp();
			$('#nav-cont-wrap .nav-cont-wrap').stop(true, true).delay(300).slideDown();
			//$("#nav-cont .nav-list").css({
			//	"border-bottom" : "1px solid #eeeeee"
			//});
		}

		function navContslide() {
			//$('#nav-cont-wrap .nav-cont-wrap').slideUp();
			$('#nav-cont .navlist a').removeClass('active');
			$('#nav-cont .navlist a').removeClass('navbg');
			navbg();
			$('#nav-cont-wrap .nav-cont-wrap').find('ul').children().stop(true, false).slideUp(200, function (e) {
				//$('#nav-cont-wrap .nav-cont-wrap').find('ul').children('.nosub').hide();
				//$("#nav-cont .nav-list").css({
				//	"border-bottom" : ""
				//});
			});

			$("#nav-cont .nav-list").css({
				"border-bottom" : "none"
			});

		}
		$(document).on('mouseenter', '#nav-cont .navlist div', function (e) {
			clearTimeout(timer2);
			timer = setTimeout(function () {
					navlisttitle();
				}, 300);
		}).on('mouseleave', '#nav-cont .navlist div', function (e) {
			clearTimeout(timer);
			timer2 = setTimeout(function () {
					navContslide();
					$("#nav-cont-wrap").css({
						"border-top" : "none"
					});
					$("#nav-want-cont-wrap").css({
						"border-top" : "none"
					});

				}, 300);
		})
		.on('mouseenter', '#nav-cont .navlist a', function (e) {
			if(navbgIndex == null){
				navbgIndex = $('#nav-cont .navlist a.navbg').attr("id") ;
			}

			var $thisIndex = $('#nav-cont a').index(this);
			var $oldIndex = $('#nav-cont a').index($('#nav-cont a.active'));
			$('#nav-cont a.navbg').removeClass('navbg') ; 
			
			var delay_time = $('#nav-cont-wrap .nav-cont-wrap').find('ul').children(":visible").length === 0 ? 0 : 300;
			delay_time = 200;
			//alert($thisIndex)
			$('#nav-cont .navlist span.btn').removeClass('active');

			$(this).addClass('active').siblings().removeClass('active');
			$(this).addClass('navbg') ; 
			//$('#nav-cont-wrap .nav-cont-wrap').find('ul').css({'margin-left':"-=" + $thisIndex*100+'%'});
			//$('#nav-cont-wrap .nav-cont-wrap').find('ul').stop(true, true).animate({'margin-left':-$thisIndex*100+'%'});
			//			$("#nav-cont-wrap").css({"border-top":"1px solid #fff"});
			$("#nav-cont .nav-list").css({
				"border-bottom" : "1px solid #f4f3f3"
			});
			if ($oldIndex >= 0)
				$('#nav-cont-wrap .nav-cont-wrap').find('ul').children().eq($oldIndex).stop(true, true).delay(delay_time).slideUp();
			$('#nav-cont-wrap .nav-cont-wrap').find('ul').children().eq($thisIndex).stop(true, true).delay(delay_time).slideDown(300, function () {});

			if (!$(this).hasClass("js-no-menu"))
				return false;
			
		})
		
		.on('mouseenter', '#nav-cont .navlist span.btn', function (e) {
			return;
			e.stopPropagation();
			$(this).addClass('active');
			$('#nav-want-cont-wrap .nav-cont-wrap').stop(true, true).slideDown();

			//			$("#nav-want-cont-wrap").css({"border-top":"1px solid #fff"});
		})
		.on('mouseleave', '#nav-cont .navlist span.btn', function (e) {
			return;
			e.stopPropagation();
			$(this).removeClass('active');
			$('#nav-want-cont-wrap .nav-cont-wrap').delay(500).slideUp();
			//				$("#nav-want-cont-wrap").css({"border-top":"1px solid #fff"});

		})
		.on('mouseenter', '#nav-want-cont-wrap .nav-cont-wrap', function (e) {
			e.stopPropagation();
			$('#nav-cont .navlist span.btn').trigger("mouseenter");
		})
		.on('mouseleave', '#nav-want-cont-wrap .nav-cont-wrap', function (e) {
			e.stopPropagation();
			$('#nav-cont .navlist span.btn').trigger("mouseleave");
		})
		.on('mouseenter', '#nav-cont #nav-cont-wrap', function (e) {
			clearTimeout(timer2);
		})
		.on('mouseleave', '#nav-cont #nav-cont-wrap', function (e) {
			timer2 = setTimeout(function () {
					navContslide();
					//$("#nav-want-cont-wrap").css({"border-top":"none"});
				}, 500);
		});

	},
	marketData : function () {
		$(".tab_wrap a").click(function () {
			var $thisIndex = $(".tab_wrap a").index(this);
			$(this).addClass("on").siblings().removeClass("on");
			$(".markdatatype .tab_cont").eq($thisIndex).show().siblings(".tab_cont").hide();
		});
		$(".searchBox_cont a.slideBtn").click(function () {
			if ($(this).hasClass("on")) {
				$(this).removeClass("on");
			} else {
				$(this).addClass("on");
			}
			$(".marketing_classes .marketall_option").slideToggle();
		});
		$(".searchBox .btn").hover(
			function () {
			$(this).addClass("on");
		},
			function () {
			$(this).removeClass("on");
		});
	},
	videoSwitch : function () {
		//var $winW = $(window).width();
//		var $videoCount = 0;
//		var $videoWrapW = 0;
//		var $videoCuntNum = 0;
//		var $videoContNum = $(".solution_video_wrap").find("li").length;
		//alert($videoCuntNum);

		//function videoWrap() {
//			$winW = $(window).width();
//			if ($winW > 768) {
//				var $videoListWidth = $('.solution_video_cont').width();
//				var $videoSiple = $videoListWidth * 0.18;
//				$(".solution_video_wrap").find("li").width($videoSiple);
//				var $videoListW = $(".solution_video_wrap").find("li").outerWidth(true);
//				$('.solution_video_cont p.point_btn').css('left', ($videoListWidth - 75) / 2);
//				$(".solution_video_wrap .solution_video").width($videoListW * 4 - 40);
//				$videoCuntNum = ($videoContNum / 4) > (Math.floor($videoContNum / 4)) ? Math.floor($videoContNum / 4) : (Math.floor($videoContNum / 4) - 1);
//				var $videoContW = $(".solution_video_wrap").find("li").outerWidth(true);
//				$(".solution_video_wrap .video-list").width($videoContW * $videoContNum + 10);
//				$videoWrapW = $videoListW * 4;
//			} else {
//				$(".solution_video_wrap .solution_video").width($winW);
//				$(".solution_video_wrap").find("li").width($winW - 30);
//				var $videoListWidth = $('.solution_video_cont').width();
//				var $videoContW = $(".solution_video_wrap").find("li").outerWidth(true);
//				$(".solution_video_wrap .video-list").width($videoContW * $videoContNum);
//				$('.solution_video_cont p.video-num').css('left', ($videoListWidth - 225) / 2);
//			}
//		}

		//videoWrap();
		//$(window).resize(function () {
//			$videoCount = 0;
//			$videoWrapW = 0;
//			videoWrap();
//		});
//		$(".solution_video_cont a.next").click(function () {
//			$videoCount++;
//			if ($winW > 768) {
//				if ($videoCount >= $videoCuntNum) {
//					$(this).addClass('false');
//					if ($videoCount > $videoCuntNum) {
//						$videoCount = $videoCuntNum;
//						return false;
//					}
//				} else {
//					$(".solution_video_cont a.prev").removeClass('false');
//				}
//				$(".solution_video .video-list").animate({
//					"margin-left" : -$videoWrapW * $videoCount
//				});
//				$('.solution_video_cont p.point_btn span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			} else {
//				if ($videoCount > ($videoContNum - 1)) {
//					$videoCount = 0;
//				}
//				$(".solution_video .video-list").animate({
//					"margin-left" :  - ($winW + 10) * $videoCount
//				});
//				$('.solution_video_cont p.video-num span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			}
//		});
		//$(".solution_video_cont a.prev").click(function () {
//			$videoCount--;
//			if ($winW > 768) {
//				if ($videoCount <= 0) {
//					$(this).addClass('false');
//					if ($videoCount < 0) {
//						$videoCount = 0;
//						return false;
//					}
//				} else {
//					$(".solution_video_cont a.next").removeClass('false');
//				}
//				$(".solution_video .video-list").animate({
//					"margin-left" : -$videoWrapW * $videoCount
//				});
//				$('.solution_video_cont p.point_btn span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			} else {
//				if ($videoCount < 0) {
//					$videoCount = $videoContNum - 1;
//				}
//				$(".solution_video .video-list").animate({
//					"margin-left" :  - ($winW + 10) * $videoCount
//				});
//				$('.solution_video_cont p.video-num span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			}
//		});
		//$('.solution_video_cont .point_btn span').click(function () {
//			var $pointBtnlength = $('.solution_video_cont .point_btn span').length;
//			var $thisIndex = $('.solution_video_cont .point_btn span').index(this);
//			$videoCount = $thisIndex;
//			switch ($thisIndex) {
//			case 0:
//				$(".solution_video_cont a.prev").addClass('false');
//				$(".solution_video_cont a.next").removeClass('false');
//				break;
//			case $pointBtnlength - 1:
//				$(".solution_video_cont a.next").addClass('false');
//				$(".solution_video_cont a.prev").removeClass('false');
//				break;
//			default:
//				$(".solution_video_cont a.prev,.solution_video_cont a.next").removeClass('false');
//			}
//
//			$(this).addClass('on').siblings().removeClass('on');
//			$(".solution_video .video-list").animate({
//				"margin-left" : -$videoWrapW * $thisIndex
//			});
		//});
	},
	solutionProSwitch : function () {
		//var $winW = $(window).width();
//		var $videoCount = 0;
//		var $videoWrapW = 0;
//		var $videoCuntNum = 0;
//		var $videoContNum = $(".solution_product_wrap").find("li").length;
//		//alert($videoCuntNum);
//
//		function videoWrap() {
//			$winW = $(window).width();
//			var $videoListWidth = $('.solution_product_cont').width();
//			var $videoSiple = $videoListWidth * 0.18;
//			$(".solution_product_wrap").find("li").width($videoSiple);
//			var $videoListW = $(".solution_product_wrap").find("li").outerWidth(true);
//			$('.solution_product_cont p.point_btn').css('left', ($videoListWidth - 75) / 2);
//			$(".solution_product_wrap .solution_product").width($videoListW * 4 - 40);
//			$videoCuntNum = ($videoContNum / 4) > (Math.floor($videoContNum / 4)) ? Math.floor($videoContNum / 4) : (Math.floor($videoContNum / 4) - 1);
//			var $videoContW = $(".solution_product_wrap").find("li").outerWidth(true);
//			$(".solution_product_wrap .product-list").width($videoContW * $videoContNum + 10);
//			$videoWrapW = $videoListW * 4;
//		}
//
//		videoWrap();
//		$(window).resize(function () {
//			$videoCount = 0;
//			$videoWrapW = 0;
//			videoWrap();
//		});
//		$(".solution_product_cont a.next").click(function () {
//			$videoCount++;
//			if ($winW > 768) {
//				if ($videoCount >= $videoCuntNum) {
//					$(this).addClass('false');
//					if ($videoCount > $videoCuntNum) {
//						$videoCount = $videoCuntNum;
//						return false;
//					}
//				} else {
//					$(".solution_product_cont a.prev").removeClass('false');
//				}
//				$(".solution_product .product-list").animate({
//					"margin-left" : -$videoWrapW * $videoCount
//				});
//				$('.solution_product_cont p.point_btn span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			} else {
//				if ($videoCount > ($videoContNum - 1)) {
//					$videoCount = 0;
//				}
//				$(".solution_product .video-list").animate({
//					"margin-left" :  - ($winW + 10) * $videoCount
//				});
//				$('.solution_product_cont p.product-num span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			}
//		});
//		$(".solution_product_cont a.prev").click(function () {
//			$videoCount--;
//			if ($winW > 768) {
//				if ($videoCount <= 0) {
//					$(this).addClass('false');
//					if ($videoCount < 0) {
//						$videoCount = 0;
//						return false;
//					}
//				} else {
//					$(".solution_product_cont a.next").removeClass('false');
//				}
//				$(".solution_product .product-list").animate({
//					"margin-left" : -$videoWrapW * $videoCount
//				});
//				$('.solution_product_cont p.point_btn span').eq($videoCount).addClass('on').siblings().removeClass('on');
//
//			} else {
//				if ($videoCount < 0) {
//					$videoCount = $videoContNum - 1;
//				}
//				$(".solution_video .video-list").animate({
//					"margin-left" :  - ($winW + 10) * $videoCount
//				});
//				$('.solution_video_cont p.video-num span').eq($videoCount).addClass('on').siblings().removeClass('on');
//			}
//		});
//		$('.solution_product_cont .point_btn span').click(function () {
//			var $pointBtnlength = $('.solution_product_cont .point_btn span').length;
//			var $thisIndex = $('.solution_product_cont .point_btn span').index(this);
//			$videoCount = $thisIndex;
//			switch ($thisIndex) {
//			case 0:
//				$(".solution_product_cont a.prev").addClass('false');
//				$(".solution_product_cont a.next").removeClass('false');
//				break;
//			case $pointBtnlength - 1:
//				$(".solution_product_cont a.next").addClass('false');
//				$(".solution_product_cont a.prev").removeClass('false');
//				break;
//			default:
//				$(".solution_product_cont a.prev,.solution_product_cont a.next").removeClass('false');
//			}
//
//			$(this).addClass('on').siblings().removeClass('on');
//			$(".solution_product_cont .product-list").animate({
//				"margin-left" : -$videoWrapW * $thisIndex
//			});
//		});
	},
	groupBannerSwitch : function () {
		var $bannerCount = 0;
		var $bannerNum = $('.banner_list li').length;
		var $winW = $('.banner_list').width();
		var timer = null;
		var $windWidth = $(window).width();
		var $expandTarget = 0;

		function bannerPosition() {
			$windWidth = $(window).width();
			var $bannerContW = $('.banner_list').width();
			var $imgHeight = $windWidth * 0.75;
			//alert($imgHeight)

			if ($windWidth < 1920) {
							$('.banner_list').height($imgHeight+289);
				$('#banner p.point_btn').css('top',$imgHeight-40);
				$('.banner_list a.btn').css('top',($imgHeight-100)/2);
				$('#banner img').attr('src',function(index,element){
				return $(this).attr('data-img-src');
				});
				$('#banner li').each(function (index, element) {
					$(this).css("background-image", "url(" + $(this).attr('data-small-img') + ")");
				});
			} else {
								$('.banner_list').height(640);
				$('.banner_list a.btn').css('top',270);
				$('#banner p.point_btn').css('top',550);
				 
			}
			//$('#banner p.point_btn').css('left',($bannerContW -75)/2);
		}
		bannerPosition();
		//$(window).resize(function () {
//			bannerPosition();
//		});

		function autoChange() {
			$('.banner_list li').not('.active').css('left', 100 + '%');
			$bannerCount++;
			$('.banner_list li.active').animate({
				'left' : -100 + '%'
			}, 800, function () {
				$(this).removeClass('active').css({
					'left' : 100 + '%'
				});
			});
			if ($bannerCount == $bannerNum) {
				$('.banner_list li:first').animate({
					'left' : 0
				}, 800, function () {
					$(this).addClass('active');
				});
				$bannerCount = 0;
			} else {
				$('.banner_list li.active').next().animate({
					'left' : 0
				}, 800, function () {
					$(this).addClass('active');
				});
			}
			$('#banner p.point_btn a').eq($bannerCount).addClass('on').siblings().removeClass('on');
		}
		$('#banner p.point_btn a').click(function () {
			$bannerCount = $('#banner p.point_btn a').index(this);
			$(this).addClass('on').siblings().removeClass('on');
			$('.banner_list li').eq($bannerCount).addClass('active').siblings().removeClass('active');
			$('.banner_list li.active').animate({
				'left' : 0 + '%'
			});
		});
		var click_pause = false;
		$('#banner a.next').click(function () {
			if (click_pause)
				return;
			click_pause = true;
			setTimeout(function () {
				click_pause = false;
			}, 800);
			autoChange();
		});
		$('#banner a.prev').click(function () {
			if (click_pause)
				return;
			click_pause = true;
			setTimeout(function () {
				click_pause = false;
			}, 800);
			$('.banner_list li').not('.active').css('left', -100 + '%');
			$bannerCount--;
			$('.banner_list li.active').animate({
				'left' : 100 + '%'
			}, 800, function () {
				$(this).removeClass('active').css({
					'left' : -100 + '%'
				});
			});
			if ($bannerCount <= 0) {
				$('.banner_list li:last').animate({
					'left' : 0
				}, 800, function () {
					$(this).addClass('active');
				});
				$bannerCount = $bannerNum;
			} else {
				$('.banner_list li.active').prev().animate({
					'left' : 0
				}, 800, function () {
					$(this).addClass('active');
				});
			}
			$('#banner p.point_btn a').eq($bannerCount - 1).addClass('on').siblings().removeClass('on');
		});
		$('#banner').mouseenter(function () {
			clearInterval(timer);
			$('#banner a.btn').show();
		})
		.mouseleave(function () {
			timer = setInterval(timerFun, 3000);
			if ($windWidth < 1920) {
				return;
			} else {
				$('#banner a.btn').hide();
			}

		});

		function timerFun() {
			var $bannerListNum = $('#banner ul li').length;
			if ($bannerListNum > 1) {
				autoChange();
			}

		}
		timer = setInterval(timerFun, 5000);
		$('.cloud_computing .expand-more a,.product_solution .expand-more a,.product-overview .expand-more a').click(function () {
			$(this).parents('.expand-more').prev().slideToggle();
			$(this).find('i').toggleClass('down');
			if ($(this).hasClass('on')) {
				$(this).find('span').text('EXPAND');
				$(this).removeClass('on');
				$('body,html').animate({
					'scrollTop' : $expandTarget
				});
			} else {
				$(this).find('span').text('COLLAPSE');
				$(this).addClass('on');
				$expandTarget = $(document).scrollTop();
			}
		});
	},
	All_product : function () {
		//$('.all_product .letter_list a').click(function (e) {
//			e.preventDefault();
//			var $thisHref = $(this).attr('href');
//			var $target = $($thisHref).offset().top;
//			$('html,body').animate({
//				'scrollTop' : $target
//			});
//		});
	},
	solutionCategory : function () {
		//$('.solCategory .solution-nav span.title').click(function () {
//			$(this).toggleClass('on');
//			$(this).siblings('.link-wrap').slideToggle();
//		});
//		$('.solution-mobilr-nav .title i').click(function () {
//			$(this).toggleClass('on').siblings('ul').slideToggle();
//		});
//		$('.solution-mobilr-nav .title ul li span').click(function () {
//			$(this).addClass('on').siblings().removeClass('on');
//		});
	},
	ProductComparison : function () {
		var $compareCount = 0;
		var $proLilength = 0;
		var $proCompare = [0, 1, 2, 3];

		function sortNumber(a, b) {
			return a - b;
		}

		//$('.proComparison .expand-more a').click(function () {
//			$(this).parents('.product-list').find('.product').slideToggle();
//			$(this).find('i').toggleClass('down');
//			if ($(this).hasClass('on')) {
//				$(this).find('span').text('EXPAND');
//				$(this).removeClass('on');
//			} else {
//				$(this).find('span').text('COLLAPSE');
//				$(this).addClass('on');
//			}
//		});
//		$('.proComparison .compare-btn a').click(function () {
//
//			var $parent = $(this).parents('.col-sm-5c');
//			var $imgSrc = $parent.find('img').attr('src');
//			var $titleTxt = $parent.find('h3').text();
//			var $selectLength = $('.proComparison .compare-btn a.selected').length;
//
//			$('.compare-wrap').slideDown().animate({
//				'height' : 166
//			}, function () {
//				$(this).find('a.min').show().siblings('a.max').hide();
//			});
//			if ($(this).parent().hasClass('on')) {
//				var $thisIndex = $(this).parent().attr('data-index');
//				var $thisObj = $('.compare-pro-list li.pro[data-index =' + $thisIndex + ']').addClass('empty');
//
//				$(this).text('COMPARE').removeClass('selected').parent().removeClass('on').removeAttr('data-index');
//				$thisObj.removeAttr('data-index').find('div').hide();
//				$('.compare-pro-list li.pro:last').after($thisObj);
//
//				$compareCount = $proCompare.push($thisIndex);
//				$proCompare.sort(sortNumber);
//
//				$proLilength = $('.compare-pro-list li.pro[data-index]').length;
//				if ($proLilength >= 2) {
//					$('.compare-pro-list li a.comparebtn').addClass('on');
//				} else {
//					$('.compare-pro-list li a.comparebtn').removeClass('on');
//				}
//			} else {
//				if ($selectLength >= 4) {
//					$('.compare-wrap .warning').show();
//					setTimeout(function () {
//						$('.compare-wrap .warning').fadeOut();
//					}, 5000);
//					if ($proLilength >= 2) {
//						$('.compare-pro-list li a.comparebtn').addClass('on');
//					} else {
//						$('.compare-pro-list li a.comparebtn').removeClass('on');
//					}
//				} else {
//					$compareCount = $proCompare.shift();
//
//					var $target = $('.compare-pro-list li.empty:first').attr('data-index', $compareCount).removeClass('empty');
//					$(this).text('REMOVE').addClass('selected').parent().addClass('on').attr('data-index', $compareCount);
//					$target.find('div').show();
//					$target.find('img').attr('src', $imgSrc);
//					$target.find('.text span').text($titleTxt);
//
//				}
//				$proLilength = $('.compare-pro-list li.pro[data-index]').length;
//				if ($proLilength >= 2) {
//					$('.compare-pro-list li a.comparebtn').addClass('on');
//				} else {
//					$('.compare-pro-list li a.comparebtn').removeClass('on');
//				}
//			}
//		});

		//$('.compare-pro-list .text a').click(function () {
//			var $thisIndex = $(this).parents('li').attr('data-index');
//			var $thisObj = $(this).parents('li.pro').removeAttr('data-index').addClass('empty');
//
//			$(this).parents('.text').hide().siblings().hide();
//			$('.proComparison .compare-btn[data-index =' + $thisIndex + ']').removeClass('on').removeAttr('data-index').find('a').text('COMPARE').removeClass('selected');
//			$('.compare-pro-list li.pro:last').after($(this).parents('li'));
//			$compareCount = $proCompare.push($thisIndex);
//			$proCompare.sort(sortNumber);
//
//			$proLilength = $('.compare-pro-list li.pro[data-index]').length;
//			if ($proLilength >= 2) {
//				$('.compare-pro-list li a.comparebtn').addClass('on');
//			} else {
//				$('.compare-pro-list li a.comparebtn').removeClass('on');
//			}
//		});
//		$('.compare-wrap .title a.min').click(function () {
//			$(this).hide().siblings('a.max').show();
//			$('.compare-wrap').animate({
//				'height' : 25
//			});
//		});
//		$('.compare-wrap .title a.max').click(function () {
//			$(this).hide().siblings('a.min').show();
//			$('.compare-wrap').animate({
//				'height' : 166
//			});
//		});
//		$('.compare-wrap .title a.close').click(function () {
//			$('.compare-wrap').hide();
//		});
//		$('.compare-wrap a.clear').click(function () {
//			$('.compare-pro-list li a.comparebtn').removeClass('on');
//			$('.compare-wrap li.pro').find('div').hide();
//
//			$proCompare = [0, 1, 2, 3];
//
//			$('.proComparison .compare-btn a').text('COMPARE').removeClass('selected').parent().removeClass('on').removeAttr('data-index');
//			$('.compare-wrap li.pro').removeAttr('data-index').addClass('empty');
//		});
//		$('.compare-result table tr:odd').css('background', '#f5f5f5');
//		$('.compare-result table tr').each(function (index, element) {
//			$(element).find('td:last').css('border', 0);
//		});
	},
	pageTop : function () {
		$('<div/>', {
			'id' : 'top'
		}).appendTo('body');
		$(window).scroll(function () {
			var $scrollTop = $(window).scrollTop();
			if ($scrollTop > 1000) {
				$('#top').show();
			} else {
				$('#top').hide();
			}
		});
		$('#top').click(function () {
			$('body,html').animate({
				'scrollTop' : 0
			});
		});
	},
	inputChecked : function () {
		var sim,
		l;
		$(".firstChecked #checkedAll").bind("click", function () {
			$(this).parents(".page-item1").find(".secondChecked-link").find(":input[type=checkbox]").attr("checked", this.checked);
		});
		$(".secondChecked #checkedAllScend").bind("click", function () {
			$(this).parents(".secondChecked").next(".streeChecked").find(":input[type=checkbox]").attr("checked", this.checked);
			sim = $(this).parents(".page-item1").find(".secondChecked-link .secondChecked").find(":input[type=checkbox]").length;
			l = $(this).parents(".page-item1").find(".secondChecked-link .secondChecked").find(":input[type=checkbox]").filter(":checked");
			if (l.length == sim) {
				$(this).parents(".page-item1").find("#checkedAll").attr("checked", true);
			} else {
				$(this).parents(".page-item1").find("#checkedAll").attr("checked", false);
			}
		});
		$(".streeChecked li input").click(function () {
			sim = $(this).parents(".streeChecked").find(":input[type=checkbox]").length;
			l = $(this).parents(".streeChecked").find(":input[type=checkbox]").filter(":checked");
			//alert(sim)
			if (l.length == sim) {
				$(this).parents(".streeChecked").prev(".secondChecked").find("#checkedAllScend").attr("checked", true);
			} else {
				$(this).parents(".streeChecked").prev(".secondChecked").find("#checkedAllScend").attr("checked", false);
			}
		});
	},
	mobileNav : function () {
		$(document).on("tap", "#tab_main_nav_mobile_container ul li.home", function (e) {
			$(this).toggleClass('active').next('li').slideToggle();
		})
		 .on("tap", "#tab_main_nav_mobile_container ul li.hasmore", function (e) {
			var $thisIndex = $('#tab_main_nav_mobile_container ul li.hasmore').index(this);
			$('#tab_main_nav_mobile_next_container ul').eq($thisIndex).show().siblings('ul').hide();
			$('#tab_main_nav_mobile_next_container').addClass("mobile-menu-open").animate({
				'right' : 0
			});
		}) 
		.on("click", ".js-hasmore > span, .hasmore > span", function (e) {
			var $sub_nav=$(this).parent().children("ul").first();
			$(this).parent().siblings(".active").children("a").trigger("click");
			if($sub_nav.is(":hidden")){
				$(this).find("i, em").add($(this).parent()).addClass("active");
			}
			else $(this).find("i, em").add($(this).parent()).removeClass("active");
			$sub_nav.slideToggle(500, function(){
				if($(this).is(":hidden"))return;
				$("#tab_main_nav_mobile_container").stop().delay(100).animate({
					scrollTop : ($(this).parent().position()||$(this).parent().offset()).top+$("#tab_main_nav_mobile_container").scrollTop()
				}, 500);
			});
			return false;
		})
		.on("tap", "#tab_main_nav_mobile_next_container", function (e) {
			e.stopPropagation();
		})
		.on("tap", "#tab_main_nav_mobile_next_container h3", function (e) {
			$(this).parent().removeClass("mobile-menu-open").animate({
				'right' : -100 + '%'
			});
		});
	}

};
// bof
!(function ($) {
	// bof dom ready
	$(function ($) {
		/*&#33829;&#38144;&#36164;&#26009;*/
		Huaweimain.marketData();
		/*&#35299;&#20915;&#26041;&#26696;&#39029;&#35270;&#39057;&#20999;&#25442;*/
		Huaweimain.videoSwitch();
		Huaweimain.share();

		//if ($(".js-group-index-banner").length > 0)
		/*&#35299;&#20915;&#26041;&#26696;&#39029;banner&#20999;&#25442;*/
		//Huaweimain.groupBannerSwitch();
		/*&#35299;&#20915;&#26041;&#26696;&#20135;&#21697;&#21015;&#34920;&#20999;&#25442;*/
		Huaweimain.solutionProSwitch();
		/*&#20135;&#21697;A-Z*/
		Huaweimain.All_product();
		/*&#35299;&#20915;&#26041;&#26696;&#31867;&#21035;*/
		Huaweimain.solutionCategory();
		/*&#20135;&#21697;&#23545;&#27604;&#21015;&#34920;*/
		Huaweimain.ProductComparison();
		/*TOP*/
		//Huaweimain.pageTop();
		/*&#25105;&#30340;&#31354;&#38388;&#21333;&#36873;*/
		Huaweimain.inputChecked();
		/*&#23548;&#33322;*/
		Huaweimain.pageNav();
		/*&#25163;&#26426;&#23548;&#33322;*/
		Huaweimain.mobileNav();

	});
	// eof dom ready
})(jQuery);
// eof


// bof
(function ($) {
	// bof dom ready
	$(function ($) {
		// news auto roll
		var news_timer = setInterval(function () {
				$(".js-next-news").trigger("click");
			}, 3000);

		$(document).on('slid.bs.carousel', "#index-banner", function (e) {
			//do stuff in here

		})
		$(document).on("click", "#tab_main_nav_close_mobile", function (e) {
			$("#nav_mobile").click();
		})
		
		.on('slide.bs.carousel', "#index-banner", function (e) {
			$(this).find(".item.active .carousel-caption").fadeOut();
			setTimeout(function () {
				$(e.relatedTarget).find(".carousel-caption").fadeIn(500);
			}, 500);

			//do stuff in here
		})
		.on("click", ".js-search-show", function (e) {
			$(".js-search-header").slideToggle();
			return false;
		})
//.on("click", ".js_weixin", function (e) {
//			$(".weixin-qr").slideToggle(); //.stop(true, true).fadeIn();
//		})
		.on("swipeleft", "#index-banner", function (e) {
			$(this).carousel('next');
			return false;
		})
		.on("swiperight", "#index-banner", function (e) {
			$(this).carousel('prev');
			return false;
		})
		.on("mouseenter", "#nav-cont", function (e) {
		//	$('#index-banner').carousel('pause');
		})
		.on("mouseleave", "#nav-cont", function (e) {
		//	$('#index-banner').carousel('cycle');

		})
		.on("click", "body", function (e) {
			if($(e.target).is(".tel_tanchu")||$(e.target).parents(".tel_tanchu").length)
			return ;
			if($(".tel_tanchu").is(":visible"))
			$(".tel_tanchu").fadeOut(500);
			return;
		})	
		.on("click", ".js-email-btn", function (e) {
			var title = $(this).attr("data-email-title") || "";
			var body = $(this).attr("data-email-body") || "";
			var email = $(this).attr("data-email-addr") || "information@huawei.com";
			var url = $(this).attr("data-email-url") || document.URL;

			title = title.replace("{\u7f51\u9875title}", document.title);
			body = body.replace("{\u7f51\u9875title}", document.title);
			body = body.replace("{\u7f51\u9875url}", url);

			$(this).attr("href", "mailto:" + email + "?subject=" + title + " &body=" + body);

			//return false;
		})

		.on("click", ".js-feedback-btn", function (e) {
			var divID=$(this).attr("href").substring($(this).attr("href").indexOf("#"));
			$("#fancyboxHandle").attr("href", divID).trigger("click");
			return false;
			})
		.on("click", '.js-goto-top', function () {
			$('body,html').animate({
				'scrollTop' : 0
			});
		})		
		
		.on("click", ".js-popup-fancybox-btn", function (e) {
			$("#fancyboxHandle").attr("href", $(this).attr("href")).trigger("click");
			return false;
		})
		.on("click", ".js-fade-box-btn", function (e) {
			$($(this).attr("data-related-selector")).fadeToggle(500);
			return false;
		})
		.on("click", ".js-slide-box-btn", function (e) {
			$($(this).attr("data-related-selector")).slideToggle(500);
			return false;
		})
		.on("click", ".js-tel-btn", function (e) {
			if(!is_touch_device())return false;
			//location.href=$(this).attr("data-href");
			$(this).attr("href",$(this).attr("data-href"));
			return ;
		})
		.on("click", ".js-share-btn", function (e) {
			var $this=$(this);
			$($this.attr("data-related-selector")).css({"top":$this.position().top-(50*5+10)});
			return false;
		})
		.on("click", "body", function (e) {
			if($(e.target).parents(".js-body-not-close").length)return;
			$(".js-body-not-close").filter(":visible").fadeOut(500);
		})
		.on("click", ".js-print", function (e) {
			window.print();
			return false;
		})
		.on("click", ".js-share-show-btn", function (e) {
			$($(this).attr("data-related-selector")).slideToggle();
			return false;
		})
		.on("click", ".js-bds_mail", function (e) {
			var title = document.title;
			var body = document.title;
			$(this).attr("href", "mailto:@YourFriendsHere?subject=&#20998;&#20139;&#65306;" + title + "&body=" + body + " " + document.URL);
			//return false;
		})
		;

		$(window).on("resize", function (e) {
			$("#index-banner .item").css("background-image", function (i, v) {
				var url = $(window).width() >= 1920 ? $(this).attr("data-big-img") : $(this).attr("data-small-img");
				return "url(" + url + ")";
			});
		}).trigger("resize");
        $(window).on("scroll", function (e) {
            var $scrollTop = $(window).scrollTop();
            if ($scrollTop > 100 && $('#right_iconbox').is(":hidden")) {
                $('#right_iconbox').fadeIn(500);
            }

            if ($scrollTop >= 500) {

                $('.js-goto-top').stop().animate({ opacity: 1 }, 500);
            } else {

                $('.js-goto-top').stop().animate({ opacity: 0 }, 500);
            }
        }).trigger("scroll");
 		$('input, textarea').placeholder();
		//$("#index-banner .item").first().find(".carousel-caption").fadeIn(1000);
			//BrowseHappy();
		if($(window).width()<768)
		$(".tel_tanchu a[data-href]").each(function(i, o){
			$(this).attr("href", $(this).attr("data-href"));
			});
		// fancybox handler
		if ($.fn.fancybox)
			$('<a href="#" id="fancyboxHandle"></a>').appendTo("body").fancybox({
				padding : 0
			});

			
		 //mobile init player on document ready
		//if (is_touch_device()) {
//			var $play_btn=$(".index-video-box .js_video_player");
//			var playerid = $play_btn.attr("data-player-id") || 'playerContainer';
//			window.initPlayer(playerid, $play_btn.attr("data-video-path"), $play_btn.attr("data-img-path"), false);
//			$play_btn.fadeOut();
//		}

	});
	// eof dom ready
})(jQuery);
// eof


/* HTML5 Placeholder jQuery Plugin - v2.1.0
 * Copyright (c)2015 Mathias Bynens
 * 2015-01-27
 */
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a(jQuery)}(function(a){function b(b){var c={},d=/^jQuery\d+$/;return a.each(b.attributes,function(a,b){b.specified&&!d.test(b.name)&&(c[b.name]=b.value)}),c}function c(b,c){var d=this,f=a(d);if(d.value==f.attr("placeholder")&&f.hasClass(m.customClass))if(f.data("placeholder-password")){if(f=f.hide().nextAll('input[type="password"]:first').show().attr("id",f.removeAttr("id").data("placeholder-id")),b===!0)return f[0].value=c;f.focus()}else d.value="",f.removeClass(m.customClass),d==e()&&d.select()}function d(){var d,e=this,f=a(e),g=this.id;if(""===e.value){if("password"===e.type){if(!f.data("placeholder-textinput")){try{d=f.clone().attr({type:"text"})}catch(h){d=a("<input>").attr(a.extend(b(this),{type:"text"}))}d.removeAttr("name").data({"placeholder-password":f,"placeholder-id":g}).bind("focus.placeholder",c),f.data({"placeholder-textinput":d,"placeholder-id":g}).before(d)}f=f.removeAttr("id").hide().prevAll('input[type="text"]:first').attr("id",g).show()}f.addClass(m.customClass),f[0].value=f.attr("placeholder")}else f.removeClass(m.customClass)}function e(){try{return document.activeElement}catch(a){}}var f,g,h="[object OperaMini]"==Object.prototype.toString.call(window.operamini),i="placeholder"in document.createElement("input")&&!h,j="placeholder"in document.createElement("textarea")&&!h,k=a.valHooks,l=a.propHooks;if(i&&j)g=a.fn.placeholder=function(){return this},g.input=g.textarea=!0;else{var m={};g=a.fn.placeholder=function(b){var e={customClass:"placeholder"};m=a.extend({},e,b);var f=this;return f.filter((i?"textarea":":input")+"[placeholder]").not("."+m.customClass).bind({"focus.placeholder":c,"blur.placeholder":d}).data("placeholder-enabled",!0).trigger("blur.placeholder"),f},g.input=i,g.textarea=j,f={get:function(b){var c=a(b),d=c.data("placeholder-password");return d?d[0].value:c.data("placeholder-enabled")&&c.hasClass(m.customClass)?"":b.value},set:function(b,f){var g=a(b),h=g.data("placeholder-password");return h?h[0].value=f:g.data("placeholder-enabled")?(""===f?(b.value=f,b!=e()&&d.call(b)):g.hasClass(m.customClass)?c.call(b,!0,f)||(b.value=f):b.value=f,g):b.value=f}},i||(k.input=f,l.value=f),j||(k.textarea=f,l.value=f),a(function(){a(document).delegate("form","submit.placeholder",function(){var b=a("."+m.customClass,this).each(c);setTimeout(function(){b.each(d)},10)})}),a(window).bind("beforeunload.placeholder",function(){a("."+m.customClass).each(function(){this.value=""})})}});
