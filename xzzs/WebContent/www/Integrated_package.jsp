<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="public/include.jsp"%>
 <%@ include file="public/shangqiao.jsp" %>   
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>${packageSeoTitle.value }</title>
	<meta name="keywords" content="${packageSeoKeyword.value }"/>
	<meta name="description" content="${packageSeoDesc.value }"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/db_01.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	
	<!--底部报价 js-->
	<script src="${ctx }/www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script>
	   var jq = jQuery.noConflict();
	</script>
	<%-- <script type="text/javascript" src="${ctx }/www/js/db_01.js"></script> --%>
	<script type="text/javascript" src="${ctx }/www/js/GlobalProvinces.js"></script>
	<script src="${ctx }/www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
	<!--底部报价 js-->
</head>

<body>
<!--头部 start-->
<div class="head">
  <div class="head_top">
    <div class="w1200">
      <div class="head_top01 fl">当前站：<b>北京</b>&nbsp;&nbsp;&nbsp;新洲装饰全国分站：<a href="">北京</a><a href="">天津</a><a href="">唐山</a><a href="">保定</a><a href="">廊坊</a><a href="">石家庄</a><a href="">沧洲</a><a href="">郑洲</a><a href="">太原</a><a href="">济南</a><a href="">合肥</a><a href="">重庆</a></div>
      <div class="head_top02 fr">◎ 京城百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 </div>
    </div>
  </div>
  <div class="head_bottom w1200">
      
    <div class=""> 
     <div class="head_logo fl"><img src="images/logo.png" width="300" height="120"/></div>
      <!--search start-->
     <div class="head_search fl">
       <div class="search_1">
          <form>
            <input type="text" class="search_put" name="search_text" placeholder="搜索案例、小区" />
            <input type="submit" class="search_sub" value="搜索" />
          </form>
       </div>
       
       <div class="search_2">
         热门搜索：
         <a href="">早安北京</a>&nbsp;|&nbsp;
         <a href="">康泽佳苑</a>&nbsp;|&nbsp;
         <a href="">80平</a>&nbsp;|&nbsp;
         <a href="">廊坊</a>&nbsp;|&nbsp;
         <a href="">现代简约</a>&nbsp;|&nbsp;
         <a href="">装修预算</a>&nbsp;|&nbsp;
         <a href="">三室案例</a>
       </div>
     </div>
    <!--search end-->
     <div class="head_tel fr">
       <span>全国免费咨询电话</span>
       <p>4000-278-378</p>
     </div>
     </div>
     
  </div>
</div>
<!--头部 end-->
<div class="clear"></div>
<!--nav start-->




<!--nav end-->


<div class="clear"></div>
 
<!-- banner start-->
<!--<div class="ej_ban"><img src="images/recommendbg.jpg" width="100%"/></div>-->
<!--banner end-->
<div class="clear"></div>

<div class="ej_main w1200">
  <div class="ej_main_local sjs_local">您的当前位置：<a href="">首页</a>><a href="">装修案例</a></div>
  
   <!--大牌设计师 start-->
    <div class="hzbj">
<!-- picrotate_left start  -->
<div class="blk_18"> 
   <div class="title">
        <div class="title_cen clearfix">
           <h3 class="fl">大牌设计师</h3>
           <!--<span class="fr"><a href="">MORE <b>+</b></a></span>-->
        </div>
        
    </div>
  
   <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
  <div class="pcont" id="ISL_Cont_1">
    <div class="ScrCont clearfix">
      <div id="List1_1">
        <!-- piclist begin -->
        <a class="pl" href="#"><img src="images/shejishi_01.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl"href="#"> <img src="images/shejishi_02.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_03.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_04.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_01.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_02.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_03.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a> 
        <a class="pl" href="#"><img src="images/shejishi_04.jpg" width="150" height="150" alt="" title=""/><span>张晓峰 设计二部</span></a>
        <!-- piclist end -->
      </div>
      <div id="List2_1"></div>
    </div>
  </div>
   <a class="RightBotton" onmousedown="ISL_GoDown_1()" onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()" href="javascript:void(0);" target="_self"></a> 
</div>
 
 </div>
<div class="c"></div>
<script type="text/javascript">
  <!--
  picrun_ini()
  //-->
</script>
    
    
    <!--大牌设计师 end-->
  
  
  
  <div class="taocan_kjpz w1200">
   <div class="taocan_title"><h3>空间配置</h3></div>
   <ul>
     <li><a href=""><img src="images/anli01.png" width="280" height="232"/></a></li>
     <li><a href=""><img src="images/anli02.jpg" width="280" height="232"/></a></li>
     <li><a href=""><img src="images/anli03.jpg" width="280" height="232"/></a></li>
     <li class="no_mar"><a href=""><img src="images/anli04.jpg" width="280" height="232"/></a></li>
     <li><a href=""><img src="images/anli05.jpg" width="280" height="232"/></a></li>
     <li><a href=""><img src="images/anli06.jpg" width="280" height="232"/></a></li>
     <li><a href=""><img src="images/anli07.jpg" width="280" height="232"/></a></li>
     <li class="no_mar"><a href=""><img src="images/anli08.jpg" width="280" height="232"/></a></li>
   </ul>
  </div>
  
  <div class="taocan_zcpp clearfix">
    <div class="taocan_title"><h3>精选主材品牌</h3></div>
    <div class="taocan_left fl">
      <ul class="clearfix">
        <li><a href=""><img src="images/hz01.jpg" width="280" height="134"/></a></li>
        <li><a href=""><img src="images/hz02.jpg" width="280" height="134"/></a></li>
        <li><a href=""><img src="images/hz03.jpg" width="280" height="134"/></a></li>
        <li><a href=""><img src="images/hz02.jpg" width="280" height="134"/></a></li>
        <li><a href=""><img src="images/hz03.jpg" width="280" height="134"/></a></li>
        <li><a href=""><img src="images/hz01.jpg" width="280" height="134"/></a></li>
      </ul>
    </div>
    <div class="taocan_right fr">
       <div class="ej_main_right fr">
    <h3>申请户型规划</h3>
    <span>专业设计师一对一免费家装指导</span>
    <div class="main_anli_right_input">
      <input type="text" name="name" placeholder="请输入您的称呼"/>
      <input type="text" name="tel" placeholder="请输入您的电话"/>
      <input type="text" name="xiaoqu" placeholder="请输入小区名称"/>
      <input type="text" name="mianji" placeholder="请输入楼盘面积"/>
      <a href="">立即申请</a>
    </div>
    <p>已有（）业主申请了此服务</p>
   
  </div>
    </div>
  </div>
  
</div>


<div class="clear"></div>
	<!--footer start-->
	<jsp:include page="public/fotter.jsp"/>
	<!--footer end-->
	 <!-- servise start -->
    <jsp:include page="public/service.jsp"/>
    <!-- servise end -->
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>
