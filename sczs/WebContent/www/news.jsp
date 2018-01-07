<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>${scinterNewsSeoTitleStr.value }</title>
<meta name="keywords" content="${scinterNewsSeoKeywordStr.value }">
<meta name="description" content="${scinterNewsSeoDescStr.value }">
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
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/">${cityCompany}装修</a> > <a href=""> 热门活动</a></div>
   <div class="list_huodong_title"> <div class="cont_anli_title"><!-- <p>上传时间：2016-07-23</p> --><h3 class="">【公司动态】</h3></div></div>
    
    
    <!--左侧新闻列表-->
    <div class="clear">
    <div class="list_news fl">
       <ul>
       <c:forEach items="${listNews }" var="news">
         <li class="clear">
           <div class="list_news_img fl"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}"><img src="${news.thumbImg }" width="280" height="213" alt="${news.title }"></a></div>
           <div class="list_newsinfo fr">
             <h3><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }">${news.title }</a></h3>
             <p>4月2号11:00-12:00　有关部门数据显示，24日8时到25日8时，河北省大部地区出现降雨天气，降水区平均降水量为21.9毫米，张家口西北部、保定、石家庄中北部、廊坊南部、沧州西北部、衡水北部、承德南部、唐山北部、秦皇岛北部有258个乡镇雨量超过50毫米....</p>
             <div class="list_data clear">
                <div class="list_news_data fl">上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd"/></div>
                <div class="list_news_more fr"><a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type }">查看详情 </a></div>
             </div>
           </div>
         </li>
	  </c:forEach>
       </ul>
       
         <div class="clearfix"></div>
         
	     <div class="list_page">
	       <div class="Page clearfix">
	       	
	       	 <c:if test="${page.pageNo > 1}" >
	         	<a href="${pageContext.request.contextPath}/news/p${page.pageNo-1 }">上一页</a>     
	         </c:if>
	         <c:if test="${page.pageNo <= 1}" >
	         	<a href="javascript:void(0);">上一页</a>     
	         </c:if>
	         
	         <c:forEach var="i" begin="1" end="${page.pageCount}">
	         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/news/p${i }?type=${type}">&nbsp;${i}&nbsp;</a>
			 </c:forEach>
			 
			 <c:if test="${page.pageNo < page.pageCount}" >
	         	<a href="${pageContext.request.contextPath}/news/p${page.pageNo+1 }?type=${type}">下一页</a>
	         </c:if>
	         <c:if test="${page.pageNo >= page.pageCount}" >
	         	<a href="javascript:void(0);">下一页</a>     
	         </c:if>
	         
	         <a href="${pageContext.request.contextPath}/news/p${page.pageCount }?type=${type}">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
	       </div>
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
            <p><input class="inp" type="text" name="name" placeholder="您的姓名" data-title="您的姓名"></p>
            <p><input class="inp" type="text" name="phone" placeholder="您的手机号" data-title="您的手机号"></p>
            <p><input class="inp" type="text" name="lp" placeholder="楼盘名称" data-title="楼盘名称"></p>
            <p><input class="inp" type="text" name="acreage" placeholder="房屋面积" data-title="房屋面积"></p>
            <p class=""><input type="submit" class="sq" value="免费申请"></p>
            <p></p>
          </form>
        </div>
 
    
    <div class="ej_tjwz">
      <h3>推荐文章</h3>
      
      <ul>
        <c:forEach items="${newListNews}" var="news" begin="0" end="9">
  		    <li><span></span>
  		    	<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}">${news.title }</a>
  		    </li>
      	</c:forEach>
      </ul>
    </div>
   </div>
    
    
</div>





<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
