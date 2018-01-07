<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${news.seoKeyword }"/>
<meta name="description" content="${news.seoDesc }"/>
<title>${news.seoTitle }</title>
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
	       <div class="ej_weizhi_left fl"><span>N</span>EWS &nbsp;新闻中心</div>
	       <div class="ej_local_right fr">您的当前位置：<a href="">首页</a>&nbsp;>>&nbsp;<a href="">新闻中心</a></div>
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
	          </div>
	          <ul>
	          <c:forEach items="${aCasesList }" var="cases" begin="0" end="2">
		          <li>
			          <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank">
			        		 <img src="${cases.caseThumbImg }" width="240" height="180"/>
			          </a>
			          <span>${cases.caseTitle }</span>
		          </li>
	          </c:forEach>
	          </ul>
	          
	        </div>
	  </div>
	  <div class="ej_news_right fr">
	    <div class="ej_news_con_tit"><h4>${news.title }</h4></div>
	    <div class="ej_news_con_data">文章作者：${news.author } |  上传更新：<fmt:formatDate value="${news.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
	    <div class="ej_news_con_img"><img src="images/alzs02.jpg" /></div>
	    <div class="ej_news_con_con">${news.contents}
	</div>
	<div class="ej_news_con_img"><img src="${ctx }images/alzs06.jpg" /></div>
	
	  
	  <div class="ej_news_con_page">
	    <div class="ej_page_prev fl">上一篇：<a href="">十三个必看客厅装修风水小常识</a></div>
	    <div class="ej_page_prev fr">下一篇：<a href="">别墅庭院40个装饰设计图解</a></div>
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
