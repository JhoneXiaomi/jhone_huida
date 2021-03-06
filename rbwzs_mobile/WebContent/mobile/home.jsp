<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>	
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<title>${statScinterHomeSeoTitle.value }</title>
	<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
<header>
    <h1 class="fl">
       <a href="default.htm">
         <img src="${MhomeLo.value }" width="140" height="44" />
       </a>
    </h1>
    <div class="mNav-icon fr"><img src="${ctx }/mobile/images/mnav_00.png" width="23" height="13"/></div>
    <div class="mNav">
      <div class="mNav-close"><img src="${ctx }/mobile/images/mnav_001.png" width="19" height="19"/></div>
         <ul>
            <li><a href="${ctx}/"><img src="${ctx}/mobile/images/mnav_06.png" /><span>网站首页</span></a></li>
            <li><a href="${ctx}/m/effectImgs/p1"><img src="${ctx}/mobile/images/mnav_07.png" /><span>效果图</span></a></li>
            <li><a href="${ctx}/m/cases/p1"><img src="${ctx}/mobile/images/mNav_01.png"/><span>装修案例</span></a></li>
            <li><a href="${ctx}/m/order"><img src="${ctx}/mobile/images/mNav_03.png"/><span>装修报价</span></a></li>
            <li><a href="${ctx}/m/activaty/p1"><img src="${ctx}/mobile/images/mnav_010.png" /><span>最新活动</span></a></li>
            <li><a href="${ctx}/m/designer/p1"><img src="${ctx}/mobile/images/mNav_05.png" /><span>设计师</span></a></li>
            <li><a href="${ctx}/m/news/p1"><img src="${ctx}/mobile/images/mNav_02.png" /><span>装修知识</span></a></li>
            <div class="clear"></div>
         </ul>
    </div>
   
    <div class="clear"></div>
</header>
 <div>
      <span font-family="inherit">&nbsp;&nbsp;当前分站： <span id="CurrCompany" style="color: #009c42;"></span></span>
    </div>
    <div >
         <span font-family="inherit">&nbsp;&nbsp;全国分站：
           <a href="http://m.rbw27900.com">石家庄</a>&nbsp;&nbsp;&nbsp;
           <a href="http://mbd.rbw27900.com">保定</a>&nbsp;&nbsp;&nbsp;
           <a href="http://mhs.rbw27900.com">衡水</a>&nbsp;&nbsp;&nbsp;
           <a href="http://mlf.rbw27900.com">廊坊</a>
       </span>   
     </div>
<!-- banner scroll start-->
<div class="mBanner">
   <div class="scroll relative">
        <div class="scroll_box" id="scroll_img">
           <ul class="scroll_wrap">
           	<c:forEach items="${MhomeTurn}" var="homeTurn" >
           		<li>
		          <a href="${homeTurn.homeimgUrl }" target="_blank">
			           <img src="${homeTurn.homeimgSrc }" alt="${homeTurn.homeimgAlt }" name="${homeTurn.homeimgName }" title="${homeTurn.homeimgName }" width="100%"/>
		          </a> 	
	          </li>
	        </c:forEach>
           </ul>
        </div>
        <span class="scroll_position_bg opacity6"></span>
        <ul class="scroll_position" id='scroll_position'>
        <c:forEach items="${MhomeTurn }" var="homeTurn" varStatus="status">
           <c:choose>
		        <c:when test="${status.index==0 }">
		        	 <li class="on" >
			         		<a href="javascript:void(0);"> ${status.index+1 } </a>
			         </li>
		        </c:when>
		        <c:otherwise>
		         <li>
		         	<a href="javascript:void(0);">${status.index+1 } </a>
		         </li>
		        </c:otherwise>
	        </c:choose>
        </c:forEach>
        </ul>
   </div>
</div>
<!--banner  scroll end-->
<div class="mMain">
  <div class="index_mNav clearfix">
    <a href="${ctx }/m/cases/p1"><img src="${ctx}/mobile/images/mNav_01.png"/><span>装修案例</span></a>
    <a href="${ctx }/m/activaty/p1"><img src="${ctx}/mobile/images/mNav_02.png"/><span>装修活动</span></a>
    <a href="${ctx }/m/news/p1"><img src="${ctx}/mobile/images/mNav_03.png"/><span>装修新闻</span></a>
    <a href="${ctx }/m/designer/p1"><img src="${ctx}/mobile/images/mNav_05.png"/><span>找设计师</span></a>
  </div>
  <!--案例 start-->
  <div class="mAnli">
    <div class="mTitle clearfix">
      <h4 class="fl">案例展示</h4>
      <span class="fr"><a href="${ctx }/m/cases/p1">更多&nbsp;>></a></span>
    </div>
    <ul class="clearfix">
     <c:forEach items="${CasesLists}" var="cases" begin="0" end="3" varStatus="status">
     	<c:if test="${(status.index+1)%2 !=0 }">
     	<li>
	     	<a href="${ctx }/m/casesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}">
	     	<img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" title="${cases.caseTitle }" style="width: 160px;height: 130px;"/>
	     		<span>
	     		<c:choose>
	     			<c:when test="${fn:length(cases.caseTitle)>12 }"></>${fn:substring(cases.caseTitle,0,12) }</c:when>
	     			<c:otherwise>${cases.caseTitle }</c:otherwise>
	     		</c:choose>
	     		</span>
	     	</a>
     	</li>
     	</c:if>
     	<c:if test="${(status.index+1)%2 == 0 }">
     	
		<li class="no_mar">
	     	<a href="${ctx }/m/casesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}">
	     	<img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" title="${cases.caseTitle }" style="width: 160px;height: 130px;"/>
	     		<span>
	     		<c:choose>
	     			<c:when test="${fn:length(cases.caseTitle)>14 }">${fn:substring(cases.caseTitle,0,14) }</c:when>
	     			<c:otherwise>${cases.caseTitle }</c:otherwise>
	     		</c:choose>
	     		</span>
	     	</a>
     	</li>     	
     	</c:if>
     </c:forEach>
    </ul>
  </div>
<!--  案例 end-->

<!--装修流程 start-->
<div class="m_liucheng">
 
 <div class="mTitle clearfix">
    <h4 class="fl">装修流程</h4>
  </div>
  <div class="m_liucheng_con">
    <ul class="clearfix">
      <li><img src="${ctx }/mobile/images/indexz01.png" />免费量房</li>
      <li><img src="${ctx }/mobile/images/index_02.jpg" />装修报价</li>
      <li><img src="${ctx }/mobile/images/index_03.jpg" />专业设计</li>
      <li><img src="${ctx }/mobile/images/index_04.jpg" />申请监理</li>
      <li><img src="${ctx }/mobile/images/index_05.jpg" />装修施工</li>
      <li><img src="${ctx }/mobile/images/indexz06.png" />验收竣工</li>
    </ul>
  </div>
  
</div>
<!--装修流程 end-->
  
  
<!--设计师 start-->
  <div class="m_sjs">
    <div class="mTitle clearfix">
      <h4 class="fl">设计师</h4>
      <span class="fr"><a href="${ctx }/m/designer/p1">更多&nbsp;>></a></span>
    </div>
    
    <div class="m_sjs_list clearfix">
      <ul class="clearfix">
        <c:forEach items="${designerLists }" var="designer" begin="0" end="2">
	        <li>
		        <a href="${ctx}/m/designerDetail?designerId=${designer.designerId}">
			        <img src="${designer.designerPhotoImg }" alt="${designer.designerName }" width="168px" height="140px"/>
			        <span>${designer.designerName }</span>
		        </a>
	        </li>
        </c:forEach>
      </ul>
    </div>
  
  </div>
<!--设计师  end-->
  
  
<!--新闻 start-->
<div class="m_news">
    <div class="mTitle clearfix">
      <h4 class="fl">装修攻略</h4>
      <span class="fr"><a href="${ctx}/m/strategy/p1">更多&nbsp;>></a></span>
    </div>    
    <!-- 代码部分 begin -->
    <div class="scrollbox">
        <div id="scrollDiv">
            <ul>
            <c:forEach items="${newsOut }" var="news" begin="0" end="2">
				<li>
                   <h3><a href="${ctx}/m/strategyDetail?newsId=${news.newsId}" class="linktit">${news.title }</a></h3> 
                   <div>
                   <c:choose>
                   		<c:when test="${fn:length(news.contents)>60 }">${fn:substring(news.contents,0,60) }...</c:when>
                   		<c:otherwise>${news.contents }</c:otherwise>
                   </c:choose>
                   </div>
                </li>            
            </c:forEach>
            </ul>
        </div>
    </div>
<script src="${ctx }/mobile/js/jquery-1.4.4.min.js"></script>
<script src="${ctx }/mobile/js/jq_scroll.js"></script>
<script type="text/javascript">
$(function(){
    $("#scrollDiv").Scroll({line:1,speed:500,timer:3000,up:"but_up",down:"but_down"});
});
</script>
<!-- 代码部分 end -->
</div>
<!--新闻 end--> 
  
<!-- 在建工地  start--> 
<div class="mloupan">
  <div class="mTitle clearfix">
    <h4 class="fl">在建工地</h4>
   <%--  <span class="fr"><a href="${ctx }/m/house/p1">更多&nbsp;>></a></span> --%>
  </div>
 
  <ul class="clearfix">
  <c:forEach items="${hotBuildings }" var="building" begin="0" end="3" varStatus="status">
  		 <c:if test="${(status.index+1)%2 !=0 }">
	  		 <li>
		  		 <a href="${ctx }/workBuildingDetail?siteId=${building.id}">
		  		 <img src="${building.siteThumbImg }" alt="${building.siteName }" title="${building.siteName }" style="width: 170px;height: 140px"/></a>
		  		 <p>${building.siteName }</p>
	  		 </li>
  		</c:if>
  		<c:if test="${(status.index+1)%2 ==0 }">
	  		 <li class="no_mar">
		  		  <a href="${ctx }/workBuildingDetail?siteId=${building.id}">
		  		 <img src="${building.siteThumbImg }" alt="${building.siteName }" title="${building.siteName }" style="width: 170px;height: 140px"/></a>
		  		 <p>${building.siteName }</p>
	  		 </li>
  		</c:if>
  </c:forEach>
 </ul>
</div>
<!--装修楼盘 end-->   
    
</div>


<div class="mCont_right fr">
         <div class="ewm fl"><span>扫描二维码</span><img src="${sessionScope.MhomeTc.value }"></div>
         <div class="tianM fl"><span>天猫店铺</span><a href="javascript:void(0)"><img src="${ctx }/mobile/images/tianmao.png"></a></div>
         <div class="ewm fl"><span>淘宝商铺</span><img src="${ctx }/mobile/images/taobao.jpg"></div>
</div>
<div class="mtel">装修咨询热线：<img src="${ctx }/mobile/images/xiaodianhua.png"/><b>${sessionScope.MhomeTp.value }</b></div>
 
 <div class="clearfix"></div>
<div class="mfoot">京ICP备17066555号-1 &nbsp;Copyright@2010-2016<br/>版权所有&nbsp;&nbsp;<span id="rbwAddress" class="rbwAddress"></span>北京瑞博文易家装饰工程有限公司</div>
</div>
<div class="" style="margin-bottom:60px;"></div>
	<!--底部导航 start-->
	<jsp:include page="public/fotter.jsp" />
	<!--底部导航  end-->
	<script>
	$(function() {
		$(".next a").click(function() {
			nextscroll()
		});
	
		function nextscroll() {
			var vcon = $(".v_cont ");
			var offset = ($(".v_cont li").width()) * -1;
			vcon.stop().animate({
				left: offset
			}, "slow", function() {
				var firstItem = $(".v_cont ul li").first();
				vcon.find("ul").append(firstItem);
				$(this).css("left", "0px");
				circle();
			});
		};
	
		function circle() {
			var currentItem = $(".v_cont ul li").first();
			var currentIndex = currentItem.attr("index");
			$(".circle li").removeClass("circle-cur");
			$(".circle li").eq(currentIndex).addClass("circle-cur")
		}
		$(".prev a").click(function() {
			var vcon = $(".v_cont ");
			var offset = ($(".v_cont li").width() * -1);
			var lastItem = $(".v_cont ul li").last();
			vcon.find("ul").prepend(lastItem);
			vcon.css("left", offset);
			vcon.animate({
				left: "0px"
			}, "slow", function() {
				circle()
			})
		});
		var animateEnd = 1;
		$(".circle li").click(function() {
			if (animateEnd == 0) {
				return
			}
			$(this).addClass("circle-cur").siblings().removeClass("circle-cur");
			var nextindex = $(this).index();
			var currentindex = $(".v_cont li").first().attr("index");
			var curr = $(".v_cont li").first().clone();
			if (nextindex > currentindex) {
				for (var i = 0; i < nextindex - currentindex; i++) {
					var firstItem = $(".v_cont li").first();
					$(".v_cont ul").append(firstItem)
				}
				$(".v_cont ul").prepend(curr);
				var offset = ($(".v_cont li").width()) * -1;
				if (animateEnd == 1) {
					animateEnd = 0;
					$(".v_cont").stop().animate({
						left: offset
					}, "slow", function() {
						$(".v_cont ul li").first().remove();
						$(".v_cont").css("left", "0px");
						animateEnd = 1
					})
				}
			} else {
				var curt = $(".v_cont li").last().clone();
				for (var i = 0; i < currentindex - nextindex; i++) {
					var lastItem = $(".v_cont li").last();
					$(".v_cont ul").prepend(lastItem)
				}
				$(".v_cont ul").append(curt);
				var offset = ($(".v_cont li").width()) * -1;
				$(".v_cont").css("left", offset);
				if (animateEnd == 1) {
					animateEnd = 0;
					$(".v_cont").stop().animate({
						left: "0px"
					}, "slow", function() {
						$(".v_cont ul li").last().remove();
						animateEnd = 1
					})
				}
			}
		})
	})
	</script>
	<!--代码部分end-->
	
	<!--首页轮播js-->
	<script src="${ctx }/mobile/js/hhswipe.js"></script>
	<script>
	    var bullets = document.getElementById('scroll_position').getElementsByTagName('li');
	    var slider = Swipe(document.getElementById('scroll_img'), {
	        auto: 3000,
	        continuous: true,
	        callback: function(pos) {
	            var i = bullets.length;
	            while (i--) {
	                bullets[i].className = ' ';
	            }
	            bullets[pos].className = 'on';
	        }
	    });
	
	    $(function(){
	        $('.scroll_position_bg').css({
	            width:$('#scroll_position').width()
	        });
	    });
	</script>
	<!--首页轮播js end-->
		
	
	<script type="text/javascript">
	    // 首页导航显示隐藏
	    $(function () {
	        $(".mNav-icon").bind("click", function () {
	            $(".mNav").addClass('mNav-ani-fromTop');
	        })
	        $(".mNav-close img").bind("click", function () {
	            $(".mNav").removeClass('mNav-ani-fromTop');
	        })
	    })
	    $(function () {
	        var wid = $(".msjs img").width();
	        $(".msjs img").height(wid);
	
	    });
	
	    // 装修效果图选项卡
	    function nTabs(thisObj, Num) {
	        if (thisObj.className == "active")
	            return;
	        var tabObj = thisObj.parentNode.id;
	        var tabList = document.getElementById(tabObj).getElementsByTagName("a");
	        for (i = 0; i < tabList.length; i++)
	        {
	            if (i == Num)
	            {
	                thisObj.className = "active";
	                document.getElementById(tabObj + "_Content" + i).style.display = "block";
	            } else {
	                tabList[i].className = "normal";
	                document.getElementById(tabObj + "_Content" + i).style.display = "none";
	            }
	        }
	    }
	</script>
      <script type="text/javascript">
	  
		  /* 为分站添加点击事件 */
		  var currentBCompany = '${branchCompany}';
		  if(currentBCompany=='sjzrbw1'){
			$("#rbwAddress").text("石家庄");  
			$("#CurrCompany").text('欢迎访问北京瑞博文易家装饰工程有限公司石家庄站！');
		  }
		  if(currentBCompany=='bdrbw1'){
			$("#rbwAddress").text("保定");    
		  	$("#CurrCompany").text('欢迎访问北京瑞博文易家装饰工程有限公司保定站!');
		  }
		  if(currentBCompany=='lfrbw1'){
			  $("#rbwAddress").text("廊坊");  
		  	$("#CurrCompany").text('欢迎访问北京瑞博文易家装饰工程有限公司廊坊站!');
		  }
		  if(currentBCompany=='hsrbw1'){
			  $("#rbwAddress").text("衡水");  
		  	$("#CurrCompany").text('欢迎访问北京瑞博文易家装饰工程有限公司衡水站!');
		  }
	  </script>
	  ${sessionScope.statistics.value }
      ${sessionScope.shangqiao.value }
</body>
</html>