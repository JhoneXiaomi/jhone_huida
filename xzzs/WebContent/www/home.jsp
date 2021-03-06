<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>
<%@ include file="public/shangqiao.jsp" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${statScinterHomeSeoTitle.value }</title>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>
    <script type="text/javascript" src="${ctx }/www/js/navjs.js"></script>	
	<!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>

	<script>
	
		// To determine whether a server for mobile phones
		var isPC = function() {
		    var userAgentInfo = navigator.userAgent;
		    var Agents = ["Android", "iPhone",
		                "SymbianOS", "Windows Phone",
		                "iPad", "iPod", "BlackBerry"];
		    var flag = true;
		    for (var v = 0; v < Agents.length; v++) {
		        if (userAgentInfo.indexOf(Agents[v]) > 0) {
		            flag = false;
		            break;
		        }
		    }
		    return flag;
		};
		
		// make sjz and tj turn to the top-level domain
		var url = window.location.href ;
		
		// if the server is mobile phone then turn to the phone automatic
		if(!isPC()){
				if(url.indexOf('www.xz37800.com')>0){
				
				location.href = "http://m.xz37800.com";
				}else if(url.indexOf('sjz.xz27800.com')>0){
					
					location.href = "http://m.xz27800.com";
				}else if(url.indexOf('bd.xz27800.com')>0){
					
					location.href = "http://mbd.xz27800.com";
				}else if(url.indexOf('ty.xz27800.com')>0){
					
					location.href = "http://mty.xz27800.com";
				}else if(url.indexOf('www.0531zhuangshi.com')>0){
					
					location.href = "http://m.0531zhuangshi.com";
				}else if(url.indexOf('www.xzzstj.com')>0){
					
					location.href = "http://m.xzzstj.com";
				}else if(url.indexOf('tj.xz27800.com')>0){
					
					location.href = "http://mtj.xz27800.com";
				}else if(url.indexOf('lf.xz27800.com')>0){
					
					location.href = "http://mlf.xz27800.com";
				}else if(url.indexOf('cz.xz27800.com')>0){
					
					location.href = "http://mcz.xz27800.com";
				}else if(url.indexOf('ts.xz27800.com')>0){
					
					location.href = "http://mts.xz27800.com";
				}else if(url.indexOf('zz.xz27800.com')>0){
					
					location.href = "http://mzz.xz27800.com";
				}else if(url.indexOf('hf.xz27800.com')>0){
					
					location.href = "http://mhf.xz27800.com";
				}else if(url.indexOf('xzzstj.com')>0){
				
					location.href = "http://m.xzzstj.com";
				}else if(url.indexOf('hs.xz27800.com')>0){
				
					location.href = "http://mhs.xz27800.com";
				}else{
					
					location.href = "http://m.xz27800.com";
				}
			
		}
			
		
		//301
	/* 	if(url.indexOf('sjz.xz27800.com')>0)
			window.location.href="http://www.xz37800.com"; */
		
		if(url.indexOf('tj.xz27800.com')>0)
			window.location.href="http://www.xzzstj.com";

		
	</script>
	<!--底部报价 js-->
</head>

<body>

	<!--头部 start-->
	<jsp:include page="public/header.jsp"/>
	<!--头部 end-->
	
	<div class="clear"></div>
	
	<!--nav start-->
	<script>

	 $(function(){
	   			var $menuDiv = $('div.index_content');
	   			var $aList = $menuDiv.find('a');
	   			$aList.each(function(index,item){
	   				var $a = $(this);
	   				var href = $a.attr('href');
	   				if(typeof(href) !='undefined'){
		   				$a.attr('href',href.replace('WEBSITE_ID','4'));
	   				}
	   			});
	   		});
	   		//如果不是首页,需要将目录隐藏
	   		if(isHomePage != 'true'){
		    	$(document).ready(function() {
				$('.left_info').hide();
		            //不是主页才添加
		    		$('.nav-green-title').hover(function(){
		    			$('.left_info').css('display','block');
		    		},function(e){
		    			if(e.offsetY>40){
		                    $('.left_info').css('display','block'); 
		                }else{
		                     $('.left_info').css('display','none');
		                }
		            });
		            
		            $('.left_info').hover(function(){
		                
		            },function(e){
		                if(e.offsetY>100){
		                    $('.left_info').hide();
		                }
		            });
		
		            //不是主页才添加

		    		//banner 子菜单显示隐藏
					var x = 0;
					var timer = null;
					$(".left_info ul li").hover(function(ev){
		
					    var that = $(this);
					    //that.css('background','#fff');
					    var menus = that.data('submenu');
						$('.allSubMenu').show();
					    $('.SubMenu').hide();
					    $('#SubMenu_'+menus).show();
					    $('#SubMenu_'+menus).hover(function(){	
					    $('#SubMenu_'+menus).show();
					        //that.css('background','#fff');
					    },function(){
					        //that.css('background','rgba(255,255,255)');
					        if(e.offsetX<0){
					        	
					        }else{
					        	  $('.SubMenu').hide();
								  $('.allSubMenu').hide();
								  $('.left_info').hide();
					        }
					      
							
					    });
		
					    that.find('.left_info_title').css('color','#95c46e');
						
					    var positions = that.position();
		
					    if(500-positions.top < $('#SubMenu_'+menus).height())
					    {
					        $('#SubMenu_'+menus).css('top',500-$('#SubMenu_'+menus).height());
					    }
					    else{
					        $('#SubMenu_'+menus).css('top',positions.top);
					    }
		
					},function(e){
					   
					    $(this).find('.left_info_title').css('color','#000');
					    var that = $(this);
					    var menus = that.data('submenu');
					    $('#SubMenu_'+menus).hide();
						
		                if(e.offsetX<0){
		                    //往左边移动 隐藏
		                    $('.left_info').hide();
		                }else if(e.offsetX>$(this).width()){
		                    
		                    if($('#SubMenu_'+menus).html() == undefined){
		                      $('.left_info').hide();
		                    }
		                }
		                //不是主页才添加 
					});
		    	})
	   		}
			
			
			
				
		$(function(){
			
			$("#index_nav").children().children().children("li:first").removeClass("b_left");
			
			/*导航下拉*/
			 $("ul.nav li").hover(function(){
	             $(this).addClass("on");

	         },function(){
	             $(this).removeClass("on");

	         });
	         $("ul.nav li").hover(function(){
	             $(this).parent("ul").siblings("h3").addClass("choice");
	         },function(){
	             $(this).parent("ul").siblings("h3").removeClass("choice");
	         });
	         if ($("ul.nav li").find("ul") .html()!="") {
	                 $("ul.nav li").parent("ul").siblings("h3").append("<span class='sub'></span>");                
	         }
	         
		});

	    </script>
	
	
	<div id="index_nav">
	    <div class='menu_nav'>
	      <div class='menu_content'>
	        <ul class="nav" style='width: auto;margin: auto;'>
				<li class="nav-green-title"><a href="${ctx }/orderLine" target="_blank" style="color:#fff;">免 费 预 约 设 计</a><!-- <span class="iconfont" style="-moz-transform:rotate(270deg);-webkit-transform:rotate(270deg);transform: rotate(270deg);display: inline-block;margin-left: 10px;font-weight: normal;font-size: 13px;"><</span> --></li>
	    
				<li><h3><a href="${ctx }/" target="_blank">首页</a></h3>
				<ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a></h3></li>
		              </ul>
				</li>
	            <li>
	            	<c:if test="${branchCompany == 'bjxz'  }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=298" target="_blank">298套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=398" target="_blank">398套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=555" target="_blank">555套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=598" target="_blank">598套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'bdxz' }">
				       <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=468" target="_blank">468套餐</a></h3></li>
		               </ul>
					</c:if>
		            <c:if test="${branchCompany == 'sjzxz'  }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
		               <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=278" target="_blank">278套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'tyxz'  }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=298" target="_blank">298套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=398" target="_blank">398套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=555" target="_blank">555套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=598" target="_blank">598套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'tjxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'lfxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'tsxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					   <ul>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a></h3></li>
		                <li><h3><a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a></h3></li>
		              </ul>
					</c:if>
					<c:if test="${branchCompany == 'czxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'xzxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'jnxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'hfxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'cqxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					<c:if test="${branchCompany == 'zzxz' }">
					
					   <h3><a href="${ctx}/detail/taocan555" target="_blank">新房套餐</a></h3>
					</c:if>
					
	            </li>
	            <li>
	            	<h3><a href="${ctx }/orderLine" target="_blank">拎包装</a></h3>
	            </li>
	            <li><h3><a href="${ctx }/designer/p1" target="_blank">设计师</a></h3></li>
	            <li><h3><a href="${ctx }/cases/p1" target="_blank">装修案例</a></h3></li>
	            <li><h3><a href="${ctx }/workBuilding/p1" target="_blank">在建工地</a></h3></li>
	            <li><h3><a href="${ctx }/community/p1" target="_blank">团装小区</a></h3></li>
	            <li><h3><a href="${ctx }/news/p1" target="_blank">装修新闻</a></h3></li>
	            <li><h3><a href="${ctx }/about" target="_blank">关于我们</a></h3></li>
			</ul>
	      </div>
	    </div>
	</div>
	
	<div class="index_content">
	        <!--banner左边信息栏-->
	       <%--  <div class="left_info">
	            <ul class="li_hover">
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">
										个性化整装
		                            </span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p> 
		                        	<c:if test="${branchCompany =='sjzxz' }">
		                        
		                        		<a href="${ctx}/IntegratedPackageNew?key=278" target="_blank">278整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378整装</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tyxz' }">
		                        
		                        		<a href="${ctx}/IntegratedPackageNew?key=298" target="_blank">298整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=398" target="_blank">398整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=555" target="_blank">555整装</a>
										<a href="${ctx}/IntegratedPackageNew?key=598" target="_blank">598整装</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='bjxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">爆款全屋整装</a>
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">传统家装套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='bdxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew?key=378" target="_blank">378套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=468" target="_blank">468套餐</a>
		                       			
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tjxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">新房套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='lfxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">新房套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='tsxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew?key=348" target="_blank">348套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=418" target="_blank">418套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=518" target="_blank">518套餐</a>
		                       			<a href="${ctx}/IntegratedPackageNew?key=618" target="_blank">618套餐</a>
		                       		</c:if>
		                       		<c:if test="${branchCompany =='hfxz' }">
		                       			<a href="${ctx}/IntegratedPackageNew" target="_blank">爆款全屋整装</a>
		                       		</c:if>
	                       		</p>  
		                        </div>
		                    </div>
		                </li>        
					
	                
                <li data-submenu="0" class="border_B">
                    <div class="border_gray">
                        <div>
                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
                            <span class="left_info_title">
								面积范围
                            </span>
                        </div>
                        <div class="menu-item" style="margin-top: 10px">
                        	<p>
							  <a target="_blank" href="${ctx}/cases/p1?caseAcreage=40㎡以内">40㎡以内</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=40-60㎡">40-60㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=60-70㎡">60-70㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=70-100㎡">70-100㎡</a>
				              <a target="_blank" href="${ctx}/cases/p1?caseAcreage=100㎡以外">100㎡以外</a>
                        	</p>
                        </div>
                    </div>
                </li>

				
					
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">
										户型
		                            </span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p>
                                      <a href="${ctx}/cases/p1?casesType=一居" target="_blank">一居</a>
		                              <a href="${ctx}/cases/p1?casesType=两居" target="_blank">两居</a>
		                              <a href="${ctx}/cases/p1?casesType=多居" target="_blank">多居</a>
		                              <a href="${ctx}/cases/p1?casesType=复式" target="_blank">复式</a>
		                              <a href="${ctx}/cases/p1?casesType=洋房" target="_blank">洋房</a>
		                              <a href="${ctx}/cases/p1?casesType=别墅" target="_blank">别墅</a>
		                        	</p>
		                        </div>
		                    </div>
		                </li>
	                
                
					
		                <li  class="border_B">
		                    <div class="border_gray">
		                        <div>
		                            <span class="before"><img src="${ctx }/www/images/nav01.png" style="width: 20px;height: 22px"></span>
		                            <span class="left_info_title">装修风格</span>
		                        </div>
		                        <div class="menu-item" style="margin-top: 10px">
		                        	<p>
									  <a href="${ctx}/cases/p1?caseStyle=现代简约" target="_blank">现代简约</a>
		                              <a href="${ctx}/cases/p1?caseStyle=中式风格" target="_blank">中式风格</a>
		                              <a href="${ctx}/cases/p1?caseStyle=经典欧式" target="_blank">经典欧式</a>
		                              <a href="${ctx}/cases/p1?caseStyle=乡村田园" target="_blank">乡村田园</a>										
		                              <a href="${ctx}/cases/p1?caseStyle=地中海" target="_blank">地中海</a>									
		                              <a href="${ctx}/cases/p1?caseStyle=淡雅时光" target="_blank">淡雅时光</a>									
		                              <a href="${ctx}/cases/p1?caseStyle=美式乡村" target="_blank">美式乡村</a>									
		                            </p>
		                        </div>
		                    </div>
		                </li>
		                
	                
	            </ul>
					
	            <div  id="SubMenu_0" class='SubMenu'>
	               
	                <div style="clear: both"></div>
	            </div>
	            	
	        </div> --%>
	
	        <div style="clear: both"></div>
	    </div>
	<script>
	//4
	
		$(function(){
			
			$("#index_nav").children().children().children("li:first").removeClass("b_left");
			
			/*导航下拉*/
			 $("ul.nav li").hover(function(){
	             $(this).addClass("on");
	         },function(){        	
	             $(this).removeClass("on");
	
	         });
	         $("ul.nav li").hover(function(){
	             $(this).parent("ul").siblings("h3").addClass("choice");
	         },function(){
	             $(this).parent("ul").siblings("h3").removeClass("choice");
	         });
	         if ($("ul.nav li").find("ul") .html()!="") {
	                 $("ul.nav li").parent("ul").siblings("h3").append("<span class='sub'></span>");                
	         }
	         
		});
		
		
	
	</script>
		
	<!--nav end-->
	
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery.jslides.js"></script>
	
	<div class="clear"></div>
	 
	<!-- banner start-->
	<!-- 代码 开始 -->
	<div id="full-screen-slider">
		<ul id="slides">
			<c:forEach items="${homeTurn }" var="decrateImg">
				<li>
					<a href="${decrateImg.homeimgUrl }" target="_blank" >
						<img class="scrollLoading"  data-url="${decrateImg.homeimgSrc}" 
						src="${ctx }/www/images/wait_load.jpg"/>
					</a>
				</li>
			</c:forEach>	
		</ul>
	</div>
	<!-- 代码 结束 -->
	<!--banner end-->
	<div class="clear"></div>
	
	<div class="main w1200">
	  <!--装修计算器 start-->
	  <div class="main_jsq clearfix">
	    <div class="main_title"><h2 class="fl">装修计算器</h2><span>/&nbsp;&nbsp;算一算您装修得花多少钱？</span></div>
	    <div class="jsq_left fl">
	      <ul class="clearfix">
	        <li class="mar_r"><div class="jsq_left_l"><a target="_blank"  href="${ctx }/orderLine">
	        <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg" data-url="${ctx }/www/images/bj_MFLF.png"/></a></div><p>免费量房</p></li>
	        <li><div class="jsq_left_r"><a target="_blank" href="${ctx }/orderLine">
	        <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
	        data-url="${ctx }/www/images/bj_mfyf.png"/></a></div><p>免费验房</p></li>
	      </ul>
	      <div class="jsq_left_bottom"><div class="jsq_left_bottom_img"><a href="javascript:void(0)">
	      <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg" 
	      data-url="${ctx }/www/images/bj_jsq_hover.png"/></a></div><p>免费报价</p></div>
	    </div>
	    
	    <div class="jsq_right fl">
	      <form method="post" id="testForm">
	       <div class="jsq_right_modal">
	         <label>房屋户型</label>
	         <select name="bedRoom" id="bedRoom">
	           <option value="">请选择室</option>
	           <option value="1">1</option>
	           <option value="2">2</option>
	           <option value="3">3</option>
	           <option value="4">4</option>
	           <option value="5">5</option>
	         </select>
	         
	         <select name="livingRoom" id="livingRoom">
	           <option value="">请选择厅</option>
	           <option value="1">1</option>
	           <option value="2">2</option>
	           <option value="3">3</option>
	         </select>
	         
	         <select name="toilet" id="toilet">
	           <option value="">请选择卫</option>
	           <option value="1">1</option>
	           <option value="2">2</option>
	           <option value="3">3</option>
	         </select>
	         <input type="number" placeholder="室内面积" name="acreage" style="text-align: center;float:right"/>
	         
	       </div>
	      
	       
	       <div class="jsq_right_modal">
	        <label>装修城市</label> 
	        <select name="location" id="decorateCity">
	          <option value="bjxz">北京</option>
	          <option value="tjxz">天津</option>
	          <option value="tsxz">唐山</option>
	          <option value="bdxz">保定</option>
	          <option value="lfxz">廊坊</option>
	          <option value="sjzxz">石家庄</option>
	          <option value="czxz">沧州</option>
	          <option value="zxxz">郑州</option>
	          <option value="tyxz">太原</option>
	          <option value="jnxz">济南</option>
	          <option value="hfxz">合肥</option>
	          <option value="cqxz">重庆</option>
	        </select>
	        <input type="text" name="village" placeholder="请填写小区名称" style="width:470px;"/>
	       </div>
	       
	       
	       
	       <div class="jsq_right_modal">
	          <label>装修风格</label>
	          <div class="form-radio-box"><input type="radio" name="style" checked="checked" value="现代简约"><span>现代简约</span></div>
	          <div class="form-radio-box"><input type="radio" name="style" value="欧美风格"><span>欧美风格</span></div>
	          <div class="form-radio-box"><input type="radio" name="style" value="田园风格"><span>田园风格</span></div>
	          <div class="form-radio-box"><input type="radio" name="style" value="中式风格"><span>中式风格</span></div>
	          <div class="form-radio-box"><input type="radio" name="style" value="地中海风格"><span>地中海风格</span></div>
	          <div class="form-radio-box"><input type="radio" name="style" value="其他风格"><span>其他风格</span></div>
	       </div>
	       
	       
	       <div class="jsq_right_modal"> 
	          <label>装修套系</label>
	          <div class="form-radio-box"><input type="radio" name="product" checked="checked" value="品质型"><span>品质型</span></div>
	          <div class="form-radio-box"><input type="radio" name="product" value="精装型"><span>精装型</span></div>
	          <div class="form-radio-box"><input type="radio" name="product" value="城市贵族"><span>城市贵族</span></div>
	          <div class="form-radio-box"><input type="radio" name="product" value="别墅豪宅"><span>别墅豪宅</span></div>
	       </div>
	       
	       <div class="jsq_right_modal inputstyle">
	        <label>您的称呼</label>
	        <input type="text" name="clientName" placeholder="请输入您的称呼" style="text-align: center"/>
	        <input type="text" name="phone" placeholder="请输入手机号" style="text-align: center"/>
	       </div>
	       
	      </form> 
	    </div>
	    
	    
	    <div class="jsq_ri fr">
	      <p class="jsq_ri_text">您的家装预算为</p>
	      <div class="jsq_ri_input"><font color="red">0</font></div>
	      <p style="margin:10px 0;">以上价格仅供参考实际价格以最终报价为准</p>
	      
	      <a class="system_quotation" href="javascript:void(0)" id="getPrice">智能系统报价</a>
	      <a class="artificial_quotation" href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">人工精准报价</a>
	    </div>
	    
	    
	  </div>
	  <!--装修计算器 end-->
	  
	  <div class="huodong01 w1200">
	  
	  	 <c:forEach items="${activitys }" var="activity" varStatus="status">
		  
		  	<c:if test="${status.index==0 }">
		  	
		  	   <!--  <a href="${ctx }/activityDetail?activityId=${activity.newsId}">-->
					       
		       <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		       data-url="${activity.thumbImg }" width="100%" height="100%" alt="${activity.title }"/>
		        <!-- </a>-->
		  	</c:if>
		  </c:forEach>
	  </div>
	  
		<!--装修案例 start-->
		<script type="text/javascript" src="${ctx }/www/js/jquery.js"></script>
		<script type="text/javascript" src="${ctx }/www/js/scroll.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			$('.list_lh li:even').addClass('lieven');
		})
		$(function(){
			$("div.list_lh").myScroll({
				speed:40, //数值越大，速度越慢
				rowHeight:68 //li的高度
			});
		});
		</script>
	     
	     
	   <div class="main_anli clearfix">
       <div class="main_title">
         <div class="fl"><h2 class="fl">装修案例</h2><span>/&nbsp;&nbsp;精挑细选<b>2000</b>套案例</span></div>
         <div class="fr"><a href="${ctx }/cases/p1"><p>查看更多</p></a></div>
         
       </div>
       
       <div class="main_anli_left fl">
        <ul class="clearfix">
         <c:forEach items="${casesList }" var="cases" begin="0" end="5" varStatus="status">
			
				<c:if test="${(status.index+1)%3 != 0 }">
		          <div class="main_anli_all">
		             <li>
			             <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
			             <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
			             data-url="${cases.caseThumbImg }" width="305" height="231" alt="${companyCity}${cases.caseStyle}装修风格"/>
			             </a>
		             </li>
		             <p><span class="">【案例】</span>
		             
		             <c:choose>
		             
		             		<c:when test="${fn:length(cases.caseTitle)>5 }">${fn:substring(cases.caseTitle,0,5) }</c:when>
		             		<c:otherwise>${cases.caseTitle }</c:otherwise>
		             </c:choose>
		             ${cases.caseHouseType }  ${cases.caseStyle }   ${cases.caseAcreage }㎡</p>
		             <p class="detail">
 						<a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
			               <img  class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               <span class="m50">${cases.designerName }</span>
		               </a>
		               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
		               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
		               
		             </p>
		          </div>
		        </c:if>
		        <c:if test="${(status.index+1)%3 == 0 }">
		         <div class="main_anli_all no_mar">
		             <li>
			             <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
			             <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
			             data-url="${cases.caseThumbImg }" width="305" height="231" alt="${cases.caseAcreage}平${cases.caseStyle}"/>
			             </a>
		             </li>
		             <p><span class="">【案例】</span>
		             
		             <c:choose>
		             
		             		<c:when test="${fn:length(cases.caseTitle)>5 }">${fn:substring(cases.caseTitle,0,5) }</c:when>
		             		<c:otherwise>${cases.caseTitle }</c:otherwise>
		             </c:choose>
		             ${cases.caseHouseType }  ${cases.caseStyle }   ${cases.caseAcreage }㎡</p>
		             <p class="detail">
		               <a href="${ctx}/designerDetail/p1?designerId=${cases.designerId}">
			               <img  class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/>
			               <span class="m50">${cases.designerName }</span>
		               </a>
		               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
		               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
		          </div>
		        </c:if>
          </c:forEach>
        </ul>
       </div>
	      <div class="main_anli_right index_bj ej_bj fr" style="margin-left:0px;">
	 		  <h4>共有<b>130</b>&nbsp;&nbsp;位资深设计师 <br/> 为您提供<b>2890</b>&nbsp;&nbsp;套精品案例<br/>
	 		   共计&nbsp;<b>36985</b>&nbsp;&nbsp;位客户选择新洲装饰</h4>
	          <h4></h4>
	          <h4><b></b></h4>
	          <h2>优秀的设计团队 丰富的设计经验</h2>
	          <p>获得最靠谱的装修预算</p>	         
	          <div class="main_anli_right_input">
	            <input type="hidden" id="branchCompany" value="${branchCompany }"/>
	            <input type="hidden" name="orderId" id="orderId"/>
	            <input type="text" name="clientNames" placeholder="请输入您的称呼"/>
	            <input type="text" name="phones" placeholder="请输入您的电话"/>
	            <input type="text" name="address" placeholder="请输入小区名称"/>
	            <input type="text" name="acreages" placeholder="请输入楼盘面积"/>
	            <a href="javascript:void(0)" id="_submit">立即申请</a>
	          </div>
	          <div class="yuyue_info">
	            <div class="box">
	             <div class="bcon">
					<!-- 代码开始 -->
					<div class="list_lh">
						<ul>
							<c:forEach items="${orders }" var="order">
								<li>
								 <p>
								 <a href="javascript:void(0)" target="_blank">
								 <span style="float:left;width:90px"> 
									 <c:if test="${fn:length(order.clientName)==1 }">
									  ${order.clientName }××
									 </c:if>
									 <c:if test="${fn:length(order.clientName)==2 }">
									  ${order.clientName }
									 </c:if>
									  <c:if test="${fn:length(order.clientName)==3 }">
									  ${order.clientName }
									 </c:if>
								 </span>
								 <c:if test="${fn:length(order.phone) >0 }">
							     ${fn:substring(order.phone,0,3) }****${fn:substring(order.phone,7,11) }
							     </c:if>
								 <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成功预约免费设计 -->
								  </a>
								  </p>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 代码结束 -->
				</div>
			  </div>
	         </div>
	          
	       </div>
	       
	     </div>
	  <!--装修案例 end-->
	  
	  <div class="clear"></div>
	  <!--设计师团队 start-->
	  
	 <div class="sjs_bg">
	  <div class="team_sjs clearfix">
	    
	    <div class="main_title">
	         <div class="fl"><h2 class="fl">设计师团队</h2><span>/&nbsp;&nbsp;资深设计师为您量身定制</span></div>
	         <div class="fr"><a href="${ctx }/designer/p1"><p>查看更多</p></a></div>
	         
	    </div>
	    <c:forEach items="${designers }" var="designer" varStatus="status" >
			<c:if test="${status.index== 0 }">
			 <div class="team_sjs_left">
				 <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}" target="_blank"> 
						<img class="photo"	src="${designer.designerPhotoImg }" alt="${companyCity}新洲装修设计师${designer.designerName}" width="300" height="360" />
				 </a>
			 </div>
			</c:if>
		</c:forEach>
	    <c:forEach items="${designers }" var="designer" begin="1" end="4" varStatus="status">
			    <dl>
			      <dt>
				      <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}" target="_blank"> 
							<img class="photo" src="${designer.designerPhotoImg }" alt="装修设计师${designer.designerName}" width="200" height="240"/>
					  </a>
			      </dt>
			      
			      <dd>
			         <p class="team_name"><font color="#005a8b">${designer.designerName }</font>【${designer.designerTitle }】</p>
			         <p class="team_01 clearfix"><span class="fl">家装案例：<i>${4389-(status.index*125)}<%-- ${designer.designerCases } --%></i>套</span>  <span class="fr">
			         	<c:choose>	
			         		<c:when test="${fn:length(designer.designerWorkTime)<2 }">
			         			从业年限：<i>${designer.designerWorkTime }</i>年</span></p>
			         		</c:when>
			         		<c:otherwise>
			         			从业时间：<i>${designer.designerWorkTime }</i></span></p>
			         		</c:otherwise>
			         	</c:choose>
			         <p class="team_02">
			         <c:choose>
			         		<c:when test="${fn:length(designer.designerIdea)>16 }">${fn:substring(designer.designerIdea,0,16) }...</c:when>
			         		<c:otherwise>${designer.designerIdea}</c:otherwise>
			         </c:choose>
			         </p>
			      </dd>
			    </dl>
	    </c:forEach>
	  </div>
	 </div>
	  <!--设计师团队 end-->
	  <div class="clear"></div>	
	  
	  <div class="huodong01 w1200">
	  
		  <c:forEach items="${activitys}" var="activity" varStatus="status">
		  
		  	<c:if test="${status.index==1 }">
		  	
		  	   <!--  <a href="${ctx }/activityDetail?activityId=${activity.newsId}">-->
					       
		       <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		        data-url="${activity.thumbImg }" width="100%" height="100%" alt="${activity.title }"/>
		       <!--  </a>-->
		  	</c:if>
		  </c:forEach>
	  </div>
	  
	  
	   <div class="clear"></div>
	   <!--在建工地 start-->
	    <div class="main_gongdi">
	       <div class="main_title">
	       <div class="fl"><h2 class="fl">在建工地</h2><span>/&nbsp;&nbsp;时刻掌握装修现场</span></div>
	       <div class="fr"><a href="${ctx }/workBuilding/p1"><p>查看更多</p></a></div>
	       </div>
	       <ul class="clearfix">
	       	<c:forEach items="${hotBuildings }" var="building" varStatus="status" begin="0" end="7">
	       	
	       	 <c:if test="${(status.index+1)%4 !=0 }">
	         <div class="main_gongdi_all">		
	           <li><a href="${ctx }/workBuildingDetail?siteId=${building.id }">
	           		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
	           		 data-url="${building.siteThumbImg }" width="280" height="232" alt="${companyCity}${building.siteName}${building.houseStyle}"/>
	           		</a>
	           	</li>
	           <span><font>${building.siteName }</font>${building.houseStyle }</span>
	         </div>
	         </c:if>	
	         <c:if test="${(status.index+1)%4 ==0 }">
	         <div class="main_gongdi_all no_mar">
	           <li> <a href="${ctx }/workBuildingDetail?siteId=${building.id }">
	           		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
	           		 data-url="${building.siteThumbImg }" width="280" height="232" alt="${building.siteName}${building.houseStyle}"/>
	           		</a>
	           	</li>
	           <span><font>${building.siteName }</font>${building.houseStyle }</span>
	         </div>
	        </c:if>
	       	</c:forEach>
	       </ul>
	    </div>
	  <!--在建工地  end-->
	  
	  
	  
	  <!--热装小区 start-->
	  
	  <div class="hotxiaoqu w1200 clearfix">
	    <div class="main_title">
	        <div class="fl"><h2 class="fl">热装小区</h2><span>/&nbsp;&nbsp;把握时机就将属于您</span></div>
	        <div class="fr"><a href="${ctx }/community/p1"><p>查看更多</p></a></div>
	    </div>
	    <div class="hotxiaoqu_left fl">
	       <div id="xxx" >
			 <script>
	         var box =new PPTBox();
	         box.width = 390; //宽度
	         box.height = 323;//高度
	         box.autoplayer = 3;//自动播放间隔时间
	         var community =  eval("("+'${communityToJson}'+")");
	         for(var i=0 ;i<community.length;i++){
	        	 var communityImage =  community[i].communityImage;
	        	 var communityName = community[i].communityName;
	        	 var communityHref = "${ctx }/departmentDetail?communityId="+community[i].communityId;
	        	 box.add({"url":communityImage,"href":communityHref,"title":communityName});
	         }
	         box.show();
	        </script>
	       </div>
	    </div>
	    
	    <div class="hotxiaoqu_right fl">
	      <ul class="clearfix">
	      <c:forEach items="${communitys }" var="community" varStatus="status" begin="0" end="2">
	      
	      	<c:if test="${status.index !=2 }">
	      	
		      	<li>
		          <div class="hotxiaoqu_right_img">
		          <a href="${ctx }/departmentDetail?communityId=${community.communityId } ">
		          <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		          data-url="${community.communityImage }" alt="${companyCity}${community.communityName }" width="240" height="199"/>
		          </a>
		          </div>
		          <div class="hotxiaoqu_right_info">
		            <p ><font color="#005a8b" size="3em">【${community.communityName }】</font></p>
		          	<span>
		          	
			          	<c:choose>
			          	
			          		<c:when test="${fn:length(community.communityDescription)>30 }">
			          		
			          			${fn:substring(community.communityDescription,0,30)}...
			          		</c:when>
			          		<c:otherwise>
			          		${community.communityDescription }
			          		</c:otherwise>
			          	</c:choose>
		          	</span>
		            
		          </div>	
		           <a class="ckxq" href="${ctx }/departmentDetail?communityId=${community.communityId } ">查看详情</a>
		        </li>
	      	</c:if>
	        <c:if test="${status.index == 2 }">
	      	
		      	<li class="no_mar">
		          <div class="hotxiaoqu_right_img">
			          <a href="${ctx }/departmentDetail?communityId=${community.communityId } ">
			          		<img  class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
			          		data-url="${community.communityImage }" width="240" height="199" alt="${companyCity}${community.communityName }" />
			          </a>
		          </div>
		          <div class="hotxiaoqu_right_info">
		           <p ><font color="#005a8b" size="3em">【${community.communityName }】</font></p>
		          	<span>
			          	<c:choose>
			          		<c:when test="${fn:length(community.communityDescription)>30 }">
			          		
			          			${fn:substring(community.communityDescription,0,30)}...
			          		</c:when>
			          		<c:otherwise>
			          		${community.communityDescription }
			          		</c:otherwise>
			          	</c:choose>
		          	</span>
		          </div>	
		          <a class="ckxq" href="${ctx }/departmentDetail?communityId=${community.communityId } ">查看详情</a>
		        </li>
	      	</c:if>
	      </c:forEach>
	      </ul>
	    </div>
	    
	  </div>
	  
	  <!--热装小区 end-->
	  
	  
	  <!--装修知识 start-->

	    <div class="main_zxzs">
	    <div class="main_title">
	         <div class="fl"><h2 class="fl">装修知识</h2><span>/&nbsp;&nbsp;明明白白了解家装</span></div>
	         <div class="fr"><a href="javascript:void(0)"><p>查看更多</p></a></div>
	    </div>
	      <div class="main_zxzs01 clearfix">
	        <div class="zxzs_left fl">
	        <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
	        data-url="${ctx }/www/images/knowledge_top.jpg"/></div>
	     
	        <div class="zxzs_center fl">
	          <div class="zxzs_center_info">
	            <h2>家装攻略</h2>
	            <div class="zxzs_center_imgtxt">
	               <c:forEach items="${decorateStrategyList }" var="news" varStatus="status">
		            	
		            	<c:if test="${status.index == 0 }">
		            		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		            		data-url="${news.thumbImg }" width="134" height="111"/>
		            	</c:if>
	               </c:forEach>
	               <ul class="clearfix">
	                <c:forEach items="${decorateStrategyList }" var="news" varStatus="status" begin="0" end="3">
	            		
	            		 <li>
		            		 <a href="${ctx}/newsDetail?newsId=${news.newsId}" target="_blank">${news.title }</a>
	            		 </li>
	                </c:forEach>
	              </ul>
	            </div>
	          </div>
	        </div>
	      
	        <div class="zxzs_right fl">
	           <h2>装修注意</h2>
	            <div class="zxzs_center_imgtxt">
	              <c:forEach items="${otherNewsList}" var="otherNews" varStatus="status">
		            	
		            	<c:if test="${status.index == 0 }">
		            		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		            		data-url="${otherNews.thumbImg }" width="134" height="111"/>
		            	</c:if>
	               </c:forEach>
	               <ul class="clearfix">
	                <c:forEach items="${otherNewsList }" var="otherNews" varStatus="status" begin="0" end="3">
	            		 <li>
		            		 <a href="${ctx}/newsDetail?newsId=${otherNews.newsId}" target="_blank">${otherNews.title }</a>
	            		 </li>
	                </c:forEach>
	              </ul>
	            </div>
	        </div>
	     </div> 
     
     
     <div class="main_zxzs02">
        <div class="zxzs_left fl">
        <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
        data-url="${ctx }/www/images/knowledge_bottom.jpg"/></div>
     
        <div class="zxzs_center fl">
          <div class="zxzs_center_info">
            <h2>行业资讯</h2>
            <div class="zxzs_center_imgtxt">
                   <c:forEach items="${industryList }" var="industry" varStatus="status">
		            	
		            	<c:if test="${status.index == 0 }">
		            		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		            		data-url="${industry.thumbImg }" width="134" height="111"/>
		            	</c:if>
	               </c:forEach>
	               <ul class="clearfix">
	                <c:forEach items="${industryList }" var="industry" varStatus="status" begin="0" end="3">
	                
	            		 <li>
		            		 <a href="${ctx}/newsDetail?newsId=${industry.newsId}" target="_blank">${industry.title }</a>
	            		 </li>
	                </c:forEach>
	              </ul>
            </div>
          </div>
        </div>
      
        <div class="zxzs_right fl">
           <h2>家居日记</h2>
            <div class="zxzs_center_imgtxt">
             <div class="zxzs_center_imgtxt">
                   <c:forEach items="${domesticOutfitList }" var="domesticOutfit" varStatus="status">
		            	
		            	<c:if test="${status.index == 0 }">
		            		<img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
		            		data-url="${domesticOutfit.thumbImg }" width="134" height="111"/>
		            	</c:if>
	               </c:forEach>
	               <ul class="clearfix">
	                <c:forEach items="${domesticOutfitList }" var="domesticOutfit" varStatus="status" begin="0" end="3">
	                
	            		 <li>
		            		 <a href="${ctx}/newsDetail?newsId=${domesticOutfit.newsId}" target="_blank">${domesticOutfit.title }</a>
	            		 </li>
	                </c:forEach>
	              </ul>
            </div>
            </div>
        </div>
     </div>
     
    </div>	  
	  <!--装修知识 end-->
	  
	  <div class="clear"></div>
	  <!--合作品牌 start-->
	    <div class="hzpp">
	      <div class="main_title"><h2 class="fl">合作品牌</h2><span>/&nbsp;&nbsp;一线大牌让您无忧住新家？</span></div>
	      <ul class="clearfix">
	      
	        <c:forEach items="${homeCok }" var="coworker" varStatus="status">
			
				<c:if test="${(status.index+1)%6 != 0 }">
					 <li>
						     <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
						     data-url="${coworker.value }" width="182" height="80" />
					 </li>
				</c:if>
				<c:if test="${(status.index+1)%6 == 0 }">
					 <li class="no_mar">
						 <img class="scrollLoading" src="${ctx }/www/images/wait_load.jpg"
						 data-url="${coworker.value }" width="195" height="80"/>
					 </li>
				</c:if>
		    </c:forEach>
	      </ul>
	    </div>
	  <!--合作品牌 end-->
	  
	</div>

	<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	
	<!-- 服务 开始 -->
	<jsp:include page="public/service.jsp"/>
	<!-- 服务结束 -->
	
	<!-- 快速报价 -->
	
	<jsp:include page="public/faster.jsp"/>
	<!-- 快速报价 -->
	
	
	<script type="text/javascript">
	   
	$(function(){
		var company=${branchCompany};
		alert(company)
	})
	   var orderId = getOrderId();
	   $("#_submit").click(function(){
		  	 
			 var clientName= $("input[name='clientNames']").val();
			 var phone= $("input[name='phones']").val();
			 var acreage= $("input[name='acreages']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 if(!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && !acreage.match(/^\s*$/)){
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'免费申请'},
						success : function(data) {
							if (data.data == "ok") {
								alert("请您稍等，稍后会有客服人员为您服务!");
							}else{
								alert("保存失败");
							}
						}
					});  
			 }else if(clientName.match(/^\s*$/)){
				 alert("对不起,请正确填写姓名!");
			 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("对不起，请正确填写电话格式!");
			 }else if(acreage.match(/^\s*$/)){
				 alert("对不起,请正确天填写房屋面积!");
			 }
	   });
	   
	   // 快速报价
	   //链接后台
	   $("#getPrice").click(function(){
		   var submitNumber=0;
		   var bedRoom = $("#bedRoom").val();
		   var livingRoom = $("#livingRoom").val();
		   var toilet = $("#toilet").val();
		   var acreage = $("input[name='acreage']").val();
		   var location = $("input[name='location']").val();
		   var village = $("input[name='village']").val();
		   var style = $("input[name='style']").val();
		   var clientName = $("input[name='clientName']").val();
		   var phone = $("input[name='phone']").val();
		   var branchCompany= $('#branchCompany').val();
		   if(submitNumber!=0){
			   
			   alert("您已提交订单,请您稍等，稍后会有客服人员为您服务!");
			   return false;
		   }
		   if(bedRoom.match(/^\s*$/)){
			   
			   alert("对不起，请您填写卧室数量！");
			   return false;
		   }
 		 
 		   if(livingRoom.match(/^\s*$/)){
			   
			   alert("对不起，请您填写客厅数量！");
			   return false;
		   }
 		   if(toilet.match(/^\s*$/)){
			   
			   alert("对不起，请您填写卫生间数量！");
			   return false;
		   } 
 		   if(acreage.match(/^\d{n,}$/)){
			   
			   alert("对不起，请您填写报价面积！");
			   return false;
		   }
 		   if(village.match(/^\s*$/)){
			   
			   alert("对不起，请您填写小区名称!");
			   return false;
		   }
		  
 		   if(clientName.match(/^\s*$/)){
			   
			   alert("对不起，请填写您的名称!");
			   return false;
		   }
		   if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			   
			   alert("对不起，请正确填写的手机号码格式！");
			   $("input[name='phone']").val("");
			   return false;
		   }
		   
		   var price;
		   if(acreage<40){
			   price=26800;
			}
			
			if(acreage>=40 && acreage<60){
				price = (26800+(acreage-40)*368)*1.12;
			}else if(acreage>=60 && acreage<63){
				
				price =((26800+(acreage-40)*368)*1.12+1280);
			}else if(acreage>=63 &&acreage<=70){
				
				price =(36800*1.12);
			}else if(acreage>=71 &&acreage<=79){
				
				price = ((36800+(acreage-70)*368)*1.12);
			}else if(acreage>=80 && acreage<=109){
				
				price = ((36800+(acreage-70)*368)*1.12+1280);
			}else if(acreage>=110){
				
				price = ((36800+(acreage-70)*368)*1.12+1280+6000);

			}
		   	price=String(price);
		   	var index=price.lastIndexOf(".");
		   	price=price.substring(0, index);
			$.ajax({
				type : "POST",
				dataType : "json",
				url : "${ctx}/saveOrder",
				data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'装修计算器'},
				success : function(data) {
					if (data.data == "ok") {
						submitNumber=submitNumber+1;
						$(".jsq_ri_input").empty();
						  $(".jsq_ri_input").css("color","red");
						  $(".jsq_ri_input").text(price);
						  $("input[name='phone']").val("");
						  $("input[name='clientName']").val("");
						  $("input[name='village']").val("");
						alert("您的您的报价为"+price+"请您稍等，稍后会有客服人员为您服务!");
					}else{
						alert("保存失败");
					}
				}
			}); 
	   });
	   
	   
	    /*超级计算器选中当前城市*/
	   var select = document.getElementById("decorateCity"); 
	    for(var i=0;i<select.options.length;i++){
	    	 if(select.options[i].value =='${branchCompany}'){  
	    	        select.options[i].selected = true;  
	    	        break;  
	    	    }  
	    }
	    
	    /* 为分站添加点击事件 */
	    var currentBCompany = '${branchCompany}';
	    
	    if(currentBCompany=='bjxz'){
	    	$("#CurrCompany").text('北京站');
	    	$("#where").attr("alt","北京新洲家装公司");
	    }
	    if(currentBCompany=='tjxz'){
	    	$("#CurrCompany").text('天津站');
	    	$("#where").attr("alt","天津新洲家装公司");
	    }
	    if(currentBCompany=='lfxz'){
	    	$("#CurrCompany").text('廊坊站');
	    	$("#where").attr("alt","廊坊新洲家装公司");
	    }
	    if(currentBCompany=='sjzxz'){
	    	$("#CurrCompany").text('石家庄站');
	    	$("#where").attr("alt","石家庄新洲家装公司");
	    }
	    if(currentBCompany=='tsxz'){
	    	$("#CurrCompany").text('唐山站');
	    	$("#where").attr("alt","唐山新洲家装公司");
	    	
	    }
	    if(currentBCompany=='bdxz'){
	    	$("#CurrCompany").text('保定站');
	    	$("#where").attr("alt","保定新洲家装公司");
	    }
	    if(currentBCompany=='cqxz'){
	    	$("#CurrCompany").text('重庆站');
	    	$("#where").attr("alt","重庆新洲家装公司");
	    }
	    if(currentBCompany=='hfxz'){
	    	$("#CurrCompany").text('合肥站');
	    	$("#where").attr("alt","合肥新洲家装公司");
	    }
	    if(currentBCompany=='jnxz'){
	    	$("#CurrCompany").text('济南站');
	    	$("#where").attr("alt","济南新洲家装公司");
	    }
	    if(currentBCompany=='tyxz'){
	    	$("#CurrCompany").text('太原站');
	    	$("#where").attr("alt","太原新洲家装公司");
	    }
	    if(currentBCompany=='zzxz'){
	    	$("#CurrCompany").text('郑州站');
	    	$("#where").attr("alt","郑州新洲家装公司");
	    }
	    if(currentBCompany=='czxz'){
	    	$("#CurrCompany").text('沧州站');
	    	$("#where").attr("alt","沧州新洲装饰公司");
	    	
	    } 
	    if(currentBCompany=='hfxz'){
	    	$("#CurrCompany").text('合肥站');
	    	$("#where").attr("alt","合肥新洲家装公司");
	    }
	</script>
	${sessionScope.cnzzSession }
</body>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery.lazyload.js"></script>
	  <script >
        $(function(){
        	
            $(".scrollLoading").scrollLoading();
        	
        });
    </script>
</html>

