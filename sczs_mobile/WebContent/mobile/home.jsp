<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>   
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
	<meta name="description" content="${statScinterHomeSeoDesc.value }">
	<title>${statScinterHomeSeoTitle.value }</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css">
	<script type="text/javascript" src="${ctx }/mobile/js/jquery.min.js"></script>
	<script src="${ctx }/mobile/js/snap.svg-min.js"></script>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery.js"></script>
	<script type="text/javascript" src="${ctx }/mobile/js/hhDrop.js"></script>
	<script src="${ctx }/mobile/js/jquery-1.7.2.min.js"></script>
	<script>
		
		
		$(document).ready(function(){
		  $("button").click(function(){
		  $(".xlcity").toggle();
		  });
		});
	  $(function(){
	    $('#hhDrop00').hhDrop({});
	    $('#hhDrop01').hhDrop({});    
	  });
	</script>
</head>
<body>
<script src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
<script src="${ctx }/mobile/js/jquery.mmenu.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('nav#menu').mmenu();
	});
</script>
<div class="wrap">

    <!-- 代码 开始 -->
    
	<div id="page">
		<header>
	    	<div class="l_tbn"><a href="#menu" class="glyphicon glyphicon-th-large"></a></div>
	    </header>
	    <div class="content"></div>
		<nav id="menu">
	        <ul>
	            <li class="Selected"><a href="${pageContext.request.contextPath}/">网站首页</a></li>
	            <li><a href="${pageContext.request.contextPath}/zztcAll?key=588">整装套餐</a></li>
				<li><a href="${pageContext.request.contextPath}/mobile/688.jsp">688套餐</a></li>
				<li><a href="${pageContext.request.contextPath}/zztcAll?key=588">588套餐</a></li>
				<li><a href="${pageContext.request.contextPath}/mobile/299.jsp">299套餐</a></li>
	            <li><a href="${pageContext.request.contextPath}/cases">设计案例</a></li>
	            <li><a href="${pageContext.request.contextPath}/designer">设计师</a></li>
	            <li><a href="${pageContext.request.contextPath}/lanzuan">蓝钻工艺</a></li>
	            <li><a href="${pageContext.request.contextPath}/Morder">三创服务</a></li>
	            <li><a href="${pageContext.request.contextPath}/about">了解三创</a></li>
	        </ul>
	    </nav>
	</div>
  <!-- 代码 结束 -->
  <!--头部--> 
  <div class="header">
     <div class="mLogo fl" style="width: 108px;"><img src="${MhomeLo.value }"></div>
      <div class="lineSearch fl">
      <ul>
      <li class="thRelative" id="hhDrop00">
        <div class="boxSearch">
          <span class="key_word">
            <b class="size_14"  id="myCompany"></b>
          </span>
          <em class="ico thLeft ico_shBlue"></em>
        </div>
        <div class="search_form_suggest" style="display:none;">
          <h3><a class="ico btn_close thRight" item="close">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关闭</a>&nbsp;&nbsp;&nbsp;公司分站</h3>
          <dl class="search_hotList">
            <dd class="clr_after">
              <a href="http://m.sc27800.com">北京</a>
	          <a href="http://mtj.sc27800.com">天津</a>
	          <a href="http://mlf.sc27800.com">廊坊</a>
	          <a href="http://mhs.sc27800.com">衡水</a>
	          <a href="http://mbd.sc27800.com/">保定</a><br/>
	          <a href="http://mts.sc27800.com">唐山</a>
	          <a href="http://mty.sc27800.com">太原</a>
	          <a href="http://msjz.sc27800.com">石家庄</a>
            </dd>
          </dl>
          <div class="clear"></div>
        </div>
      </li>
     </ul>
     </div>
  </div>
    
  <!-- 代码 开始 -->
    <div class="banner">
    <div class="slide_container">
      <ul class="rslides" id="slider">
        <c:forEach items="${MhomeTurn}" var="homeTurn" >
        	<a href="${homeTurn.homeimgUrl }">
            	<img src="${homeTurn.homeimgSrc }" name="${homeTurn.homeimgName }" title="${homeTurn.homeimgName }" width="100%">	
            </a>	 	
      	</c:forEach>
      </ul>
    </div>
   </div>
<!-- 代码 结束 -->
  <!--banner end-->
  <!-- 主体部分 nMain start-->
  <div class="mMain">
    <!--nNav start-->
      <div class="mNav">
        <a href="${pageContext.request.contextPath}/zztcAll?key=588"><img src="${ctx }/mobile/images/mNav_01.png"><span>装修套餐</span></a>
        <a href="${ctx }/cases"><img src="${ctx }/mobile/images/mNav_02.png"><span>装修案例</span></a>
        <a href="${ctx }/designer"><img src="${ctx }/mobile/images/mNav_03.png"><span>设计师</span></a>
        <a href="${ctx }/Mspec"><img src="${ctx }/mobile/images/mNav_04.png"><span>热门活动</span></a>
      </div>

    <!--案例案例 start-->
       <div class="mCase">
         <div class="mTitle">
           <h3>装修案例</h3>
          
         </div>  
             
       <!--案例开始-->      
           
           <div class="i_box">
             <div class="i_imglist">
               <ul id="J_imgList">
                <c:forEach items="${CasesLists}" var="cases" begin="0" end="4">
                   <li>
	                   <a href="${ctx }/casesDetail?casesId=${cases.caseId}&designerId=${cases.designerId}">
	                     <img src="${cases.caseThumbImg }" alt="${cases.caseTitle }" title="${cases.caseTitle }" />
	                     <p>${cases.caseTitle}</p>
	                   </a>  
	                    
                   </li>
               </c:forEach>
               </ul>
             </div><!--切换大图-->
</div>
	  <script type="text/javascript" src="${ctx }/mobile/js/script.js"></script>    
	 </div>
    <!--案例案例 end-->
    <div class="clear"></div>
    
    
    
    
    <!--装修风格 start-->
    <c:choose>
    	<c:when test="${currentBCompany == 'tysc'}">
	    <div style="background-color: #ff0b0b;text-align: center;">
	    	<a href="https://static.meiqia.com/dist/standalone.html?_=t&eid=94308"><img width="100%" alt="" src="${ctx }/mobile/images/home/01.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=0f82fae6f0ef11e78f0a5f816d9dc91c"><img width="48%" alt="" src="${ctx }/mobile/images/home/03.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=af4e0957f0ee11e78f0a5f816d9dc91c"><img width="48%"alt="" src="${ctx }/mobile/images/home/04.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=992bb8d0f0ee11e78f0a5f816d9dc91c"><img width="48%" alt="" src="${ctx }/mobile/images/home/05.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=4667f2c7f0ef11e78f0a5f816d9dc91c"><img width="48%" alt="" src="${ctx }/mobile/images/home/06.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=fd30088af0ee11e78f0a5f816d9dc91c"><img width="48%" alt="" src="${ctx }/mobile/images/home/07.jpg"/></a>
	    	<a href="http://m.sc27800.com/mActicityDetail?newsId=e349290bf03411e78f0a5f816d9dc91c"><img width="48%" alt="" src="${ctx }/mobile/images/home/08.jpg"/></a>
	    </div>
    </c:when>
    <c:otherwise>
			<div class="mFeng">
		       <div class="mTitle">
		         <h3>装修风格</h3>
		       </div>
		        <div class="mFeng_con clearfix">
		          <ul class="clearfix" id="clearStyle">
		            <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=现代简约">现代简约</a></li>
		            <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=混搭风格">混搭风格</a></li>
		            <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=中式风格">中式风格</a></li>
		             <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=美式乡村">美式乡村</a></li>
		            <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=地中海">地中海</a></li>
		            <li><a href="${pageContext.request.contextPath}/cases?CaseStyle=北欧风格">北欧风格</a></li>
		           
		            <li><a href="${pageContext.request.contextPath}/cases">其他</a></li>
		          </ul>
		        </div>          
		    </div>    	    
    </c:otherwise>
    </c:choose>
   <!--装修风格 end--> 
    
    <div class="mPeo">
       <div class="mTitle">
         <h3>设计师</h3>
        
       </div>
       <ul class="clearfix">
       	<c:forEach items="${designerLists }" var="designer" begin="0" end="5">
       	  <li>
	       	  <a href="${ctx }/MdesignerDetail?designerId=${designer.designerId}">
	       	 	 <img src="${designer.designerPhotoImg }" alt="${designer.designerName }" style="width: 93px; height: 128px;">
	       	  </a>
	       	  <p>${designer.designerName }</p>
       	  </li>
       	</c:forEach>
       </ul>
    </div>
    <div class="clear"></div>
    <div class="mLc">
      <div class="mTitle">
         <h3>服务流程</h3>
        
       </div>
      
         <div class="mLc_con">
           <img src="${ctx }/mobile/images/tech01.jpg" />
           <a style="color:#333;" href="${ctx}/Morder"><span>在线预约</span></a>
         </div>
     
         <div class="mLc_con">
           <img src="${ctx }/mobile/images/tech02.jpg" />
           <span>上门量房</span>
         </div>
         <div class="mLc_con">
           <img src="${ctx }/mobile/images/tech03.jpg" />
           <span>方案设计</span>
         </div>
         <div class="mLc_con">
           <img src="${ctx }/mobile/images/tech04.jpg"/>
           <span>施工装修</span>
         </div>
         <div class="mLc_con">
           <img src="${ctx }/mobile/images/tech05.jpg"/>
           <span>验收竣工</span>
         </div>
    </div>
    <div class="clearfix"></div>
    <!--新闻中心 start-->
      <div class="mNews">
        <div id="tab">
        <h3 class="up" id="two1" onmouseover="setContentTab('two',1,3)">行业资讯</h3>
        <div class="block head_div" id="con_two_1">
            <ul>
                <li class="clear">
                  <div class="mNews_img fl"  >
	                  <a href="${ctx }/newDetail?newsId=${CompNews.newsId}">
	                  		<img src="${CompNews.thumbImg }">
	                  </a>
                  </div>
                  <div class="mNews_con fl">
                     <h4><a class="tab_title" href="${ctx }/newDetail?newsId=${CompNews.newsId}">${CompNews.title }</a></h4>
                     <p>
	 					<c:choose>
			          		<c:when test="${fn:length(CompNews.contents) >= 40}">
			          		
				               ${fn:substring(CompNews.contents,0,40) }... 
			                   <a href="${ctx }/newDetail?newsId=${CompNews.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${CompNews.contents}</c:otherwise>
			            </c:choose>
                     </p>
                  </div>
                  </li>
                  <li class="clear">
                  <div class="mNews_img fl"  >
	                  <a href="${ctx }/newDetail?newsId=${CompNews_two.newsId}">
	                  		<img src="${CompNews_two.thumbImg }">
	                  </a>
                  </div>
                  <div class="mNews_con fl">
                     <h4><a class="tab_title" href="${ctx }/newDetail?newsId=${CompNews_two.newsId}">${CompNews_two.title }</a></h4>
                     <p>
	 					<c:choose>
			          		<c:when test="${fn:length(CompNews_two.contents) >= 40}">
			          		
				               ${fn:substring(CompNews_two.contents,0,40) }... 
			                   <a href="${ctx }/newDetail?newsId=${CompNews_two.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${CompNews_two.contents}</c:otherwise>
			            </c:choose>
                     </p>
                  </div>
                  </li>
            </ul>
        </div>
        <h3 id="two2" onmouseover="setContentTab('two',2,3)">装修攻略</h3>
        <div id="con_two_2" class="head_div">
            <ul>
                 <li class="clear">
                  <div class="mNews_img fl" >
	                  <a href="${ctx }/newDetail?newsId=${newsAct.newsId}">
	                  	 <img src="${newsAct.thumbImg }">
	                  </a>
                  </div>
                  <div class="mNews_con fl">
                     <h4><a class="tab_title" href="${ctx }/newDetail?newsId=${newsAct.newsId}">${newsAct.title }</a></h4>
                     <p>
                        <c:choose>
			          		<c:when test="${fn:length(newsAct.contents) >= 40}">
			          		
	  			                ${fn:substring(newsAct.contents,0,40) }... 
                                <a href="${ctx }/newDetail?newsId=${newsAct.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${newsAct.contents}</c:otherwise>
			            </c:choose>	
                     </p>
                  </div>
                </li>
                <li class="clear">
                  <div class="mNews_img fl" >
	                  <a href="${ctx }/newDetail?newsId=${newsAct_two.newsId}">
	                  	 <img src="${newsAct_two.thumbImg }">
	                  </a>
                  </div>
                  <div class="mNews_con fl">
                     <h4><a class="tab_title" href="${ctx }/newDetail?newsId=${newsAct_two.newsId}">${newsAct_two.title }</a></h4>
                     <p>
                        <c:choose>
			          		<c:when test="${fn:length(newsAct_two.contents) >= 40}">
			          		
	  			                ${fn:substring(newsAct_two.contents,0,40) }... 
                                <a href="${ctx }/newDetail?newsId=${newsAct_two.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${newsAct_two.contents}</c:otherwise>
			            </c:choose>	
                     </p>
                  </div>
                </li>
            </ul>
        </div>
        <h3 id="two3" onmouseover="setContentTab('two',3,3)">家装日记</h3>
        <div id="con_two_3" class="head_div">
            <ul>
                 <li class="clear">
                  <div class="mNews_img fl">
		              <a href="${ctx }/newDetail?newsId=${newsTech.newsId}">                  
	                  	<img src="${newsTech.thumbImg }" >
	                  </a>
                  </div>
                  <div class="mNews_con fl" >
                     <h4><a class="tab_title" href="#">${newsTech.title }</a></h4>
                     <p>
                       <c:choose>
			          		<c:when test="${fn:length(newsTech.contents) >= 40}">
			          		
				               ${fn:substring(newsTech.contents,0,40) }... 
				               <a href="${ctx }/newDetail?newsId=${newsTech.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${newsTech.contents}</c:otherwise>
			            </c:choose>	
                  
                    </p>
                  </div>
                </li> 
                <li class="clear">
                  <div class="mNews_img fl">
		              <a href="${ctx }/newDetail?newsId=${newsTech_two.newsId}">                  
	                  	<img src="${newsTech_two.thumbImg }" >
	                  </a>
                  </div>
                  <div class="mNews_con fl" >
                     <h4><a class="tab_title" href="#">${newsTech_two.title }</a></h4>
                     <p>
                       <c:choose>
			          		<c:when test="${fn:length(newsTech_two.contents) >= 40}">
			          		
				               ${fn:substring(newsTech_two.contents,0,40) }... 
				               <a href="${ctx }/newDetail?newsId=${newsTech_two.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${newsTech_two.contents}</c:otherwise>
			            </c:choose>	
                  
                    </p>
                  </div>
                </li> 
            </ul>
        </div>
        <%-- <h3 id="two4" onmouseover="setContentTab('two',4,4)">其他</h3>
        <div id="con_two_4">
            <ul>
                 <li class="clear" >
                  <div class="mNews_img fl" >
	                  <a href="${ctx }/newDetail?newsId=${newsOther.newsId}">                 
	                 	 <img src="${newsOther.thumbImg }">
	                  </a> 
                  </div>
                  <div class="mNews_con fl" >
                     <h4>
                     	<a class="tab_title" href="${ctx }/newDetail?newsId=${newsOther.newsId}">${newsOther.title }</a>
                     </h4>
                     <p>
                        <c:choose>
			          		<c:when test="${fn:length(newsOther.contents) >= 40}">
			          		
				               ${fn:substring(newsOther.contents,0,40) }... 
				               <a href="${ctx }/newDetail?newsId=${newsOther.newsId}">[详细]</a>
			          		</c:when>
			          		<c:otherwise> ${newsOther.contents}</c:otherwise>
			            </c:choose>	                   
                    </p>
                  </div>
                </li>
                 
            </ul>
        </div> --%>
    </div>
	
<script type="text/javascript">
function setContentTab(name, curr, n) {
    for (var i = 1; i <= n; i++) {
        var menu = document.getElementById(name + i);
        var cont = document.getElementById("con_" + name + "_" + i);
        menu.className = i == curr ? "up" : "";
        if (i == curr) {
            cont.style.display = "block";
        } else {
            cont.style.display = "none";
        }
    }
}
setContentTab('two',1,3);
</script>
      
      </div>
    
    <!--新闻中心  end-->
    
   <div class="clearfix"></div>
    
    <!--联系我们 start-->
      <div class="clear"></div>
     <div class="mCont"> 
      <div class="mTitle">
         <h3>联系我们</h3>
         <span>联系地址${MhomeAdress.value }</span><br>
         <span>联系电话：${MhomeTp.value }</span>
		 <c:if test="${currentBCompany == 'tssc'}">
         <p>
		 <a href="${ctx}/mobile/businessLicense.jsp"><img
		    src="${ctx }/mobile/images/national_emblem_light.png" style="margin-top:4px"/></a>
		</p> 
         </c:if>
       </div>
       
        <%-- <div class="mCont_left fl">
         <p>联系电话：${MhomeTp.value }</p>
         <p>联系人：${MhomePer.value }</p>
         <p>邮箱：${MhomePort.value }</p>
         <div class="mCont_left_add">地址：${MhomeAdress.value }</div>
       </div> --%>
       <div class="mCont_right fr">
         <div class="ewm fl"><span>扫描二维码</span><img src="${MhomeTc.value }"></div>
         <div class="tianM fl"><span>天猫店铺</span><a href="javascript:void(0)"><img src="${ctx }/mobile/images/tianmao.png"></a></div>
         <div class="ewm fl"><span>京东商铺</span><img src="${ctx }/mobile/images/jd.jpg"></div>
       </div>
       
     </div>
    <!--联系我们 end-->
  </div>
 <!-- 主体部分 nMain end-->
</div>

<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->

<script src="${ctx }/mobile/js/responsiveslides.min.js"></script>
<script src="${ctx }/mobile/js/slide.js"></script>
<script>
/* 为分站添加点击事件 */

$(function(){
	var currentBCompany = '${currentBCompany}';
	if(currentBCompany=='bjsc'){
		$("#myCompany").text('北京');
		
	}
	if(currentBCompany=='tjsc'){
		$("#myCompany").text('天津');
	}
	if(currentBCompany=='lfsc'){
		$("#myCompany").text('廊坊');
		
	}
	if(currentBCompany=='sjzsc'){
		$("#myCompany").text('石家庄');
	}
	if(currentBCompany=='tssc'){
		$("#myCompany").text('唐山');
	}
	if(currentBCompany=='bdsc'){
		$("#myCompany").text('保定');
	}
	if(currentBCompany=='hssc'){
		$("#myCompany").text('衡水');
	}
	if(currentBCompany=='yjsc'){
		$("#myCompany").text('燕郊');
	}
	if(currentBCompany=='tysc'){
		$("#myCompany").text('太原');
	}
});

</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
