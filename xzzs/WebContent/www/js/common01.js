 
$(document).ready(function(){
    
    //插入通用弹框
    $("body").append("<div class='popbox' id='popYhj'><span class='btn_close' title='关闭'></span>" +
        "<div class='title'>免费申请博洛尼专属服务</div>" +
        "<div class='content'><p class='f12'>10秒快速申请，拒绝家装增项，全屋环保，装修从此安心省心！</p>" +
        "<div class='form'><dl class='item d1'><dt></dt>" +
        "<dd><input type='text' class='inputPopbox' name='nameA' placeholder='您的称呼'/></dd></dl>" +
        "<dl class='item d2'><dt></dt><dd><input type='text' class='inputPopbox' name='phoneA' placeholder='您的手机号'/></dd></dl>" +
        "<dl class='item d3'><dt></dt><dd><input type='text' class='inputPopbox' name='propertyA' placeholder='所在楼盘'/></dd></dl>" +
        "<dl class='item d4'><dt></dt><dd><input type='number' class='inputPopbox' name='sizeA' placeholder='楼盘面积'/></dd></dl>" +
        "<dl class='item sjs' style='display:none;'><dt></dt><dd><select name='district'>请选择</select><select name='did'>请选择</select></dl>" +
        "<div class='tipBar'><p id='tipErrorA' onclick='$(this).hide()'></p></div></div>" +
        "<div class='botbar'><input onclick='order()' type='submit' class='btnStyle btnStyle_green' value=''/></div></div>" +
        "<div class='lineScroll'></div>" +
        "<div class='lx'><div class='zx'><a href='javascript:void(0);' onclick='doyoo.util.openChat(\"g=10043498\");return false;'>在线咨询</a></div>" +
        "<div class='tel'>400-6763-993</div>" +
        "</div></div>" +
		"<div class='popbox' id='popTel'><span class='btn_close' title='关闭'></span>" +
        "<div class='title' style='padding-left:0;'><img src='/static/images/s5.gif'/> 立即获取博洛尼家居体验馆地址</div>" +
        "<div style='float:left;width:849px;height:487px;margin-bottom:10px;background:url(/static/images/popTel.jpg?1150) no-repeat;background-size: cover;'>" +
		"<div style='width:270px;float:left;margin-left:277px;margin-top:149px;'>" +
		"<p style='padding-left:18px;'>发送离您最近的博洛尼体验馆地址</p>" +
		"<p style='font-size:12px;line-height:18px;color:#333;margin:10px 0;'>服务电话：400-6763-993<br>营业时间：9:00-19:00(节假日20:00)</p>" +
		"<p><input id='popTel_phone' name='phone' placeholder='请输入手机号' style='width:124px;height:32px;padding:0 10px;margin-right:5px;border:1px solid #ddd;'>"+
		"<a href='javascript:;'  onclick='popTel();' style='width:117px;height:34px;line-height:34px;text-align:center;background:#e84200;color:#fff;display:inline-block;text-decoration:none;'>免费获取地址</a></p>" +
		"</div>" +
		"</div>");

    $(".selectStyle").selectStyle();
    $(".rollaround").rollaround();
    $(".guideActRoll").rollaround(1,0,1);
    $(".shopImg").rollaround(3,"bigimg");
    $(".i_smyinfo .lineScroll").Scroll({item:".scrollItem",num:8,line:1,speed:500,timer:3000});
    $(".sideOrder .lineScroll").Scroll({item:".scrollItem",num:8,line:1,speed:500,timer:3000});
    $(".designerWork").textMore();
    $(".hover_se").each(function(){$(this).append("<b></b>");});
	//设计师页面头像效果暂时取消 梁清超2015-7-6 15:03:08
    //$(".designItem .photo").each(function(){
    //    var nclass="bg"+Math.floor(Math.random()*8+1)
    //   $(this).append("<b class="+nclass+"></b>");
    //});

    //添加边栏
    $("body").append("<div id='side'><a onclick='doyoo.util.openChat(\"g=10043498\");return false;' href='javascript:void(0);' class='s1'>在线咨询</a><a href='javascript:;' data-pop='popYhj' class='s2 btn_popBox'>上门量房</a><a href='javascript:;' data-pop='popTel' class='s5 btn_popBox'>发送地址到手机</a><a href='/Special/' class='s3'>优惠活动</a><a href='javascript:;' id='backtop' class='s4'>返回顶部</a></div>");
    //顶部搜索
    $("#topSearch").find("span").click(function(){
        $("#topSearch").siblings(".inputCommon").attr("placeholder",$(this).attr("dataText"))
    });
    //回到顶部
    $("#backtop").click(function(){var hb=$("html,body"); if(!hb.is(":animated"))return hb.animate({scrollTop:0},500)});
	//侧边栏
    $(".slide_ad").hover(
    function(){
        if(!$(".ad_02").is(":animated")){
           $(".ad_02").fadeIn(300);
           $(".ad_02").animate(
            {
                "right":78                 
            },300); 
        }
        
      },function(){
       if(!$(".ad_02").is(":animated")){
          $(".ad_02").animate({
             "right":100
         },300);
         $(".ad_02").fadeOut(300);
       }
	  });
   
    //排序
    $(".sort a").click(function(){
        if($(this).hasClass("curr")){$(this).find("i").toggleClass("asc");}
        $(this).addClass("curr").siblings().removeClass("curr");
    });
    //媒体滚动
    setInterval(function(){
        $(".meiti").find("dd").eq(0).slideUp("slow",function(){$(this).remove()}).clone().appendTo(".meiti");
        },2000);
    //QA头像
    $(".qaHead").click(function(){
        $(this).siblings(".qaHeadList").show().mouseleave(function(){$(this).hide()});
        $(".qaHeadList").find("img").click(function(){
            var isrc=$(this).attr("src");
            $(this).parents(".qaHeadList").hide().siblings(".qaHead").find("img").attr("src",isrc);
        })
    });
	//全部分类
	if(!$('body#index').length){$("#classify").hover(function(){$('ul',this).stop().slideDown("fast")},function(){$('ul',this).stop().slideUp("fast")})}
	//申请优惠卷
	$('.btn_yhj').click(function(){$("#pop_yhj").fadeIn(300);$('body').dialog();});
	//弹框关闭
	$(".popbox").find(".close").click(function(){$('#MaskID').remove();$('.popbox').hide();});
    /*配置轮播参数对象*/
    SlideClass.newClass({
        hoverMain: $('.slide-wrap'),//必须 轮播外层元素
        slideMain: '.slide',//必须 实现轮播的元素，必须是hoverMain的子元素
        btnTape:'mouseover'//可选 显示轮播btn层，并设置触发事件 click | mouseover
        //addclassName: 'curr',//可选 当前显示的轮播层样式,默认为curr
        //speed: 1000, //可选 动画时间，默认600ms
        //interval: 5000,//可选 轮播间隔时间 默认5000ms
        //prev: '.prev',
        //next: '.next'
        //可选 上下页按钮元素 需要在html添加 需要一起配置
    });
    SlideClass.newClass({
        hoverMain: $('.housePlay,.casePlay'),
        slideMain: '.item',
        speed: 0, //可选 动画时间，默认600ms
        interval: 3000,//可选 轮播间隔时间 默认5000ms
        prev: '.prev',
        next: '.next'
    });
    SlideClass.newClass({
        hoverMain: $('.guidePlay'),
        slideMain: '.item',
        btnTape:'mouseover',
        speed: 0//可选 动画时间，默认600ms
    });
    //通用切换
    $('.tabOver dt').mouseover(function(){
        var dataTab=$(this).attr("data-tab");
        if(dataTab){
            $(this).addClass("curr").siblings("dt").removeClass("curr");
            var strData = dataTab.split(' ');
            for (var i = 0; i < strData.length; i++){
                $('#'+strData[i]).show().siblings(".tabCon").hide();
            }
        }
    });
    $('.tabClick dt').click(function(){
        var dataTab=$(this).attr("data-tab");
        if(dataTab){
            $(this).addClass("curr").siblings("dt").removeClass("curr");
            var strData = dataTab.split(' ');
            for (var i = 0; i < strData.length; i++) {
                $('#'+strData[i]).show().siblings(".tabCon").hide();
            }
        }
    });
	//详情页菜单定位
	if($("#proarea").length>0){
        (function(){
            var scroll_h=0;
            var scrollstart = $("#proarea").offset().top;
            window.onscroll = function(){
                 scroll_h = document.body.scrollTop+document.documentElement.scrollTop;
                 if(scroll_h>scrollstart-54){$(".pronav").addClass("top_pronav");$(".pnfixed").show()}else{$(".pronav").removeClass("top_pronav");$(".pnfixed").hide()}
            };
            $(".pronav dt").click(function(){
                scroll_h = document.body.scrollTop+document.documentElement.scrollTop;
                if(scroll_h>scrollstart){$('html,body').animate({scrollTop:scrollstart-54},0);return false;}
            });
        })()
	}
	//锚点平滑
	$('a[href*=#]').click(function() {
        if(location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
          var $target = $(this.hash);
          $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
          if($target.length) {
               var targetOffset = $target.offset().top;
               $('html,body').animate({scrollTop: targetOffset},600);
               return false;
          }}
    });
    //通用弹层
    $(".btn_popBox").live('click', function(){
       var wnd = $(window), doc = $(document),body=$('body'),wHeight;
       if(wnd.height() > doc.height()){wHeight = wnd.height();}else{ wHeight = doc.height();}
       //创建遮罩背景
       body.addClass('dialog').append("<div id='MaskID'></div>");
       body.find("#MaskID").width(wnd.width()).height(wHeight).css({position:"absolute",top:"0",left:"0",background:"#000",filter:"Alpha(opacity=0);",opacity:"0",zIndex:"10000",display:"block"}).animate({opacity:"0.8"},200 );
        //$("body").dialog();
        var pop = "#"+$(this).attr("data-pop");
		var did = $(this).data('did');
		var district = $(this).data('district');
		$(pop+' .sjs').hide();
		if(did){
			var data=new Array();
			data[0]=did;
            data[1]=district;
			$.post('/appointment/dxorder', {'data': data}, function(data) {
                    var data = eval("("+data+")");
                    var html='';
                    var htmlx='';
                    html+="<option value="+data['district_id']+">"+data['district_name']+"</option>";
                    htmlx+="<option value="+data['id']+">"+data['name']+"</option>";
                    $(pop+' select[name="district"]').html(html);
                    $(pop+' select[name="did"]').html(htmlx);
            });
			$(pop+' .sjs').show();			
		}
        PopShow(pop);
    });
    $(".popbox .btn_close,.popbox .btnStyle_close").live('click', function(){
        $('body').removeClass('dialog');
        $(this).parents(".popbox").hide();
        $("#MaskID").remove();
    });
    //idea弹出
    $(".ideaItem .hover_se").live('click', function(){
        $("body").dialog();
        $(".ideaViewBg").fadeIn(300);
    });
    $(".ideaViewClose").live('click', function(){
        $('body').removeClass('dialog');
        $(".ideaViewBg").hide();
        $("#MaskID").remove();
    })
    //支持
    $(".support").live('click', function(){
        Support(this,this.flag);
    });
});

//支持
function Support(obj,flag){
    if(!flag){
        var num=Number($(obj).find("em").html());
        $(obj).find("em").html(num+1);
        obj.flag = true;
		var sid=parseInt($(obj).find("input").val());
		slike(sid);
        return obj.flag;
    }else{
        alert("非常感谢，您已经支持过了。")
    }
}
//通用弹层显示
function PopShow(pop){
    var flag;
    if(!flag){
        var ph = -parseInt($(pop).height()/2);
        if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style){
            $(pop).css({opacity:0}).show();
            var pcw = parseInt($(pop).find('.content').width());
            $(pop).css({width:pcw,marginLeft:-pcw/2}).find('.botbar').width(pcw+60).fadeIn(300);
        }else{
            var pw = -parseInt($(pop).width()/2);
            $(pop).css({width:-pw*2,marginTop:ph,marginLeft:pw}).fadeIn(300);
        }
    }else{
        $(pop).fadeIn(300);
    }
}
// 产品组图
(function($){
    $.fn.rollaround=function(num,mainbox,total){
        $(this).each(function(i){
            var thisLi = $(this).find("li");
            var liw = thisLi.outerWidth();
            var thisUl = $(this).find("ul");
            var thisListW = $(this).find(".list").width();
            var prev = $(this).find(".prev");
            var next = $(this).find(".next");
            var len = thisLi.length;
            var inlen = thisListW/liw;
            var clen = inlen-len;
            var mIndex = 0;
            if(!num){num=1}
            if(total){ $(this).find(".total").html(len)}
            thisUl.css("width",liw*len);
            prev.find("i").addClass("no");
            if(len>inlen){
                next.click(function(){nextClick();});
                prev.click(function(){prevClick();})
            }else{
                next.find("i").addClass("no")
            }
            var prevClick = function(){
                var leftnow = thisUl.position().left+liw*num;
                if (!thisUl.is(':animated')) {
                    next.find("i").removeClass("no");
                    if(leftnow>=0){
                        leftnow = 0;
                        prev.find("i").addClass("no")
                    }
                    thisUl.animate({left:leftnow},500);
                }
            };
            var nextClick = function(){
                var leftnow = thisUl.position().left-liw*num;
                if (!thisUl.is(':animated')) {
                    prev.find("i").removeClass("no");
                    if(leftnow<=clen*liw){
                        leftnow = clen*liw;
                        next.find("i").addClass("no")
                    }
                    thisUl.animate({left:leftnow},500);
                }
            };
            if(mainbox){
                var mainImgSrc = thisLi.eq(mIndex).addClass("curr").children("img").attr("data-img"),
                    thisMain = $(this).find("."+mainbox);
                thisMain.find("img").attr("src",mainImgSrc);
                thisLi.mouseover(function(){
                    $(this).addClass("curr").siblings().removeClass("curr");
                    thisMain.find("img").attr("src",$(this).find("img").attr("data-img"))
                });
                thisMain.click(function(){
                    mIndex = $(this).parent().find("li.curr").index()+1;
                    if(mIndex>inlen-1 && mIndex<len){
                        var leftnow = thisUl.position().left-liw*num;
                        if (!thisUl.is(':animated')) {
                            prev.find("i").removeClass("no");
                            if(leftnow<=clen*liw){
                                leftnow = clen*liw;
                                next.find("i").addClass("no")
                            }
                            thisUl.css({left:leftnow});
                        }
                    }else if(mIndex==len){
                        mIndex=0;
                        next.find("i").removeClass("no");
                        prev.find("i").addClass("no");
                        thisUl.css({left:0});
                    }
                    thisLi.eq(mIndex).addClass("curr").siblings().removeClass("curr");
                    mainImgSrc = thisLi.eq(mIndex).addClass("curr").children("img").attr("data-img");
                    thisMain.find("img").attr("src",mainImgSrc)
                });
            }
        });
    }
})(jQuery);

// 获奖作品
(function($){
    $.fn.textMore=function(){
        $(this).each(function(){
            var conH = $(this).find(".con").height();
            var btn = $(this).find(".btnStyle");            
            if (conH>180){
				btn.show().toggle(function () {
            		$(this).html("取消全部");
		            var thistext = $(this).siblings(".text");            		
            		thistext.height(conH)
				  },function () {
            		$(this).html("显示全部");
		            var thistext = $(this).siblings(".text");            		
            		thistext.height(168)
				});            	
            }
        });
    }
})(jQuery);
// 模拟select
(function($){
    $.fn.selectStyle=function(){
        $(this).each(function(){
            var dt = $(this).find("dt");
            var dd = $(this).find("dd");
            var dditem = dd.find("a,span");
            dt.click(function(){
                dd.show();
            });
            dditem.click(function(){
                dt.html($(this).html());
                dd.hide();
            });
            $(this).mouseleave(function(){
                dd.hide();
            })
        });
    }
})(jQuery);
// 遮罩
$.fn.dialog=function(){
   var wnd = $(window), doc = $(document),body=$('body'),wHeight;
   if(wnd.height() > doc.height()){wHeight = wnd.height();}else{ wHeight = doc.height();}
   //创建遮罩背景
   body.addClass('dialog').append("<div id='MaskID'></div>");
   body.find("#MaskID").width(wnd.width()).height(wHeight).css({position:"absolute",top:"0",left:"0",background:"#000",filter:"Alpha(opacity=0);",opacity:"0",zIndex:"10000",display:"block"}).animate({opacity:"0.8"},200 );
};
//滚动插件
jQuery.fn.extend({
    Scroll:function(opt){
        //参数初始化
        if(!opt) opt={};
        var timerID;
        var _this=this.eq(0).find(".scrollBox"),
            lineH=_this.find(opt.item+":first").height(), //获取行高
            length=_this.find(opt.item).length,
            line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10),//每次滚动的行数，默认为一屏，即父容器高度
            speed=opt.speed?parseInt(opt.speed,10):500,//卷动速度，数值越大，速度越慢（毫秒）
            timer=opt.timer?parseInt(opt.timer,10):3000, //滚动的时间间隔（毫秒）
            dirNum = _this.attr("data-num");
        if(dirNum){opt.num=dirNum}
        _this.parent().height(lineH*opt.num);
        if(length>opt.num){
            if(line==0) line=1;
            var upHeight=0-line*lineH;
            //滚动函数
            var scrollUp=function(){
                _this.animate({marginTop:upHeight},speed,function(){
                    for(var i=1;i<=line;i++){
                        _this.find(opt.item+":first").appendTo(_this);
                    }
                    _this.css({marginTop:0});
                });
            };
            //Shawphy:自动播放
            var autoPlay = function(){
                if(timer)timerID = window.setInterval(function(){scrollUp();},timer);
            };
            var autoStop = function(){
                if(timer)window.clearInterval(timerID);
            };
            //鼠标事件绑定
            _this.hover(autoStop,autoPlay).mouseout();
        }
    }
});
//轮播插件
var SlideClass = {
    hasPrototype: false,
    newClass: function(ele1) {
        var ele = ele1 || {};
        if (!this.hasPrototype) {
            this.init.prototype = SlideClass;
            this.hasPrototype = true;
        }
        return new this.init(ele);
    },
    autoPlay: function() {
        var mythis = this;
        if (!this.slideMain.is(':animated')) {
            mythis.item++;
            if (mythis.item == mythis.length) {
                mythis.item = 0;
            }
            mythis.animationObj(mythis.item);
            mythis.curAnimation(mythis.item);
            mythis.clearSlideClass = setTimeout(function() {
                mythis.autoPlay();
            }, mythis.interval);
        }
    },
    prvePage: function() {
        if (!this.slideMain.is(':animated')) {
            this.item == 0 ? this.item = this.length - 1 : this.item--;
            this.animationObj(this.item);
            this.curAnimation(this.item);
        }
    },
    nextPage: function() {
        if (!this.slideMain.is(':animated')) {
            this.item == this.length - 1 ? this.item = 0 : this.item++;
            this.animationObj(this.item);
            this.curAnimation(this.item);
        }
    },
    clickCur: function(ele) {
        var _this = this;
        clearTimeout(_this.clearSlideClass);
        var getItem = $(ele).index();
        if(getItem!=this.aCur.parent().find(".curr").index()){
            this.aCur.removeClass('curr').eq(getItem).addClass('curr');
            this.animationObj(getItem);
            this.item = getItem;
        }
    },
    animationObj: function(getNum) {
        this.slideMain.stop(true,true).removeClass(this.addclassName).fadeOut(this.speed);
        this.slideMain.eq(getNum).stop(true,true).addClass(this.addclassName).fadeIn(this.speed)
    },
    curAnimation: function(eqNum) {
        var aCur = this.aCur;
        aCur ? aCur.removeClass('curr').eq(eqNum).addClass('curr') : void(0);
    },
    hoverWrap: function(ele) {
        var _this = this;
        ele.hoverMain.hover(function() {
            clearTimeout(_this.clearSlideClass);
        }, function() {
            _this.clearSlideClass = setTimeout(function() {
                _this.autoPlay();
            }, _this.interval);
        });
    },
    init: function(ele) {
        var _this = this;
        _this.clearSlideClass=null;
        _this.item = 0;
        _this.speed = ele.speed?_this.speed = ele.speed:_this.speed = 600;
        _this.interval = ele.interval?_this.interval = ele.interval:_this.interval = 5000;
        _this.hoverMain = ele.hoverMain;
        _this.slideMain = ele.hoverMain.find(ele.slideMain);
        _this.addclassName = ele.addclassName?_this.addclassName = ele.addclassName:_this.addclassName = 'curr';
        _this.length = ele.hoverMain.find(ele.slideMain).length;
        _this.next = ele.next;
        _this.prev = ele.prev;
        if(ele.btnTape){
            _this.btnHtml = "<div class='btnitem'>";
            for(var i=1; i < _this.length+1; i++) {
                if(ele.btnText){
                    i==1?_this.btnHtml += "<span class='curr'>"+ ele.btnText[i-1] +"</span>":_this.btnHtml += "<span>"+ ele.btnText[i-1] +"</span>"
                }else{
                    i==1?_this.btnHtml += "<span class='curr'>"+ i +"</span>":_this.btnHtml += "<span>"+ i +"</span>"
                }
            }
            _this.btnHtml += "</div>";
            ele.hoverMain.append(_this.btnHtml);
            _this.aCur = ele.hoverMain.find(".btnitem span");
            if(ele.btnTape!="click"){
                ele.hoverMain.find(".btnitem span").mouseover(function(){_this.clickCur(this);})
            }else{
                ele.hoverMain.find(".btnitem span").click(function(){_this.clickCur(this);})
            }
        }
        _this.clearSlideClass = setTimeout(function(){
            _this.autoPlay();
        }, _this.interval);
        if(ele.next && ele.prev){
            ele.hoverMain.find(ele.prev).click(function(){_this.prvePage();});
            ele.hoverMain.find(ele.next).click(function(){_this.nextPage();});
        }
        _this.hoverWrap(ele);
    }
};
//发送地址到手机
function popTel(){
        $.post("/Appointment/index/", {
            port: 0,
            typeid: 1,
            name: '到手机',
            phone: $('#popTel_phone').val(),
            referer: document.referrer
        }, function(result){
            alert(result);
            $('#popTel_phone').val("");
            $(".popdiv").hide();
        });	
}

function order(){
	var name=$("input[name='nameA']").val();
    var phone=$("input[name='phoneA']").val();
	var property=$("input[name='propertyA']").val();
	var size=$("input[name='sizeA']").val();
	var data=new Object();;
	var bid=$("select[name='bid']").val();
	var district=$("select[name='district']").val();
	var did=$("select[name='did']").val();
	
	data.name=name;
    data.phone=phone;
	data.property=property;
	data.size=size;

	if(name && phone){
		
		var myreg = /^(((13[0-9]{1})|159|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!myreg.test(phone)){
			$("#tipErrorA").html("手机号格式不正确！").show();
			return false;
		}
		
		if(bid){
			data['bid']=bid;
			$.post('/appointment/border', {'data': data}, function(data) {
				if(data==1){
					//$('#tipError').html('预约成功').show();
					alert('预约成功！');
					$('.btn_close').click();
				}else{
					$('#tipErrorA').html('预约失败，请重新预约！').show();
				}
			});
		}else if(did){
			data['district']=district;
			data['did']=did;
			$.post('/appointment/dorder', {'data': data}, function(data) {
				if(data==1){
					//$('#tipError').html('预约成功').show();
					alert('预约成功！');
					$('.btn_close').click();
				}else if(data==3){
					$('#tipErrorA').html('您输入的手机号已经预约过！').show();
				}else{
					$('#tipErrorA').html('预约失败，请重新预约！').show();
				}
			});
		}else{
			$.post('/appointment/order', {'data': data}, function(data) {
				if(data==1){
					//$('#tipError').html('预约成功').show();
					alert('预约成功！');
					$('.inputCommon').val("");
					$('.btn_close').click();
				}else if(data==3){
					$('#tipErrorA').html('您输入的手机号已经预约过！').show();
				}else{
					$('#tipErrorA').html('预约失败，请重新预约！').show();
				}
			});
		}
		}else if(name==''){
			$('#tipErrorA').html('姓名不能为空').show();
		}else{
			$('#tipErrorA').html('电话不能为空').show();
		}
}

function orderB(){
	var name=$("input[name='nameB']").val();
	var phone=$("input[name='phoneB']").val();
	var property=$("input[name='propertyB']").val();
	var size=$("input[name='sizeB']").val();
	var data=new Object();
	data.name=name;
	data.phone=phone;
	data.property=property;
	data.size=size;
	if(name && phone){
		
		var myreg = /^(((13[0-9]{1})|159|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!myreg.test(phone)){
			$("#tipErrorB").html("手机号格式不正确！").show();
			return false;
		}
		
		$.post('/appointment/order', {'data': data}, function(data) {
				if(data==1){
					$('#tipErrorB').html('预约成功').show();
					$('.inputCommon').val("");
					//alert('预约成功！');
				}else if(data==3){
					$('#tipErrorB').html('您输入的手机号已经预约过！').show();
				}else{
					$('#tipErrorB').html('预约失败，请重新预约！').show();
				}
			});
		}else if(name==''){
			$('#tipErrorB').html('姓名不能为空').show();
		}else{
			$('#tipErrorB').html('电话不能为空').show();
		}
}

function buildingorder(){
	var name=$("input[name='nameB']").val();
	var phone=$("input[name='phoneB']").val();
	var district=$("select[name='districtB']").val();
	var size=$("input[name='sizeB']").val();
	
	var data=new Object();
	data.name=name;
	data.phone=phone;
	data.district=district;
	data.size=size;
	if(name && phone){
		
		var myreg = /^(((13[0-9]{1})|159|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		if(!myreg.test(phone)){
			$("#tipErrorB").html("手机号格式不正确！").show();
			return false;
		}
		
		$.post('/appointment/Buildingorder', {'data': data}, function(data) {
				if(data==1){
					$('#tipErrorB').html('预约成功').show();
					$('input').val("");
				}else if(data==3){
					$('#tipErrorB').html('手机号已经预约过！').show();
				}else{
					$('#tipErrorB').html('预约失败').show();
				}
			});
		}else if(name==''){
			$('#tipErrorB').html('姓名不能为空').show();
		}else{
			$('#tipErrorB').html('手机不能为空').show();
		}
}

function search(){
	var type=$('#searchselect').val();
	if(type==1){
		$('#searchform').attr('action', '/designer/search.html');
		$('#searchtext').attr('placeholder', '找到您喜欢的设计师');
	}else if(type==2){
		$('#searchform').attr('action', '/cases/index.html');
		$('#searchtext').attr('placeholder', '找到您喜欢的优秀案例');
	}else if(type==3){
		$('#searchform').attr('action', '/building/index.html');
		$('#searchtext').attr('placeholder', '找到您关注的工地');
	}else{
		$('#searchform').attr('action', '/house/list.html');
		$('#searchtext').attr('placeholder', '找到您所在的小区楼盘');
	}
}

function houseorder(){
		var name=$("input[name='name']").val();
		var phone=$("input[name='phone']").val();
		var house=$("input[name='house']").val();
		var size=$("input[name='size']").val();
		
		if(name && phone){
			var data=new Object();
			data.name=name;
			data.phone=phone;
			data.house=house;
			data.size=size;
			
			var myreg = /^(((13[0-9]{1})|159|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if(!myreg.test(phone)){
				$("#tipError").html("手机号格式不正确！").show();
				return false;
			}
			
			$.post('/appointment/houseorder', {'data': data}, function(data) {
				if(data==1){
					$('#tipError').html('预约成功').show();
					$("input").val('');
				}else if(data==3){
					$('#tipError').html('手机号已经预约过！').show();
				}else{
					$('#tipError').html('预约失败').show();
				}
			});
		}else if(name==''){
			$('#tipError').html('姓名不能为空').show();
		}else{
			$('#tipError').html('手机不能为空').show();
		}
}

//大牌灵感预约
function sorder(){
		var name=$("input[name='name']").val();
		var phone=$("input[name='phone']").val();
		var sid=$(".ideaViewSid").html();
		
		if(name && phone){
			
			var myreg = /^(((13[0-9]{1})|159|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if(!myreg.test(phone)){
				$("#tipError").html("手机号格式不正确！").show();
				return false;
			}
			
			var data=new Object();
			data.name=name;
			data.phone=phone;
			data.sid=sid;
			$.post('/appointment/sorder', {'data': data}, function(data) {
				if(data==1){
					alert('预约成功！');
					$(".inputCommon").val('');
					$('#tipError').html('');
					$('.btn_close').click();
				}else if(data==3){
					$('#tipError').html('手机号已经预约过！').show();
				}else{
					$('#tipError').html('预约失败').show();
				}
			});
		}else if(name==''){
			$('#tipError').html('姓名不能为空').show();
		}else{
			$('#tipError').html('手机不能为空').show();
		}
}

//大牌灵感喜欢
function slike(sid){
	$.post('/appointment/slike', {'data': sid}, function(data) {

	});
}
(function($){
    /*
     * 统一select样式并实现样式高度自定义的jQuery插件@Mr.Think(http://mrthink.net/)
     */
    $.fn.iSimulateSelect=function(iSet){
        iSet=$.extend({
            selectBoxCls:'i_selectbox', //string类型,外围class名
            curSCls:'i_currentselected',//string类型,默认显示class名
            optionCls:'i_selectoption',//string类型,下拉列表class名
            selectedCls:'selected',//string类型,当前选中class名
            width:99,//number类型，模拟select的宽度
            height:300,//number类型，模拟select的最大高度
            zindex:20//层级顺序
        },iSet||{});
        this.hide();
        return this.each(function(){
           var self=this; 
           var thisCurVal,thisSelect,cIndex=0;
           //计算模拟select宽度
           if(iSet.width==0){
              iSet.width=$(self).width();
           }
           var html='<div class="'+iSet.selectBoxCls+'" style="z-index:'+iSet.zindex+'"><div class="'+iSet.curSCls+'" style="width:'+iSet.width+'px">'+$(self).find('option:selected').text()+'</div><dl class="'+iSet.optionCls+'" style="display:none;width:'+iSet.width+'px">';
           //判断select中是否有optgroup
           //用dt替代optgroup，用dd替代option
           if($(self).find('optgroup').size()>0){
               $(this).find('optgroup').each(function(){
                   html+='<dt>'+$(this).attr('label')+'</dt>';
                   $(this).find('option').each(function(){
                        if($(this).is(':selected')){
                          html+='<dd class="'+iSet.selectedCls+'">'+$(this).text()+'</dd>'; 
                       }else{
                          html+='<dd>'+$(this).text()+'</dd>';
                       }                    
                   });
               });
           }else{
               $(this).find('option').each(function(){
                   if($(this).is(':selected')){
                      html+='<dd class="'+iSet.selectedCls+'">'+$(this).text()+'</dd>'; 
                   }else{
                      html+='<dd>'+$(this).text()+'</dd>';
                   }
               });
           }
           //将模拟dl插入到select后面
           $(self).after(html);
           //当前模拟select外围box元素    
           thisBox=$(self).next('.'+iSet.selectBoxCls);
           //当前模拟select初始值元素    
           thisCurVal=thisBox.find('.'+iSet.curSCls);
           //当前模拟select列表
           thisSelect=thisBox.find('.'+iSet.optionCls);
           /*
           若同页面还有其他原生select,请前往https://github.com/brandonaaron/bgiframe下载bgiframe，同时在此处调用thisSelect.bgiframe()
            */ 
           //thisSelect.bgiframe();
           
           //弹出模拟下拉列表
           thisCurVal.click(function(){
              $('.'+iSet.optionCls).hide();
              $('.'+iSet.selectBoxCls).css('zIndex',iSet.zindex); 
              $(self).next('.'+iSet.selectBoxCls).css('zIndex',iSet.zindex+1);
              thisSelect.show();
           });
           //若模拟select高度超出限定高度，则自动overflow-y:auto
           if(thisSelect.height()>iSet.height){
               thisSelect.height(iSet.height);
           }
           //模拟列表点击事件-赋值-改变y坐标位置-...
           thisSelect.find('dd').click(function(){
               $(this).addClass(iSet.selectedCls).siblings().removeClass(iSet.selectedCls);
               cIndex=thisSelect.find('dd').index(this);
               thisCurVal.text($(this).text());
               $(self).find('option').removeAttr('selected');
               $(self).find('option').eq(cIndex).attr('selected','selected');
               $('.'+iSet.selectBoxCls).css('zIndex',iSet.zindex);
               thisSelect.hide(); 
               search();
           });
           //非模拟列表处点击隐藏模拟列表
       //$(document)点击事件不兼容部分移动设备
           $('html,body').click(function(e){
              if(e.target.className.indexOf(iSet.curSCls)==-1){
                  thisSelect.hide();
                  $('.'+iSet.selectBoxCls).css('zIndex',iSet.zindex); 
              } 
           });
           //取消模块列表处取消默认事件
           thisSelect.click(function(e){
              e.stopPropagation();
           });
        });
    }
})(jQuery);

$(function(){
	//插件调用
	$('.iselect').iSimulateSelect();
	var foot_fixed_show = 1;
	$(window).scroll(function(){ 
		if(foot_fixed_show){
			var topBar=$(window).scrollTop(); 
			var bodyHeigth =  (document.body.scrollHeight)*0.382;
			var scrollHeight =$(this).scrollTop();
			var footer = $(".footer").position().top-$(window).height();	
			if(topBar> bodyHeigth&&scrollHeight<footer){ 
				$(".foot_fixed").fadeIn(); 		
			}else{
				 $(".foot_fixed").fadeOut(); 
			}
		}
	}); 

	$(".foot_zhaobiao_close").click(function(){
		$('.foot_fixed').fadeOut(150);
		foot_fixed_show = 0;	
	});
});
$(function(){
  $(window).scroll(function () {
    if($(document).scrollTop() > 635 &&$(window).width() > 1300){
      $(".slide_ad,.foot_bm,#doyoo_panel").show();
    }else{
      $(".slide_ad,.foot_bm,#doyoo_panel").hide();
    }
  });
});

function post(port, typeid, source, source2, nameId, phoneId, propertyId,sizeId)
{
    name = $("#" + nameId).val();
    phone = $("#" + phoneId).val();
    if(propertyId){
       property = $("#" + propertyId).val();
    }else{
       property="";
    }
    if(sizeId){
       size = $("#" + sizeId).val();
    }else{
       size="";
    }
    referer = document.referrer;
    patrn = /^1[3-8]+\d{9}$/;
    if (name == "")
    {
        alert("请输入您的姓名！");
    $("#"+nameId).focus();
    }
    else if (phone == "")
    {
        alert("请输入您的电话！");
    $("#"+phoneId).focus();
    }
    else if (!patrn.test(phone))
    {
        alert("请输入正确的11位手机号码！");
    $("#"+phoneId).focus();   
    }
    else
    {
        $.post("/Appointment/index/", {
            port: port,
            typeid: typeid,
            source: source,
            source2: source2,
            name: name,
            phone: phone,
            property: property,
            size: size,
            referer: referer
      
        }, function(result) {
            alert(result);
            $("#" + nameId).val("");
            $("#" + phoneId).val("");
            $("#" + propertyId).val("");
            $("#" + sizeId).val("");
            $(".hidden6").hide();
            $(".popdiv").hide();
            $(".popdiv-1").hide();
            });
    }
    return false;
};