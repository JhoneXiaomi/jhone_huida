<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面不存在</title>
<link rel="stylesheet" type="text/css" href="${ctx}/www/css/style.css"/>
<script type="text/javascript" src="${ctx}/www/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
</head>
<body>
<div class="header">
<div class="top_line"> 
  <div class="head_top  w1180">
       <div class="top_local fl">
        <span>当前站： <span id="CurrCompany" style="color:#f39800;"></span>&nbsp;&nbsp;&nbsp;&nbsp;三创装饰全国分站：</span>
            <a href="http://www.sc27800.com" rel="nofollow" target="_blank">北京</a>&nbsp;&nbsp;&nbsp;
            <a href="http://ts.sc27800.com" rel="nofollow" target="_blank">唐山</a>&nbsp;&nbsp;&nbsp;
            <a href="http://tj.sc27800.com" rel="nofollow" target="_blank">天津</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://lf.sc27800.com" rel="nofollow" target="_blank">廊坊</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://sjz.sc27800.com" rel="nofollow" target="_blank">石家庄</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://hs.sc27800.com" rel="nofollow" target="_blank">衡水</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://bd.sc27800.com" rel="nofollow" target="_blank">保定</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://ty.sc27800.com" rel="nofollow" target="_blank">太原</a>
    </div>
     <div class="top_wel fr" >◎ 京城百姓信赖品牌家装公司 ◎ 室内装饰协会理事单位 ◎ 绿色装饰企业</div>
  </div>
  </div>
  <div class="logotel w1180 clearfix">
    <div class="logo fl"><a href="${ctx }/"><img src="${ctx}/www/images/404logo.png" id="logoImg"></a></div>
    <div class="telqq fr">
    	<div class="qq fr"><span><img src="${pageContext.request.contextPath}/www/images/tel.png"></span><p>公司电话：</p><p  id="telePhone"></p></span></div>
    </div>
  </div>
</div>
<%@ include file="/public/nav.jsp" %>

<div class="bodybg" style="padding-bottom: 0px">

   <div class="cenpic"><img src="${ctx}/www/images/404pic.png" /></div>
   
   <div class="backan">
     <ul class="clearfix">
       <li><img src="${ctx}/www/images/backpic.png" /><a href="${ctx}/">返回首页</a></li>
       <li><img src="${ctx}/www/images/backpic.png" /><a href="" onclick="back()">返回上一页</a></li>
       <li><img src="${ctx}/www/images/backpic.png" /><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank">联系客服</a></li>
     </ul>
     
     <p>没找到您要访问的网页原因可能如下：·可能网速过慢，或网络中断；可能页面已删除；这个页面太受欢迎了，太多人访问。</p>
   </div>
</div>

<div class="clear"></div>
<!--footer start-->
<div class="footer">
  <div class="footer01_bg">
    <div class="footer01 w1180">
       <div class="link" id="friendLink">${sessionScope.homeLk.value }</div>
      <div class="footer_nav fl">
        <h3>快速导航</h3>
        <ul>
             <li><a href="${pageContext.request.contextPath }/Integrated_package.jsp">整装套餐</a></li>
          <li><a href="${pageContext.request.contextPath }/cases/p1" >设计案例</a></li>
          <li><a href="${pageContext.request.contextPath}/spec/p1?type=热门活动" id="s3" class="subNavBtn">热门活动</a></li>
          <li><a href="${pageContext.request.contextPath}/designer/p1">设计团队</a></li>
          <li><a href="${pageContext.request.contextPath}/specase/p1?type=说装修">说装修</a></li>
          <li><a href="${pageContext.request.contextPath}/blue_diamond_process.jsp">蓝钻工艺</a></li>
          <li><a href="javascript:void(0)">三创服务</a></li>
          <li><a href="${pageContext.request.contextPath}/about.jsp">关于三创</a></li>
        </ul>
      </div>
     <div class="footer_cont fl">
        <h3>联系我们</h3>
         <ul class="clear">
          <li><img src="${pageContext.request.contextPath}/www/images/company.png"><span id="companyName"></span></li>

          <li><img src="${pageContext.request.contextPath}/www/images/footer_tel.png"><span id="companyPhone"></span></li>
<%--           <li><img src="${pageContext.request.contextPath}/www/images/footer_email.png"><span>邮箱：${homePort.value }</span></li> --%>
          <li>
           <img src="${pageContext.request.contextPath}/www/images/footer_des.png"><span id="companyAddress"></span>
           
         </li>
        </ul>
      </div>
      
      <div class="footer_ewm">
      <h3>其他服务</h3>
       <ul>
          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/tianmao.png"></a></li>
          <li><a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/www/images/jingdong.jpg"></a></li>
        </ul>
      </div>
    </div>
  </div>
   <div class="clear"></div>
  
  <div class="footer02_bg"><div class="w1180">Copyright 2013-2016 北京三创国际装饰设计有限公司</div></div>
</div>
<!--footer end-->

<!--右侧悬浮 开始-->
<div class="floating_ck">
	<dl>
    	<dt></dt>
        <dd class="quote">
			<a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"> <span>在线咨询</span></a>

            <div class="floating_left">
				  	 <a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn">点击立即咨询</a>
            </div>
        </dd>
        <dd class="qqpic">
        	<a href="http://wpa.qq.com/msgrd?v=3&uin=648040867&site=qq&menu=yes" target="_blank" style="color: #FFF"><span>QQ咨询</span></a>
        </dd>
        <dd class="qrcord">
        	<span>扫一扫</span>
            <div class="floating_left floating_ewm">
            	<i><img src="${homeTc.value }"/></i>
                <p class="qrcord_p01">扫一扫<br>扫描二维码</p>
            </div>
        </dd>
        <dd class="return">
        	<span onClick="gotoTop();return false;">返回顶部</span>
        </dd>
    </dl>
</div>
<!--右侧悬浮 结束-->
<!--跳到顶部-->
   
<script type="text/javascript" src="${ctx}/www/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">

var url = window.location.href;
if (url.indexOf('bd.sc27800.com') > 0) {
	$("#CurrCompany").text('保定站');
	$("#telePhone").text("15933241457");
	$("#companyPhone").text("公司电话:15933241457");
	$("#companyName").text("公司名称:北京三创装饰设计有限公司保定分公司");
	$("#companyAddress").text("公司地址:保定市新市区朝阳北大街658号发展大厦13层（市图书馆斜对面）");
	// 保定
} else if (url.indexOf('www.sczssjz.com') > 0) {
	$("#CurrCompany").text('石家庄站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:河北三创装饰设计有限公司");
	$("#companyAddress").text("公司地址:建设大街与华新路交口西北角东海国际9楼三创装饰冀ICP备16018312号-1");
	// 石家庄  
} else if (url.indexOf('sczssjz.com') > 0) {
	$("#CurrCompany").text('石家庄站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:河北三创装饰设计有限公司");
	$("#companyAddress").text("公司地址:建设大街与华新路交口西北角东海国际9楼三创装饰冀ICP备16018312号-1");
	// 石家庄  
} else if (url.indexOf('sjz.sc27800.com') > 0) {
	$("#CurrCompany").text('石家庄站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:河北三创装饰设计有限公司");
	$("#companyAddress").text("公司地址:建设大街与华新路交口西北角东海国际9楼三创装饰冀ICP备16018312号-1");
	// 天津  
} else if (url.indexOf('tj.sc27800.com') > 0) {
	$("#CurrCompany").text('天津站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:北京三创装饰设计有限公司天津分公司");
	$("#companyAddress").text("公司地址:天津市南开区黄河道永信大厦（北京商会大厦）A座13楼");
	// 唐山  
} else if (url.indexOf('ts.sc27800.com') > 0) {
	$("#CurrCompany").text('唐山站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:北京三创装饰设计有限公司唐山分公司");
	$("#companyAddress").text("公司地址:唐山市路北区钢窑路116号锅炉厂对面三创大厦2楼");
	// 廊坊  
} else if (url.indexOf('lf.sc27800.com') > 0) {
	$("#CurrCompany").text('廊坊站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:北京三创装饰设计有限公司廊坊分公司");
	$("#companyAddress").text("公司地址:");
	// 衡水  
} else if (url.indexOf('hs.sc27800.com') > 0) {
	$("#CurrCompany").text('衡水站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:");
	$("#companyName").text("公司名称:");
	$("#companyAddress").text("公司地址:");
	// 太原  
} else if (url.indexOf('ty.sc27800.com') > 0) {
	$("#CurrCompany").text('太原站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:北京三创装饰有限公司太原分公司");
	$("#companyAddress").text("公司地址:太原市小店区许坦东街锦东国际B座24层");
	// 北京  
} else {
	$("#CurrCompany").text('北京站');
	$("#telePhone").text("18034010917");
	$("#companyPhone").text("公司电话:18034010917");
	$("#companyName").text("公司名称:北京三创国际装饰设计有限公司");
	$("#companyAddress").text("公司地址:北京市朝阳区十里河古隆盛四层");
}







$("#link").children().attr("rel","nofollow");
$(function(){
	var url=window.location.href;
	var lastIndex=url.lastIndexOf("/");
	if((url.length-lastIndex)>1){
		$("#friendLink").hide();
	}
});

$("#FBaojia").find("input[type='text'],textarea").each(function() {
    var clue_on = $(this).closest(".table").find(".clue_on");
    $(this).attr('placeholder', clue_on.text());
    if(!$.browser.msie){
        $(this).focus(function(){$(this).attr("placeholder",'');});
        $(this).blur(function(){$(this).attr("placeholder", clue_on.text());});
    }
}).placeholder();
$(document).ready(function(){
    $("#FBaojia #sys_check").focus(function(){
        $("#FBaojia #imgcode").css({display:"block"}).animate({opacity: "1",top: 0},300);
    }).blur(function(){
        $("#FBaojia #imgcode").css({display:"none"}).animate({opacity: "0",top: "-20px"},300);
    });
    //底部报价器
    $("#closeBaojia").click(function(){
        $(".fBaojia").stop(true,true).animate({left:"-100%"},500,function(){
            $(".fBaojia-h").stop(true,true).animate({height:0},500,function(){
                $("#openBaojia").stop(true,true).animate({left:0},500);
            });
        });
    });
    $("#openBaojia").click(function(){
        $(this).stop(true,true).animate({left:-30},500,function(){
            $(".fBaojia").stop(true,true).animate({left:0},500,function(){
                $(".fBaojia-h").stop(true,true).animate({height:85},500);
            });
        });
    });
});
</script>    


<!--底部报价器结束-->

<!-- /底部 -->

${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
<script type="text/javascript">
	function back(){
		history.go(-1);
	}

</script>
</html>