<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>三创装饰 | 设计团队</title>
<link type="text/css" href="${pageContext.request.contextPath}/www/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/list_pic.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
</head>

<body>


<body  onload="setTimeout(function() { window.scrollTo(0, 1) }, 100);">
<!--header start-->
<div class="header">
 <div class="top_line"> 
  <div class="head_top  w1180">
   <div class="top_local fl">
        <span>当前站： <span id="CurrCompany" style="color:#f39800;"></span>&nbsp;&nbsp;&nbsp;&nbsp;三创装饰全国分站：</span>
            <a href="http://www.sc27800.com">北京</a>&nbsp;&nbsp;&nbsp;
            <a href="http://tj.sc27800.com">天津</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://lf.sc27800.com">廊坊</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://sjz.sc27800.com">石家庄</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://hs.sc27800.com">衡水</a>&nbsp;&nbsp;&nbsp;
	        <a href="http://bd.sc27800.com">保定</a>&nbsp;&nbsp;&nbsp;
	        
	        
	        	
    </div>
    <div class="top_wel fr" id="div_CurrCompany"></div>
  </div>
  </div>
  
  <div class="logotel w1180 clearfix">
    <div class="logo fl"><img src="${sessionScope.homeLogo.value }"></div>
    <div class="telqq fr">
      <div class="tel fl"><span><img src="${pageContext.request.contextPath}/www/images/tel.png"></span><p>电话咨询：</p><p>${sessionScope.homeTp.value }</p></div>
    </div>
  </div>
</div>

  <!--nav start--> 
  <jsp:include page="../public/nav.jsp"/>
  <!--nav end-->  
  
  
  <div class="list_main w1180">
     <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/"> ${cityCompany}装修</a> > <a href=""> 设计团队</a></div>
	 <div class="list_al clearfix">
	 <c:forEach items="${designerList }" var="designer" varStatus="status">
	      		 <c:if test="${(status.index+1) % 4 != 0}">
					 <dl>
				        <div class="list_pic">
					        <a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">
					        	<img src="${designer.designerPhotoImg }" width="295" height="393">
					        </a>
				        </div>
				        <dd>
				          <div class="list_info">
				            <a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">
				            		<span>设计师:&nbsp;&nbsp;<b style="color:#f39800">${designer.designerName }</b></span>
				            </a> 
				            <span style="color:#f39800">从业时间:&nbsp;&nbsp;${designer.designerWorkTime }</span>
				            <div class="list_p_yy"><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">预约</a></div>
				          </div>
				        </dd>
				      </dl>	      		 	      		
	      		 </c:if>
	      		 <c:if test="${(status.index+1) % 4 == 0}">
				 <dl class="no_mar">
			           <div class="list_pic">
					        <a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">
					        	<img src="${designer.designerPhotoImg }" width="295" height="393">
					        </a>
				        </div>
				        <dd>
				          <div class="list_info">
				            <a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">
				            		<span>设计师:&nbsp;&nbsp;<b style="color:#f39800">${designer.designerName }</b></span>
				            </a> 
				            <span style="color:#f39800">从业时间:&nbsp;&nbsp;${designer.designerWorkTime }</span>
				            <div class="list_p_yy"><a href="${pageContext.request.contextPath}/designerMessage/p1?designerId=${designer.designerId}">预约</a></div>
				          </div>
				        </dd>
			      </dl>			 		   		
	      		</c:if>
	      </c:forEach> 
	 

	      </div>       
    
    <div class="list_page">
       <div class="Page clearfix">
	 	<c:if test="${page.pageNo > 1}" >
         	<a href="${pageContext.request.contextPath}/designer/p${page.pageNo-1 }">上一页</a>     
         </c:if>
         <c:if test="${page.pageNo <= 1}" >
         	<a href="javascript:void(0);">上一页</a>     
         </c:if>
         
         <c:forEach var="i" begin="1" end="${page.pageCount}">
         	<a <c:if test='${page.pageNo == i }'>style="background-color:#f39800;color:#FFF;"</c:if> href="${pageContext.request.contextPath}/designer/p${i }">&nbsp;${i}&nbsp;</a>
		 </c:forEach>
		 
		 <c:if test="${page.pageNo < page.pageCount}" >
         	<a href="${pageContext.request.contextPath}/designer/p${page.pageNo+1 }">下一页</a>
         </c:if>
         <c:if test="${page.pageNo >= page.pageCount}" >
         	<a href="javascript:void(0);">下一页</a>     
         </c:if>
         
         <a href="${pageContext.request.contextPath}/designer/p${page.pageCount }">最后一页</a> <span>${page.totalRecords }条记录 ${page.pageNo }/${page.pageCount } 页</span>
          
       </div>
    </div>
    
    
    
    <div class="list_per_lc">
      <div class="list_title">
        <h3>装修流程</h3>
        <span><a href="">查看更多>></a></span>
      </div>
      <!--流程 start-->
      <div class="clear"></div>
      <div class="Tech w1180">
        <a href=""><div class="tech_con"><img src="${pageContext.request.contextPath}/www/images/tech01.jpg"><span>在线预约</span><img src="${pageContext.request.contextPath}/www/images/jiantou01.jpg"></div></a>  
        <a href=""><div class="tech_con"><img src="${pageContext.request.contextPath}/www/images/tech02.jpg"><span>上门量房</span><img src="${pageContext.request.contextPath}/www/images/jiantou01.jpg"></div></a>
        <a href=""><div class="tech_con"><img src="${pageContext.request.contextPath}/www/images/tech03.jpg"><span>方案设计</span><img src="${pageContext.request.contextPath}/www/images/jiantou01.jpg"></div></a>
        <a href=""><div class="tech_con"><img src="${pageContext.request.contextPath}/www/images/tech04.jpg"><span>施工装修</span><img src="${pageContext.request.contextPath}/www/images/jiantou01.jpg"></div></a>
        <a href=""><div class="tech_con"><img src="${pageContext.request.contextPath}/www/images/tech05.jpg"><span>验收竣工</span><img src="${pageContext.request.contextPath}/www/images/jiantou01.jpg"></div></a>
      <div class="zx"><a href="">立即在线预约</a></div>
</div>
<!--流程 end-->
       
    </div>
      <!--  推荐文章 start-->  
 <div class="list_txt">
      <div class="list_title">
        <h3>您可能喜欢以下文章</h3>
        <span><a href="">查看更多>></a></span>
      </div>
    <div class="slide_m1 clearfix fixed"> <a href="javascript:;" id="LeftID3" class="btn btn_l"></a>
      <div class="slide_c list_txt_con" id="ScollName3">
        <ul>
	   		 <c:forEach items="${listNews }" var="news">
			  <li>
	            <div class="list_txt_info clearfix">
	            	
		 			<a href="${pageContext.request.contextPath}/newDetail?newsId=${news.newsId}&type=${news.type}">
		              <span></span><img src="${news.thumbImg }" width="180" height="137"></span>
		              <h4>${news.title }</h4>
		            </a>	             
	            </div>
	          </li>	        
	        </c:forEach>    		
        </ul>
      </div>
      <a href="javascript:;" id="RightID3" class="btn btn_r"></a> </div>
    <script>
	   $(function() {
			var ads = new ScrollPicleft();
			ads.scrollContId = "ScollName3"; // 内容容器ID""
			ads.arrLeftId = "LeftID3"; //左箭头ID
			ads.arrRightId = "RightID3"; //右箭头ID
	
			ads.frameWidth = 1130; //显示框宽度
	
			ads.pageWidth = 1; //翻页宽度
	
			ads.speed = 1; //移动速度(单位毫秒，越小越快)
			ads.space = 1; //每次移动像素(单位px，越大越快)
			ads.autoPlay = true; //自动播放
			ads.autoPlayTime = 0.03; //自动播放间隔时间(秒)
	
			ads.initialize(); //初始化
		});
     </script>
      <div class="clearfix"></div>
    </div>
    
<!--    推荐文章 end-->
</div>

<div class="clearfix"></div>
<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!-- footer end -->
</body>
</html>
