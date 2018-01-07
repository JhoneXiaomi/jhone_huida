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
	<link type="text/css" href="${ctx }/www/css/style.css" rel="stylesheet"/>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
	<!--装修风格引用js-->
	<script type="text/javascript" src="${ctx }/www/js/modernizr.custom.97074.js"></script>
	<!--设计师引用js-->
	<script type="text/javascript" src="${ctx }/www/js/index.js"></script>
	<!--合作品牌 js-->
	<script type="text/javascript" src="${ctx }/www/js/hezuo.js"></script>
	<script type="text/javascript">
		
		//判断是否是PC端浏览器
		function isPC() {
		    var userAgentInfo = navigator.userAgent;
		    var Agents = ["Android", "iPhone",
		                "SymbianOS", "Windows Phone",
		                "iPad", "iPod", "BlackBerry"];
		    var flag = true;
		    for (var v = 0; v < Agents.length; v++) {
		        if (userAgentInfo.indexOf(Agents[v]) > 0) {
		            flag = false;
		            break;
		        }
		    }
		    return flag;
		}
		//如果是移动端浏览器 自动跳转到移动端
		if(!isPC()){
			location.href = "http://m.rbw27900.com";
		}
	</script>
</head>
<!---->
<body>

    <!--header start-->
	<jsp:include page="public/header.jsp" />
    <!--header end-->
    <!--nav start-->
    <jsp:include page="public/nav.jsp" />

	<div class="clear"></div>
	<div id="slide-index">
	<div class=slides  id="mySlides">
			<c:forEach items="${homeTurn }" var="decrateImg">
				<div class="slide autoMaxWidth">
					<div id=bi_0 class=image>
						<a href="${decrateImg.homeimgUrl }">
							<img src="${decrateImg.homeimgSrc }" alt="${decrateImg.homeimgName }" title="${decrateImg.homeimgAlt }" width="100%" height="626px"/>
						</a>
					</div>
					<div id=bt_0 class=text></div>
					<div id=bb_0 class=button></div>
			    </div>
			</c:forEach>
	</div>
	<div class=control>
	    <c:forEach items="${homeTurn }" var="turnImg">
			<a href="#"></a>
		</c:forEach>
	</div>
</div>
	<script type=text/javascript>
	$(function(){	
		indexSlides.ini();
	});
	var numSlides = $("#mySlides").find(".autoMaxWidth");
	//alert("The numbers of mySlides is :"+numSlides.length);
	var indexSlides={};
	indexSlides.timer=false;
	indexSlides.total=$('#slide-index .control a').length;
	indexSlides.current=-1;
	indexSlides.offScreenLeft=2000;
	indexSlides.leaveScreenLeft=4000;
	indexSlides.animating=false;
	indexSlides.obj=$('#slide-index .slide');
	indexSlides.style=[];
	
	for(var i= 0;i<numSlides.length;i++){
		indexSlides.style[i]={
				text:{left:'30px',top:'81px'},
				button:{left:'30px',top:'244px'},
				direction:'tb'
			};
	}	
	/* indexSlides.style[1]={
		text:{left:'30px',top:'81px'},
		button:{left:'30px',top:'244px'},
		direction:'tb'
	}; */
	</script>
	<script type=text/javascript src="${ctx }/www/js/lanrenzhijia.js"></script>
	
	<!--报价神器 start-->
	<div class="bj">
	  <div class="w1200"> 
	    <div class="bj_title fl">
	       <h4>报价神器</h4>
	       <p>10秒获取 免费报价</p>
	    </div>
	
	    <div class="bj_input fl">
	      <input name="clientName" type="text" class="inputname" placeholder="姓名"/>
	      <input name="phone" type="text" class="inputtel" placeholder="手机"/>
	      <input name="acreage" type="text" class="inputmj" placeholder="面积"/>
	      <input id="showPrice" type="button" class="inputbj" placeholder="为我报价" value="为我报价"/>
	    </div>
	
	    <div class="bj_rig fr">
	      <p class="rig_text01">网络报名专享免费、快速报价</p>
	      <p class="rig_text02">已有<span>1200</span>名业主通过报名获取报价</p>
	    </div>
	  </div>
	</div>
	
	<!--报价神器 end -->
	
	
	<!--main start-->
	<div class="main">
	
	 
	  
	  <!--装修风格 start-->
	    <div class="fengge w1200">
	    <!-- 代码 开始 -->
	        <div class="container">
	           <div class="title w1200">
	             <div class="title_cen clearfix">
	               <h3 class="fl">装修风格</h3>
	               <span class="fr"><a href="${ctx }/cases/p1">MORE <b>+</b></a></span>
	             </div>
	             <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
	           </div>
				<section>
					<ul id="da-thumbs" class="da-thumbs clearfix">
						<c:forEach items="${CaseStyleList }" var="cases" begin="0" end="7">
							<li>
								<a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
									<img src="${cases.caseThumbImg }" width="273" height="205" title="${cases.caseTitle }" alt="${cases.caseTitle }"/>
									<div><span>${cases.caseStyle }</span></div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</section>
	        </div>
	     </div>
			<script type="text/javascript" src="${ctx }/www/js/jquery.min.js"></script>
			<script type="text/javascript" src="${ctx }/www/js/jquery.hoverdir.js"></script>	
			<script type="text/javascript">
				$(function() {
				
					$(' #da-thumbs > li ').each( function() { $(this).hoverdir(); } );
	
				});
			</script>
	<!-- 代码 结束 -->
	<!--装修风格 end-->
    <!--装修案例-->
  
    <div class="w1200">
    <div class="al_bg">
      <div class="content">
          <!--装修风格案例展示-->
          <div class="title w1200">
             <div class="title_cen clearfix">
               <h3 class="fl">装修案例</h3>
               <span class="fr"><a href="${ctx }/cases/p1">MORE <b>+</b></a></span>
             </div>
             <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
           </div>
        
        
	<div class="al_list clearfix">
	  <dl class="clearfix">
	     <dt><a target="_blank" href="">装修户型</a></dt>
	     <dd>
	       <p class="clearfix">
	             <a target="_blank" href="${ctx}/cases/p1?casesType=全部">全部</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=一居">一居</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=两居">两居</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=三居">三居</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=多居">多居</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=复式">复式</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=别墅">别墅</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=洋房">洋房</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=会所">会所</a>
		         <a target="_blank" href="${ctx}/cases/p1?casesType=其他">其他</a>
	       </p>
	     </dd>
	  </dl>
	   
	   
	   <dl>
	     <dt><a target="_blank" href="">房屋面积</a></dt>
	     <dd>
	        <p class="clearfix">
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=全部">全部</a>
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=50-80p平米">50~80平米</a>
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=80-120平米">80~120平米</a>
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=120-150平米">120~150平米</a>
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=150平米以上">150平米以上</a>
	          <a target="_blank" href="${ctx}/cases/p1?caseAcreage=其他">其他</a>
	        </p>
	     </dd>
	   </dl>
	   
	</div>

	<script>
	    $(".al_list dl:eq(0)").find("dd").addClass("nei_span_01");
	</script>
	<!--案例展示-->
	 <div id="ISL_Cont_1d1" style="position: relative;">
	<c:forEach begin="0" end="${number }" varStatus="status"> 
	 <div class="al_l fl">
	    <q>
	      <div class="alzs01 clearfix">
	        <div class="alzs01_left fl">
	                <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 +0}" end="${status.index * 6 +0 }">
					   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
			       		 		<img src="${cases.caseThumbImg }" style="margin-top:70px" width="340" height="259" />
			       		 </a>
			        </c:forEach>
			        <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 + 1}" end="${status.index * 6 + 1}">
					   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
			       		 		<img src="${cases.caseThumbImg }" style="margin-top:21px"  width="340" height="259" />
			       		 </a>
			        </c:forEach>
	            <div class="al_l_l">
	            <span><a href="">装修风格</a></span>
	        </div>
	           </div>
	        <div class="alzs01_right fr">
	          <div class="alzs01_r_t">
			         <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 + 2}" end="${status.index * 6 + 2}">
			             <div class="alzs01_r_t_l">
					   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
			       		 		<img src="${cases.caseThumbImg }" width="415" height="316"/><p>￥${cases.caseMoney }万元起</p>
			       		 </a>
			       		 </div>
			        </c:forEach>
			          <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 + 3}" end="${status.index * 6 + 3}">
			             <div class="alzs02_r_t_r">
					   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
			       		 		<img src="${cases.caseThumbImg }" style="margin-left:20px"  width="415" height="316"/><p>￥${cases.caseMoney }万元起</p>
			       		 </a>
			       		 </div>
			        </c:forEach>
	            </div>
	          <div class="alzs01_r_b clearfix">
	                <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 + 4}" end="${status.index * 6 + 4}">
			             <div class="alzs01_r_b_l fl">
						   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
				       		 		<img src="${cases.caseThumbImg }" width="420" height="320"/><p>￥${cases.caseMoney }万元起</p>
				       		 </a>
			       		 </div>
			        </c:forEach>
			        <c:forEach items="${CasesList }" var="cases" begin="${status.index * 6 + 5}" end="${status.index * 6 + 5}">
			             <div class="alzs01_r_b_r fr">
						   	 <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}" target="_blank"> 
				       		 		<img src="${cases.caseThumbImg }" width="420" height="320"/><p>￥${cases.caseMoney }万元起</p>
				       		 </a>
			       		 </div>
			        </c:forEach>
	          </div>
	        </div>
	      </div>
	    </q>
	    <h3><a href="" target="_blank">案例展示</a></h3>
	    <div>
	       
	        <div class="al_l_r">
	            <p><a href="" target="_blank"> 有人曾经问我：家是什么？家是心灵的归宿，家是梦想的乐园，家是驻泊的港湾 ……</a></p>
	        </div>
	    </div>
	    <div class="clear"></div>
	</div>
   </c:forEach>	
	

       
</div>
<div class="al_b">
    <p>
        <a href="javascript:void(0)" id="Left_ding1"></a><a href="javascript:void(0)" id="Right_ding1" class="dd"></a>
    </p>
</div>

<script language="javascript" type="text/javascript">
    var scrollPic_06 = new ScrollPicleft();
    scrollPic_06.scrollContId = "ISL_Cont_1d1"; // 内容容器ID""
    scrollPic_06.arrLeftId = "Left_ding1"; //左箭头ID
    scrollPic_06.arrRightId = "Right_ding1"; //右箭头ID
    scrollPic_06.frameWidth = 1200; //显示框宽度
    scrollPic_06.pageWidth = 1200; //翻页宽度
    scrollPic_06.speed = 10; //移动速度(单位毫秒，越小越快)
    scrollPic_06.space = 100; //每次移动像素(单位px，越大越快)
    scrollPic_06.autoPlay = true; //自动播放
    scrollPic_06.autoPlayTime =2; //自动播放间隔时间(秒)
    scrollPic_06.initialize(); //初始化                                       
</script>
</div>
</div>
</div>
<!--案例展示-->
   
 <!--我们的优势 start-->
 
   <div class="youshi">
     <div class="title w1200">
        <div class="title_cen clearfix">
          <h3 class="fl">我们的优势</h3>
        </div>
        <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
      </div>
      <div class="youshi_con w1200">
         <dl class="youshibox youshibox01">
           <dt><span>01</span></dt>
           <dd>品牌保障</dd>
         </dl>
         
         <dl class="youshibox youshibox02">
           <dt><span>02</span></dt>
           <dd>专业保障</dd>
         </dl>
         
         
         <dl class="youshibox youshibox03">
           <dt><span>03</span></dt>
           <dd>质量保障</dd> 
         </dl>
         
         
         <dl class="youshibox youshibox04">
           <dt><span>04</span></dt>
           <dd>服务保障</dd>
         </dl>	
         
         <dl class="youshibox youshibox05">
           <dt><span>05</span></dt>
           <dd>材料保障</dd>
         </dl>
         
         <dl class="youshibox youshibox06">
           <dt><span>06</span></dt>
           <dd>工艺保障</dd>
         </dl>
         
         <dl class="youshibox youshibox07">
           <dt><span>07</span></dt>
           <dd>设计保障</dd>
         </dl>
      </div>
      
   </div>
 
 <!--我们的优势  end-->
 
<!-- 装修效果图 && 设计师 start-->
 <div class="w1200 clearfix">
  <div class="xiaoguotu fl">
     <div class="title">
        <div class="title_s clearfix">
	        <h3 class="fl">装修效果图</h3>
	        <span class="fr">
	        	<a href="">MORE<b>+</b></a>
	        </span>
        </div>
     </div>
     
     <div class="xiaoguotupic clearfix">
       <div class="xiaoguotu_picleft fl">
       <c:forEach items="${caseXImgs }" var="cases" begin="0" end="0">
	       <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		       <img src="${cases.caseThumbImg }" width="461" height="330" alt="" title=""/>
		       <p>${cases.caseTitle }</p>
	       </a>
       </c:forEach>
       </div>
       <div class="xiaoguotu_picright fr">
         <ul class="clearfix">
         
	          <c:forEach items="${caseXImgs }" var="cases" begin="1" end="2">
	               <li>
			       <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
				       <img src="${cases.caseThumbImg }"  width="221" height="156" alt="${cases.caseTitle }" title="${cases.caseTitle }"/>
				       <p>${cases.caseTitle }</p>
			       </a>
			      </li> 
	       	  </c:forEach>
	       	   <c:forEach items="${caseXImgs }" var="cases" begin="3" end="3">
	               <li class="no_mar">
			       <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
				       <img src="${cases.caseThumbImg }"  width="221" height="156" alt="${cases.caseTitle }" title="${cases.caseTitle }"/>
				       <p>${cases.caseTitle }</p>
			       </a>
			      </li> 
	       	  </c:forEach>
	       	  <c:forEach items="${caseXImgs }" var="cases" begin="4" end="4">
	               <li class="no_mar">
			       <a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
				       <img src="${cases.caseThumbImg }"  width="221" height="156" alt="${cases.caseTitle }" title="${cases.caseTitle }"/>
				       <p>${cases.caseTitle }</p>
			       </a>
			      </li> 
	       	  </c:forEach>
         </ul>
     </div>
     </div>
  </div>
  
  <div class="shejishi abo_r fr">
     <div class="title">
        <div class="title_s clearfix">
	        <h3 class="fl">设计师</h3>
	        <span class="fr">
	        <a href="${ctx }/designer/p1">MORE<b>+</b></a>
	        </span>
        </div>
     </div>
    
    
    <ul id="ISL_Cont_1d3">
    <c:forEach items="${designers }" var="designer">
     <li>
	     <a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
	     		<img  src="${designer.designerPhotoImg }" width="250" height="285" alt="${designer.designerName }" title="${designer.designerName}"/>
	     </a>
	     <span>
	     		<a href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">设计师：${designer.designerName }</a>
	     </span>
     </li>
    </c:forEach>
    </ul>
    <p>
      <a href="javascript:void(0)" id="Left_ding3"> <img src="${ctx }/www/images/a_uu.gif"/></a>
      <a href="javascript:void(0)" id="Right_ding3" class="pal"><img src="${ctx }/www/images/a_dd.gif" /></a>
    </p>

  </div>
 </div>
 
<!--shejishi js-->
 <script language="javascript" type="text/javascript">
    var scrollPic_06 = new ScrollPicleft();
    scrollPic_06.scrollContId = "ISL_Cont_1d3"; // 内容容器ID""
    scrollPic_06.arrLeftId = "Left_ding3"; //左箭头ID
    scrollPic_06.arrRightId = "Right_ding3"; //右箭头ID
    scrollPic_06.frameWidth =250; //显示框宽度
    scrollPic_06.pageWidth = 250; //翻页宽度
    scrollPic_06.speed = 10; //移动速度(单位毫秒，越小越快)
    scrollPic_06.space = 10; //每次移动像素(单位px，越大越快)
    scrollPic_06.autoPlay = true; //自动播放
    scrollPic_06.autoPlayTime = 3; //自动播放间隔时间(秒)
    scrollPic_06.initialize(); //初始化								
</script>

<!--装修效果图 && 设计师  end-->
 
 
 
 <!--装修流程 start-->
 <div class="liucheng w1200">
    <div class="title w1200">
        <div class="title_cen clearfix">
           <h3 class="fl">装修流程</h3>
           <span class="fr">MORE <b>+</b></span>
        </div>
        <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
    </div>
    <div class="liucheng_con">
      <ul class="clearfix">
        <li>
           <a><i class="zxlc_ico1"></i><span>收房量房</span></a>
        </li>
        
        
        <li>
            <a><i class="zxlc_ico2"></i><span>前期准备</span></a>
        </li>
        
        
        <li>
            <a><i class="zxlc_ico3"></i><span>选装修公司</span></a>
        </li>
        
        
        <li>
            <a><i class="zxlc_ico4"></i><span>设计阶段</span></a>
        </li>
        
        <li>
            <a><i class="zxlc_ico5"></i><span>材料选购</span></a>
        </li>
        
        <li>
            <a><i class="zxlc_ico6"></i><span>施工阶段</span></a>
        </li>
        
        
        <li>
            <a><i class="zxlc_ico7"></i><span>竣工验收</span></a>
        </li>
        
        <li>
            <a><i class="zxlc_ico8"></i><span>软装配饰</span></a>
        </li>
        
        <li class="no_mar">
            <a><i class="zxlc_ico9"></i><span>装修保障</span></a>
        </li>
      </ul>
    </div>
    
 </div>
 <div class="clear"></div>
 <!--装修流程 end-->
 
  <!--装修新闻 start-->
    <div class="zx_news w1200 clearfix">
      <div class="zx_gonglue fl">
        <div class="title">
          <div class="title_s clearfix">
	          <h3 class="fl">装修攻略</h3>
	          <a href="domesticOutfit/p1">
	          <span class="fr">MORE<b>+</b></span>
	          </a>
          </div>
        </div>
        <c:forEach items="${newStrtagys }" var="strtagy" begin="0" end="2">
 		 <dl class="clearfix">
          <dt class="fl">
           <a href="${ctx}/newsDetail?newsId=${strtagy.newsId}">
          <img src="${strtagy.thumbImg }" width="178" height="144" alt="${strtagy.title }" title="${strtagy.title }"/>
          </a>
          </dt>
          <dd class="fl">
             <a href="${ctx}/newsDetail?newsId=${strtagy.newsId}">
               <h4>${strtagy.title }</h4>
               <p>
                <c:choose>
	          		<c:when test="${fn:length(strtagy.contents) >= 50}">
		               ${fn:substring(strtagy.contents,0,50) }... 
	          		</c:when>
	          		<c:otherwise> ${strtagy.contents}</c:otherwise>
	            </c:choose>	
	            </p>
              <span><fmt:formatDate value="${strtagy.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></span>
            </a>
          </dd>
        </dl>       
        </c:forEach>
      </div>
      <div class="zx_riji fr">
        <div class="title">
          <div class="title_s clearfix"><h3 class="fl">家装日记</h3>
          <a href="${ctx }/decorateStrategy/p1">
          <span class="fr">MORE<b>+</b></span>
          </a>
          </div>
        </div>
        <c:forEach items="${newDialogs }" var="dialog" begin="0" end="0">
        	<a href="${ctx}/newsDetail?newsId=${dialog.newsId}">
        		<img src="${dialog.thumbImg }" alt="${dialog.title }" title="${dialog.title }" style="width: 280px; height: 231px"/>
       		</a>	
        </c:forEach>
        <ul>
	        <c:forEach items="${newDialogs }" var="dialog" begin="1" end="6">
	        	 <li><span><fmt:formatDate value="${dialog.updateTime }" pattern="yyyy-MM-dd hh:mm:ss"/></span>
	        	 <a href="${ctx}/newsDetail?newsId=${dialog.newsId}">${dialog.title }</a>
	        	 </li>
	        </c:forEach>
        </ul>
      </div>
    </div>
    <div class="clear"></div>
 <!--装修新闻 end-->
 
 <!--长图 start-->
<%--  <div class="longpic">
   <div class="longpic_con w1200">
     <ul>
       <li><span>手机：</span><input type="text" id="txtMobile"/></li>
       <li><span>姓名：</span><input type="text" id="txtName"/></li>
       <li><a href=""><img src="${ctx }/www/images/t_b1.gif"/></a></li>
     </ul>
   </div>
 </div> --%>
 <!--长图 end-->
 
 
 <!--热门楼盘 start-->
 <div class="clear"></div>
 <!--热门楼盘  end-->
  
 
<!-- 合作品牌 start-->
<center>
<div class="hzbj">
<!-- picrotate_left start  -->
<div class="blk_18 w1200"> 
   <div class="title w1200">
        <div class="title_cen clearfix">
           <h3 class="fl">合作品牌</h3>
        </div>
        <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
    </div>
  
   <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
  <div class="pcont" id="ISL_Cont_1">
    <div class="ScrCont clearfix">
      <div id="List1_1">
        <!-- piclist begin -->
        <c:forEach items="${homeCok }" var="coworker">
			<a class="pl" href="javascript:void(0)">
				<img src="${coworker.value }" alt="瑞博文合作品牌" width="210" height="95"/>
			</a>
		</c:forEach>
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
<!-- picrotate_left end -->
</center>
<!--合作品牌 end-->
 
</div>
<!--main end-->

<!--footer start-->
<jsp:include page="public/fotter.jsp" />
<!--footer end-->
<!-- 客服代码开始 -->
<div class="side-bar" style="visibility: visible; display: block;">
  <div class="to-top"><i class="ico2"></i>TOP</div>
  <div class="side-bar-erweima">
    <div class="erweima"><img src="${ctx }/www/images/ercode.png"/>关注我们<i class="arrow3"></i></div>
    <i class="ico2"></i></div>
</div>
<!--右侧悬浮js-->
<script type="text/javascript" src="${ctx }/www/js/common.js"></script>
<script type="text/javascript">
/* 设置订单号 */
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

$("#showPrice").bind("click",function(){
	
	var orderId = dateTime;
    var clientName = $('input[name=clientName]').val();
    var phone = $('input[name=phone]').val();
    var acreage  = $('input[name=acreage]').val();
    var branchCompany= '${branchCompany}';
    sourceType= "在线订单";
    if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && acreage.match(/^\d+$/)){
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "${pageContext.request.contextPath}/saveOrder",
				data : {'branchCompany':branchCompany,'acreage':acreage,'sourceType':sourceType,'acreage':acreage,'orderId':orderId,'clientName':clientName,'phone':phone,},
				success : function(data) {
					if (data.data == "ok") {
						alert("您的订单已经提交成功!");
					}else{
						alert("保存失败");
					}
				}
			});  
	 }else if(clientName.match(/^\d*$/)){
	        alert('请填写正确的姓名');
	        return false;
	 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
	        alert('请填写11位号码');
	        return false;
	 }else if(!acreage.match(/^\d+$/)){
			alert("请填写数字");
	        return false;
	 }
});

</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>


