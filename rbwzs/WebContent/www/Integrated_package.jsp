<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="ctx" value="${pageContext.request.contextPath }"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${packageSeoKeyword.value }"/>
<meta name="description" content="${packageSeoDesc.value }"/>
<title>${packageSeoTitle.value }</title>
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css"/>
<script type="text/javascript" src="${ctx }/www/js/index.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
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
  
    <div class="taocan01"><img src="${ctx }/www/images/taocanbanner.jpg"/></div>
    
    <div class="Brand">
    	<div class="Brand_1">
        	<ul class="clearfix">
            	<li>
        			<b class=""></b>
            		<p>免费<br>测量、设计<img src="${ctx }/www/images/bra1.png"/></p>
            	</li>
                <li>
        			<b class="Brand_b"></b>
            		<p>18项<br>精装全包服务<img src="${ctx }/www/images/bra2.png"/></p>
            	</li>
               <li>
        			<b class=""></b>
            		<p>国内外<br>一线主材品牌<img src="${ctx }/www/images/bra3.png"/></p>
            	</li>
                <li>
        			<b class="Brand_b"></b>
            		<p>100%<br>施工质量保证<img src="${ctx }/www/images/bra4.png"/></p>
            	</li>
                <li>
        			<b class=""></b>
            		<p>80道<br>标准工序<img src="${ctx }/www/images/bra5.png"/></p>
            	</li>
                <li>
        			<b class="Brand_b"></b>
            		<p>40天<br>从毛坯到精装<img src="${ctx }/www/images/bra6.png"/></p>
            	</li>
                <li>
        			<b class=""></b>
            		<p>一对一<br>管家式服务<img src="${ctx}/www/images/bra7.png"/></p>
            	</li>
            </ul>
        </div>
        <script>
		$(function(){
        	$(".Brand_1 p").hover(function(){
					$(this).parent().find("b").addClass("hover");},
					function(){$(".Brand_1 b").removeClass("hover")}
				)
		})
        </script>
    </div>

  
    <div class="configure">
    	<h2>8000平米家居体验馆</h2>
        <p>经验丰富的设计师，一对一服务，为您提供免费的设计方案，使您家的空间得到充分的利用，实现您生活方式的私属定制<br>空间包括客厅、卧室、厨房、卫生间、餐厅、儿童房、书房、阳台、玄关</p>
        <a href="#" target="_blank">查看更多详情 &gt;&gt;&gt;</a>
        
        <div class="configure_img clearfix">
          <a href=""><img src="${ctx}/www/images/config_01.png" width="23%" height="500" /></a>
          <a href=""><img src="${ctx}/www/images/config_02.png" width="54%" height="500"/></a>
          <a href=""><img src="${ctx}/www/images/config_03.png" width="23%" height="500"/></a>
        </div>
    </div>
  
  
  
  
  <div class="taocan_bg w1200"><img src="${ctx}/www/images/x01.jpg" /></div>
  <div class="taocan_bg w1200"><img src="${ctx}/www/images/x02.jpg" /></div>
  
  
  <div class="Humane">
    	<div class="Humane_1">
        		<h2>人性化设计</h2>
                <p><span>我们在设计过程当中，根据人的行为习惯、人体的生理结构、人的心理情况、人的思维方式等等，在原有设计基本功能和性能的基础上，对建筑和展品进行优化，使观众参观起来非常方便、舒适。是在设计中对人的心理生理需求和精神追求的尊重和满足，是设计中的人文关怀，是对人性的尊重</span></p>
                <ul>
                	<li class="Humane_li1">
                    	<p style="opacity: 1; display: none;">卧室双控开关设计，从此不用为下床关灯而烦恼</p>
                        <a href="javascript:void(0)">01</a>
                    </li>
                    <li class="Humane_li2">
                    	<p style="opacity: 1; display: none;">床头安装4个5孔插座，可供手机/电脑/台灯同时使用</p>
                        <a href="javascript:void(0)">02</a>
                    </li>
                    <li class="Humane_li3">
                    	<p style="opacity: 1; display: none;">马桶后面安装5孔插座，支持升级智能马桶</p>
                        <a href="javascript:void(0)">03</a>
                    </li>
                    <li class="Humane_li4">
                    	<p style="opacity: 1; display: none;">厨盆下安装5孔插座，为您使用厨宝和净水机带来了极大便利</p>
                        <a href="javascript:void(0)">04</a>
                    </li>
                    <li class="Humane_li5">
                    	<p style="opacity: 1; display: none;">橱柜安装2个带开关插座，5个五孔插座，满足电器使用</p>
                    	<a href="javascript:void(0)">05</a>
                    </li>
                    <li class="Humane_li6">
                    	<p style="opacity: 1; display: none;">厨房吊柜安装LED感应灯，光线从此不再被遮挡</p>
                    	<a href="javascript:void(0)">06</a>
                    </li>
                </ul>
                <script>
                $(function(){
					$(".Humane li").hover(function(){
						$(this).find("p").fadeIn("slow");
						},function(){
							$(".Humane li p").stop().fadeOut("slow");
							}
						)
				})
                </script>
        </div>
    </div>
  
  
  
  
  
  <div class="Brands">
    	<div class="Brands_1">
        	<h2>8大一线主材品牌</h2>
            <p>大自然、科勒、马可波罗、科宝、西门子、雷士、友邦、多乐士等8大一线主材品牌,为您提供品质保障、极致体验</p>
            <a href="">查看更多详情 &gt;&gt;&gt;</a>
        </div>
       
       
     
<!--最新工程案例-->
<div class="jz">
    <div class="content">
     
      <div class="ml02">
          <div id="ISL_Cont_1d6" style="margin: 0 auto;">
            <dl>
                <dt><a href=""><img src="${ctx}/www/images/Brands_6.jpg" width="710" height="270"/></a></dt>
                <dd><b><a href="">精优选材</a></b></dd>
            </dl>
        
            <dl>
                <dt><a href=""><img src="${ctx}/www/images/Brands_7.jpg" width="710" height="270"/></a></dt>
                <dd><b><a href=""> 管家管理</a></b></dd>
            </dl>
        
            <dl>
                <dt><a href=""><img src="${ctx}/www/images/Brands_8.jpg" width="710" height="270"/></a></dt>
                <dd><b><a href="">精致工艺</a></b></dd>
            </dl>
                  
          </div>
          <div class="ml_dd" id="Left_ding6">
              <a href="javascript:void(0)"></a>
          </div>
          <div class="ml_uu" id="Right_ding6">
              <a href="javascript:void(0)"></a>
          </div>
      </div>
    </div>
</div>

	<script language="javascript" type="text/javascript">
	    var scrollPic_06 = new ScrollPicleft();
	    scrollPic_06.scrollContId = "ISL_Cont_1d6"; // 内容容器ID""
	    scrollPic_06.arrLeftId = "Left_ding6"; //左箭头ID
	    scrollPic_06.arrRightId = "Right_ding6"; //右箭头ID
	    scrollPic_06.frameWidth = 710; //显示框宽度
	    scrollPic_06.pageWidth = 710; //翻页宽度
	    scrollPic_06.speed = 10; //移动速度(单位毫秒，越小越快)
	    scrollPic_06.space = 10; //每次移动像素(单位px，越大越快)
	    scrollPic_06.autoPlay = true; //自动播放
	    scrollPic_06.autoPlayTime = 3; //自动播放间隔时间(秒)
	    scrollPic_06.initialize(); //初始化                                       
	</script>
	<!--最新工程案例-->
       
      
    </div>
  
  
  
  
  <div class="Auxiliary w1200">
    	<h2>知名辅材 环保安全</h2>
        <p>精心为您挑选尚好的辅材，每一个品类均为国内外知名品牌。<span>绝不以次充好，绝不偷工减料，让您的家更加环保，更加安全，真正做到为您的健康着想，用心营造最佳的室内环境</span><a href="">查看更多详情 &gt;&gt;&gt;</a></p>
        <ul class="clearfix">
        	<li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_1.png"/></p>
                <p class="Aux_p2">中国防水行业龙头企业，是国家高新技术企业、中国防水行业唯一的上市公司</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_2.png"/></p>
                <p class="Aux_p2" style="bottom: -200px;">农业部"全国诚信守法乡镇企业"、国家奥运工程指定的线缆定点采购企业之一</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_3.png"/></p>
                <p class="Aux_p2" style="bottom: -200px;">德国工序，通过ISO9001质量管理体系认证和CTC产品质量认证、产品环保认证</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_4.png"/></p>
                <p class="Aux_p2">国内唯一使用有机类助剂生产无毒环保型电工套管的厂家，通过ISO9001和3CCC认证</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_5.png"/></p>
                <p class="Aux_p2" style="bottom: -200px;">中国企业500强，中国唯一以PP-R管道为主导产品的上市公司</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_6.png"/></p>
                <p class="Aux_p2" style="bottom: -200px;">金隅集团是上市的大型国有控股产业集团，中国500强企业之一，国家重点支持的12家大型水泥企业之一</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_7.png"/></p>
                <p class="Aux_p2" style="bottom: -200px;">先后通过了ISO9001质量管理体系认证和ISO14001环境管理体系认证及中国环境标志产品认证</p>
            </li>
            <li>
            	<p class="Aux_p1"><img src="${ctx}/www/images/p_8.png"/></p>
                <p class="Aux_p2">公安部消防产品合格评定中心认可的专业防火涂料生产企业</p>
            </li>
        </ul>
        <script type="text/javascript">
		$(".Auxiliary li p.Aux_p1").mouseover(function(){
		$(this).parent().find(".Aux_p2").stop().animate({bottom:0},1500)
		}).mouseout(function(){$(this).parent().find(".Aux_p2").stop().animate({bottom:-200},1500)})
		$(".Auxiliary li p.Aux_p2").mouseover(function(){
		$(this).stop().animate({bottom:0},1500)
		}).mouseout(function(){$(this).stop().animate({bottom:-200},1500)})
		</script>
    </div>
  
  
</div>

	<!--二级页面  主体部分 end-->

	<!--footer start-->
	<jsp:include page="public/fotter.jsp" />
	<!--footer end-->
	${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>

