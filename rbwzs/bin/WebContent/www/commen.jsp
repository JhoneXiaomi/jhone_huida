<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
<title>${statScinterHomeSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
</head>

<body>
	<!--header start-->
	<jsp:include page="public/header.jsp" />
	<!--header end-->
	  
	<!--nav start-->
	<jsp:include page="public/nav.jsp" />
	<!--nav end-->
	
	<!--二级页面  主体部分 start-->
	
	<div class="ej_main">
	 
	  <div class="ej_weizhi">
	     <div class="w1200 clearfix">
	       <div class="ej_weizhi_left fl"><span>C</span>OMMON PROBLEM &nbsp;常见问题</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="${ctx }/">首页</a>&nbsp;>>&nbsp;<a href="javascript:void(0)">常见问题</a></div>
	     </div> 
	  </div>
	  
	  <!--新闻详情 start-->
	 <div class="ej_news_con w1200 clearfix">
	  <div class="ej_news_left fl">
	    
	    <div class="anli_hxgh">
	          <div class="anli_hxgh_title">
	            <h3>免费申请户型规划</h3>
	            <!--<p>专业设计师提供全程一对一专业服务</p>-->
	          </div>
	          
	          <form>
	            <p><input class="inp" type="text" name="name" placeholder="您的姓名" data-title="您的姓名"></p>
	            <p><input class="inp" type="text" name="phone" placeholder="您的手机号" data-title="您的手机号"></p>
	            <p><input class="inp" type="text" name="lp" placeholder="楼盘名称" data-title="楼盘名称"></p>
	            <p><input class="inp" type="text" name="acreage" placeholder="房屋面积" data-title="房屋面积"></p>
	            
	            <select name="Links$fangshi" id="Links_fangshi">
		           <option value="东南亚风格">东南亚风格</option>
		           <option value="混搭风格">混搭风格</option>
		           <option value="简约风格">简约风格</option>
		           <option value="美式风格">美式风格</option>
		           <option value="欧式风格">欧式风格</option>
		           <option value="地中海风格">地中海风格</option>
		           <option value="中式风格">中式风格</option>
		           <option value="田园式风格">田园式风格</option>
	            </select>
	            
	            <select name="Links$fangshi" id="Links_fangshi">
		           <option value="基础装修">基础装修</option>
		           <option value="全包">全包</option>
	            </select>
	            
	            <p class=""><input type="submit" class="sq" value="免费申请"></p>
	            <p></p>
	          </form>
	        </div>
	        
	        
	        <div class="tjanli">
	          <div class="anli_hxgh_title">
	            <h3>推荐案例</h3>
	            <!--<p>专业设计师提供全程一对一专业服务</p>-->
	          </div>
	          
	          <ul>
	          	<c:forEach items="${casesList }" var="cases" begin="0" end="2">
	          	 <li>
	          	 <a href="">
	          	 <img src="${cases.caseThumbImg }" width="240" height="180"/>
	          	 </a><span>${cases.caseTitle }</span>
	          	 </li>
	          	</c:forEach>
	          </ul>
	          
	        </div>
	  </div>
	  <div class="ej_news_right fr">
	  
	   <div style="margin-top:20px;"></div>
	  <div class="bigTitle">常见问题</div>
	     <div class="ej_changjianwenti">
			<c:forEach items="${faqLists }" var="faq" >
	  
		  	 <dl>
		  	    <dt><h3>${faq.faqDesc }</h3></dt> 
			    <dd>
	
				   ${faq.faqAnswer }
				   <p>创建时间:<fmt:formatDate value="${faq.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			    </dd>   
		     </dl>
		  </c:forEach> 	       
	     </div>
	     
	     
	     <div class="Page clearfix">
	     
       	 <c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/commen/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#009c42;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/commen/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/commen/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/commen/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
       </div> 
	  </div>
	     
	     
	  </div>
	 </div>
	  <!--新闻详情 end-->
	    
   		 <div class="clearfix"></div>
	</div>
	<!--二级页面  主体部分 end-->
	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
</body>
</html>
