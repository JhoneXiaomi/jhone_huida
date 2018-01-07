<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>      
<!doctype html>
<html>
<head>
	<title>${scinterPackageSeoTitle.value }</title>
	<link type="text/css" rel="stylesheet" href="${ctx }/mobile/css/style.css">
	<script src="${ctx }/mobile/js/jquery.min.js"></script>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
	<meta name="keywords" content="${scinterPackageSeoKeyword.value }">
	<meta name="description" content="${scinterPackageSeoDesc.value }">
	<style type="text/css">
		/*sc588套餐 start*/
		.xtcmain_img{ font-size:0;}
		.xtcmain_img0{ font-size:0;}
		
		.xtcmain { width:100%; margin:0 auto;}
		.xtcmain_img { font-size:0; }
		.inputbm{  width:100%; text-align:center;margin-top:-38px;}
		.xtcmain_img input{ margin:0 auto; text-align:center; background:url(mobile/images/zztcAll/tcbj01.png) no-repeat; width:136px; color:#fff; font-size:17px; cursor:pointer;height:37px;  }
			
		.inputcen{  width:100%; text-align:center}
		.inputcen input{ background:url(mobile/images/zztcAll/tcbj02.png) no-repeat; color:#fff; font-size:24px; width:292px; height:65px; cursor:pointer; margin-bottom:10px; margin-top:10px;}
		
		
		.inputcen02{ background:#ed090a; width:100%; text-align:center;}
		.inputcen02 input{ background:url(mobile/images/zztcAll/tcbj03.png) no-repeat; color:#5d5d5d; font-size:24px; width:292px; height:65px; cursor:pointer; margin-bottom:10px; margin-top:10px;}
		
		.inputcen_bacr { background:#f7000e; padding-top:20px;  width:100%; text-align:center; padding-bottom:20px; margin-bottom:20px;}
		.inputcen_bacr input{ background:url(mobile/images/zztcAll/tcbj03.png) no-repeat;  font-size:24px; width:292px; height:65px; cursor:pointer; color:#5d5d5d;}
		
		.inputcenc{ background:url(mobile/images/zztcAll/sc588_03.jpg) no-repeat;  width:100%; text-align:center; height:80px; }
		.inputcenc input{ background:url(mobile/images/zztcAll/tcbj03.png) no-repeat;  font-size:24px; width:292px; height:65px; cursor:pointer; color:#5d5d5d; }
		
		.inputcend { background:url(mobile/images/zztcAll/sc588_09.jpg) no-repeat;  width:100%; text-align:center;padding-top:20px; padding-bottom:15px;}
		.inputcend input{ background:url(mobile/images/zztcAll/tcbj02.png) no-repeat; color:#fff; font-size:24px; width:292px; height:65px; cursor:pointer;}
		
		.inputcene { background:#ed090a;  width:100%;text-align:center; padding-top:20px; padding-bottom:20px;}
		.inputcene input{background:url(mobile/images/zztcAll/tcbj03.png) no-repeat;  font-size:24px; width:292px; height:65px; cursor:pointer; color:#5d5d5d;}
		
		.inputcenf{ background:url(mobile/images/zztcAll/sc588_51.jpg) no-repeat; width:100%; height:472px;}
		.inputcenf input { background:url(mobile/images/zztcAll/tcbj03.png) no-repeat; font-size:24px; width:292px; height:65px; cursor:pointer; margin-top:380px; margin-left:30px; color:#5d5d5d;}
		
		
		.inputcen01{  width:100%;  background:url(mobile/images/zztcAll/sc588_01.jpg) no-repeat; background-size: 100% 100%;height:361px; text-align:center;}
		.inputcen01 input{ background:url(mobile/images/zztcAll/tcbj01.png) no-repeat; font-size:18px; color:#fff; width:136px; height:38px; cursor:pointer; margin-top:280px;}
		.xtcmain img{width:100%;}
	</style>
</head>
<body>

<div class="mList_title fl">
        <h3>【 装修套餐 】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="javascript:void(0)">装修案例</a></div>
<div class="xtcmain">
<div class="xtcmain_img">
      <img class="po" src="${ctx}/mobile/images/zztcAll/sc588_01.jpg">
      <div class="inputbm"><a href=""><input style="padding-bottom:10px" class="mfzx" type="submit" value="免费咨询报价"/></a></div>
  </div>
  
  <div class="xtcmain_img0">
  
  <!-- <div class="inputcen01"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询报价"/></a></div> -->
   <img src="${ctx}/mobile/images/sczs/588/sc_588_01.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_02.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_03.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_04.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_05.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_06.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_07.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_08.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_09.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_10.jpg"/>
   <img src="${ctx}/mobile/images/sczs/588/sc_588_11.jpg"/>
  <%-- 
    <img src="${ctx}/mobile/images/zztcAll/sc588_02.jpg">
    
     <div class="inputcenc"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询588全包套餐"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_04.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_07.jpg">
      
      <div class="inputcen"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询可服务城市"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_08.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_09top.jpg">
    <!--<img src="${ctx}/mobile/images/zztcAll/sc588_09.jpg">-->
    
     <div class="inputcend"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询装修报价"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_11.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_13.jpg">
    
     <div class="inputcen"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询全包服务"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_15.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_17.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_18.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_19.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_20.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_21.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_22.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_23.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_27.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_28.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_30.jpg">
    
     <div class="inputcen"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询空间配置"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_31.jpg">
    
    <div class="inputcen02"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="详情咨询客服"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_32.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_35.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_36.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_37.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_39.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_40.jpg">
    
     <div class="inputcen"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询三创主材"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_42.jpg">
    
    <div class="inputcene"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询三创辅材"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_45.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_46.jpg">
    
    <div class="inputcen"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击咨询三创保障"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_48.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_49.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_50.jpg">
    <!--<img src="${ctx}/mobile/images/zztcAll/sc588_51.jpg">-->
    
    <div class="inputcenf"><a href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn" target="_blank"><input class="" type="submit" value="点击预约设计师"/></a></div>
    
    <img src="${ctx}/mobile/images/zztcAll/sc588_53.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_55.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_56.jpg">
    <img src="${ctx}/mobile/images/zztcAll/sc588_57.jpg">
    
    <div class="inputcen_bacr"><a href="http://m.sc27800.com/about" target="_blank"><input class="" type="submit" value="点击了解三创装饰公司"/></a></div> --%>
    
  </div>
  
</div><script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>


<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->
<script language="javascript">
	var LiveAutoInvite0='您好，来自%IP%的朋友';
	var LiveAutoInvite1='来自首页的对话';
	var LiveAutoInvite2=' 网站商务通 主要功能：<br>1、主动邀请<br>2、即时沟通<br>3、查看即时访问动态<br>4、访问轨迹跟踪<br>5、内部对话<br>6、不安装任何插件也实现双向文件传输<br><br><b>如果您有任何问题请接受此邀请以开始即时沟通</b>';
	</script>
	<script language="javascript" src="http://pht.zoosnet.net/JS/LsJS.aspx?siteid=PHT90969211&float=1&lng=cn"></script>

</body>
</html>
