<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/public/shangqiao.jsp" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>      
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${type}_装修新闻-${cityCompany}三创装饰公司</title>
<meta name="keywords" content="${scinterSpeSeoKeywordStr.value }">
<meta name="description" content="${scinterSpeSeoDescStr.value }">
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
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
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/">${cityCompany}装修</a>> > <a href="">说装修</a></div>
   <div class="list_huodong_title"> <div class="cont_anli_title"><h3 class="">【${type }】</h3></div></div>
    
    <div class="list_huodong fl">
      <ul>
        <c:forEach items="${newsList }" var="news" varStatus="status">
        	<c:if test="${(status.index+1) % 2 != 0}" > 
        	
			    <li >
		          <div class="huodong_img"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }"><img src="${news.thumbImg }" width="390" height="297" alt="${news.title }"/></a></div>
		          <div class="huodong_tit"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }" style="color: #ff7200;">${news.title }</a></div>
		          <div class="huodong_con"  style="height: 78;">
			          <c:choose>
			          		<c:when test="${fn:length(news.contents) >= 90}">
				                ${fn:substring(news.contents, 0, 90)}...
			          		</c:when>
			          		<c:otherwise> ${news.contents}</c:otherwise>
			          </c:choose>
		          </div>
		          <div class="huodong_data">日期：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;<p class="more fr"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}" style="color: #fff;">活动详情</a></p></div>
		        </li>       	
        	</c:if>
			<c:if test="${(status.index+1) % 2 == 0}" > 
        	
			    <li class="no_mar">
		          <div class="huodong_img"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }"><img src="${news.thumbImg }" width="390" height="297" alt="${news.title }"/></a></div>
		          <div class="huodong_tit"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }" style="color: #ff7200;">${news.title }</a></div>
		          <div class="huodong_con" style="height: 78;">
						<c:choose>
			          		<c:when test="${fn:length(news.contents) >= 90}">
			          		
				               ${fn:substring(news.contents, 0, 90)}...
			          		</c:when>
			          		<c:otherwise> ${news.contents}</c:otherwise>
			            </c:choose>		          		          
		          </div>
		          <div class="huodong_data">日期：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;<p class="more fr"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}" style="color: #fff;">活动详情</a></p></div>
		        </li>         	
        	</c:if>        
        
        </c:forEach>
        
      </ul>
      
      
      <div class="clearfix"></div>
      <div class="list_page">
       <div class="Page clearfix">
       	
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/specase/p${page.pageNo-1 }?type=${type}">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         
         	<!-- 2016-08-02 张志为  添加type 参数 -->
         	<%-- <a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/spec/p${i }?type=${type}">&nbsp;${i}&nbsp;</a> --%>
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/specase/p${i }?type=${type}">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/specase/p${page.pageNo+1 }?type=${type }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/specase/p${page.pageCount }?type=${type}">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
       </div>
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
         <c:forEach items="${listNews2}" var="news" begin="0" end="9">
  		    <li><span></span>
  		    	<!-- 2016-08-02   张志伟 修改 添加type 参数，-->
  		    	<%-- <a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}">${news.title }</a> --%>
  		    	<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">${news.title }</a>
  		    </li>
      	 </c:forEach>
      </ul>
    </div>
   </div>  
</div>
<div class="clearfix"></div>

<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!--footer end--
<!--右侧悬浮 开始-->
<jsp:include page="../public/fastToTop.jsp"/>
<!--右侧悬浮 结束-->
	<script type="text/javascript">
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
		 var  orderId = $("#orderId").val();
		 var clientName= $("#clientName").val();
		 var phone= $("#phone").val();
		 var address= $("#address").val();
		 var acreage= $("#acreage").val();
		 var sourceType= $("#sourceType").val();
		 var branchCompany = '${sessionScope.branchCompany}';
		 if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && address!="" && acreage!=""){
			 $.ajax({
					type : "POST",
					dataType : "json",
					async: false,
					url : "${pageContext.request.contextPath}/saveOrder",
					data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType},
					success : function(data) {
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
							 return false;
						}else{
							
							alert("保存失败");
							return false;
						}
					}
				});  
		 }else if(clientName==""){
			 alert("姓名不能为空,请填写姓名!");
			 return false;
		 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			 alert("手机号格式不正确,请填写手机号!");
			 return false;
		 }else if(address==""){
			 alert("楼盘名称不能为空,请填写楼盘名称!");
			 return false;
		 }else if(acreage==""){
			 alert("房屋面积不能为空,请填写房屋面积!");
			 return false;
		 }
	}
	/* 分站查询 */
	$(document).ready(function(){ 
		
		$('#BCompany').change(function(){ 
	//	alert($(this).children('option:selected').val()); 
		var p1=$(this).children('option:selected').val();//这就是selected的值 
		
		window.location.href="${pageContext.request.contextPath}/specase/p1?type=说装修&BranchComp="+p1;
		});
		}); 
		function faseMoney(){
			
			window.location.href="${ctx }/orderLine";
		}
	</script>
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }
</body>
</html>