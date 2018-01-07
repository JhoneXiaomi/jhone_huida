// JavaScript Document
$(document).ready(function(e) {
	

		/*回到顶部事件*/
	$("#gotop").click(function(){			
			$("html,body").animate({scrollTop: 0}, 1000); 
			return false;// 返回false可以避免在原链接后加上#
	});
	/*扫一扫事件*/
	$("#apperweima").hover(function(){
		$("#apperweimabox").show();
	},function(){
		$("#apperweimabox").hide();		
	});

	
  /*导航*/
    $("dl.menu").hide();
	$("div.nav ul li").mouseover(function(){
		$(this).find("dl.menu").show().parent().siblings("li").find("dl.menu").hide();
		$(this).addClass("nav_cur").siblings("li").removeClass("nav_cur");
	});

//首页图片轮播
		
		//得到所有图片的数量
					var imgamount = $("#tupian ul li").length;
					
					//克隆一个节点，放在最后当猫腻
					$("#tupian ul li:first").clone().appendTo($("#tupian ul"));
					$("#tupian ul li").eq(imgamount-1).clone().prependTo($("#tupian ul"));

					var imagewidth = $("#tupian ul li:eq(2) img").width();

					//默认的时候，显示为第0张图片
					 $("#tupian ul").css("left",-imagewidth);

					var jiangeshijian = 7000; //  ← 请设置这个值，表示自动轮播的间隔时间

					//信号量，指示当前图片编号
					var nowshowpic = 0; 
				
					//控制小圆点，和图片数量一样多
					for(var i = 0 ; i < imgamount ; i++){
						$("#xiaoyuandian ul").append("<li>"  + "</li>");
					}
					//让第一个小圆点变蓝
					shezhixiaoyuandian(0);

					//每2秒种，模拟点击一次右按钮
					var mytimer = null;
					zidong();
					function zidong(){
						window.clearInterval(mytimer);
						mytimer = window.setInterval(
							function(){
								$("#anniu .you").trigger("click");
							}
						,jiangeshijian);
					}

					//鼠标进入，图片停止轮播
					$("#lunbo,#anniu").mouseenter(
						function(){
							window.clearInterval(mytimer);
						}
					);

					//鼠标离开，图片继续轮播
					$("#lunbo,#anniu").mouseleave(
						function(){
							zidong();
						}
					);

					//给右边按钮添加监听
					$("#anniu .you").click(
						function(){
							if(!$("#tupian ul").is(":animated")){
								if(nowshowpic < imgamount - 1){
									nowshowpic ++;
									huantu(nowshowpic);
								}else{
									nowshowpic = 0;
									huantu2(imgamount);
								}
								shezhixiaoyuandian(nowshowpic);
							}
						}
					);

					//给右边按钮添加监听
					$("#anniu .zuo").click(
						function(){
							if(!$("#tupian ul").is(":animated")){
								if(nowshowpic > 0){
									nowshowpic --
									huantu(nowshowpic);
								}else{
									nowshowpic = imgamount - 1;
									huantu3(nowshowpic);
								}
								shezhixiaoyuandian(nowshowpic);
							}
						}
					);

					//给所有小圆点添加监听
					$("#xiaoyuandian ul li").click(
						function(){
							nowshowpic = $(this).index();
							huantu(nowshowpic);
							shezhixiaoyuandian(nowshowpic);
						}
					);

					//让第num个li有cur，其余没cur
					function shezhixiaoyuandian(num){
						$("#xiaoyuandian ul li").eq(num).addClass("cur").siblings().removeClass("cur");
					}

					//核心函数，跑火车的执行者。
					function huantu(num){
						$("#tupian ul").animate(
							{
								"left": -1 * $("#tupian ul li img").width() * (num + 1)
							}
							,300
						);
					}
					function huantu2(num){
						$("#tupian ul").animate(
							{
								"left": -1 * $("#tupian ul li img").width() * (num + 1)
							}
							,300,function(){
								$("#tupian ul").css("left",-imagewidth);
							}
						);
					}
					function huantu3(num){
						$("#tupian ul").animate(
							{
								"left": 0
							}
							,300,function(){
								$("#tupian ul").css("left",-imagewidth * imgamount);
							}
						);
					}
					
					
		


  //内页设计师
  var nowpic=0;
  pic(nowpic);
  var picnum=$(".designers li").length;
  $(".fy_up").click(function(){
		if(nowpic<picnum-1){
			nowpic++;
		}else{
			nowpic=0
		}
		pic(nowpic);
  })
  $(".fy_down").click(function(){
		if(nowpic==0){
			nowpic=picnum-1;
		}else{
			nowpic--;
		}
		pic(nowpic);
  })
  function pic(num){
  	$(".designers li").eq(num).show().siblings("li").hide();
  }

		var jiangeshijian1 = 10000; //  ← 请设置这个值，表示自动轮播的间隔时间
		//每10秒种，模拟点击一次右按钮
					var mytimer1 = null;
					zidong1();
					function zidong1(){
						window.clearInterval(mytimer1);
						mytimer1 = window.setInterval(
							function(){
								if(!$(".designers li").is(":animated")){
									if(nowpic<picnum-1){
										nowpic++;
									}else{
										nowpic=0
									}
									pic(nowpic);
								}
							}
						,jiangeshijian1);
					}

					//鼠标进入，图片停止轮播
					$(".designers").mouseenter(
						function(){
							window.clearInterval(mytimer1);
						}
					);

					//鼠标离开，图片继续轮播
					$(".designers").mouseleave(
						function(){
							zidong1();
						}
					);

 //套餐
  $(".pz_bd .bdcon").eq(0).show().siblings(".bdcon").hide()
  $(".pz_hd li").mouseenter(function(){
  	$(".pz_bd .bdcon").eq($(this).index()).show().siblings(".bdcon").hide();
  })
  
  //房屋类型
				$(".type_c").mouseenter(function(){
					$(this).find(".list").show();
				}).mouseleave(function(){
					$(this).find(".list").hide();
				})
				$(".list span").mouseenter(function(){
					$(this).addClass("type_cur").siblings().removeClass("type_cur");
				}).click(function(){
					$(this).parent().siblings().attr("data-v",$(this).attr("data-v"));
					$(this).parent().siblings().html($(this).html());
				})
				//所选套餐
				$(".taocan span").click(function(){
					$(this).addClass("ion").removeClass("ioff");
					$(this).siblings("span").removeClass("ion").addClass("ioff");
					$(this).siblings("p").html($(this).html());
				})
				
				//招聘
				$(".zhiwei_ul li:odd").addClass("zw_odd");
				
/*设计师*/
  $('.cases').scrollbox({
    direction: 'h',
    distance: 210
  });
  $('#demo5-backward').click(function () {
    $('.cases').trigger('backward');
  });
  $('#demo5-forward').click(function () {
    $('.cases').trigger('forward');
  });
  

});