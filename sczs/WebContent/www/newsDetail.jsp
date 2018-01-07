<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${news.seoTitle }</title>
<meta name="keywords" content="${news.seoKeyword }">
<meta name="description" content="${news.seoDesc }">
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
</head>
<body>
<!--header start-->
<div class="header">
 <jsp:include page="../public/head.jsp"/>
   <!--nav start-->
   <jsp:include page="../public/nav.jsp"/>
  <!-- nav end -->
</div>
<!--header end-->


<div class="huodong_main w1180">
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/"> ${cityCompany}装修</a> > <a href="${pageContext.request.contextPath }/specase/p1?type=说装修">说装修</a></div>
   <div class="list_huodong_title"> <div class="cont_anli_title"><p>上传时间：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p><h3 class="">【${type }】</h3></div></div>
    
    
    <!--左侧新闻列表-->
    <div class="clear">
    
    <div class="content_news_left fl">
      <div class="content_news_title"> ${news.title } </div>
      <div class="content_news_data">文章作者：${news.author } 上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;阅读数:${news.readNum }${cityCompany}家装公司<span id="url"></span></div>
     <%--  <div class="content_news_img"><img src="${news.thumbImg }" width="560" height="426"/></div> --%>
      <div class="content_news_con">${news.contents}</div>
      <div class="cont_page clear">
      
     	<c:if test="${newsUp.newsId >= 0}">
      	  <div class="page_prev fl">上一篇：<a href="${pageContext.request.contextPath}/newDetail?newsId=${newsUp.newsId }&type=${newsUp.type}">${newsUp.title }</a></div>
    	</c:if>
      	 <c:if test="${newsDown.newsId <= max}">
      	  <div class="page_next fr">下一篇：<a href="${pageContext.request.contextPath}/newDetail?newsId=${newsDown.newsId}&type=${newsDown.type}">${newsDown.title }</a></div>
      	</c:if>
        
      </div>
    </div>
     <div class="list_hd_right fr">
    <div class="anli_hxgh">
          <div class="anli_hxgh_title">
            <h3>免费申请户型规划</h3>
            <p>专业设计师提供全程一对一专业服务</p>
          </div>
          
           <form>    
            <p><input class="inp" type="text" id="clientName" name="clientName" placeholder="您的姓名" data-title="您的姓名"></p>
            <p><input class="inp" type="text" id="phone" name="phone" placeholder="您的手机号" data-title="您的手机号"></p>
            <p><input class="inp" type="text" id="address" name="address" placeholder="楼盘名称" data-title="楼盘名称"></p>
            <p><input class="inp" type="text" id="acreage" name="acreage" placeholder="房屋面积" data-title="房屋面积"></p>
            <p class=""><input type="button" onclick="bjbaoming();"class="sq"  value="免费申请"></p>
            <p>
	            <input type="hidden" id="orderId" name="orderId">
	            <input type="hidden" class="index-input-03" id="sourceType" name="sourceType" value="免费申请"/>
            </p>
          </form>
        </div>
 
    
    <div class="ej_tjwz">
      <h3>推荐文章</h3>
      
      <ul>
       	<c:forEach items="${newListNews}" var="news" begin="0" end="9">
  		    <li><span></span>
  		    	<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">${news.title }</a>
  		    </li>
      	</c:forEach>
      </ul>
    </div>
   </div>
   </div> 
   </div>
   
<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!--footer end--
<!--右侧悬浮 开始-->
<div class="floating_ck">
	<dl>
    	<dt></dt>
        <!-- <dd class="consult">
        	<span>在线咨询</span>
        	<div class="floating_left"><a href="javascript:void(0)">三创装饰在线咨询</a></div>
        </dd> -->
        <dd class="quote" onclick="faseMoney()">
        	<span>快速报价</span>
            <div class="floating_left"><a href="${ctx }/orderLine">索要产品报价</a></div>
        </dd>
        <dd class="qrcord">
        	<span>扫一扫</span>
            <div class="floating_left floating_ewm">
            	<i><img src="${homeTc.value }"/></i>
                <p class="qrcord_p01">扫一扫<br>扫描二维码</p>
               <p class="qrcord_p02">全国免费服务热线<br><b>${sessionScope.homeTp.value }</b></p>
            </div>
        </dd>
        <dd class="return">
        	<span onClick="gotoTop();return false;">返回顶部</span>
        </dd>
    </dl>
</div>
<!--右侧悬浮 结束-->


<script type="text/javascript">

$("#url").text(window.location.host);
var orderId = $("#orderId").val();

var now = new Date();
var year = now.getFullYear();
var month =(now.getMonth() + 1).toString();
var day = (now.getDate()).toString();
var hour = (now.getHours()).toString();
var minute = (now.getMinutes()).toString();
var second = (now.getSeconds()).toString();
var ms = (now.getMilliseconds()).toString();
if (month.length == 1) {
    month = "0" + month;
}
if (day.length == 1) {
    day = "0" + day;
}
if (hour.length == 1) {
    hour = "0" + hour;
}
if (minute.length == 1) {
    minute = "0" + minute;
}
  if (second.length == 1) {
    second = "0" + second;
} 
var dateTime = year + month +  day + hour + minute + second + ms;
 $("#orderId").val(dateTime);
 


function bjbaoming(){
	 var orderId = $("#orderId").val(); 
	 var clientName= $("#clientName").val();
	 var phone= $("#phone").val();
	 var address= $("#address").val();
	 var acreage= $("#acreage").val();
	 var sourceType= $("#sourceType").val();
	 if(clientName!="" && phone!="" && address!="" && acreage!=""){
		 /*  ,{'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType} */
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "${pageContext.request.contextPath}/saveOrder",
				data : {'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType},
				success : function(data) {
					if (data.data == "ok") {
						alert("请您稍等，稍后会有客服人员为您服务!");
					}else{
						
						alert("保存失败");
					}
				}
			});  
	 }else if(clientName==""){
		 alert("姓名不能为空,请填写姓名!");
	 }else if(phone==""){
		 alert("电话不能为空,请填写联系电话!");
	 }else if(address==""){
		 alert("楼盘名称不能为空,请填写楼盘名称!");
	 }else if(acreage==""){
		 alert("房屋面积不能为空,请填写房屋面积!");
	 }
}

	function faseMoney(){
		
		window.location.href="${ctx }/orderLine";
	}
</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
