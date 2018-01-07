<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/header.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
<title>${statScinterHomeSeoTitle.value }</title>
<link type="text/css" href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${ctx }/www/js/jquery-1.8.2.min.js"></script>
<!--装修风格引用js-->
<script type="text/javascript" src="${ctx }/www/js/modernizr.custom.97074.js"></script>
<!--设计师引用js-->
<script type="text/javascript" src="${ctx }/www/js/index.js"></script>
<!--合作品牌 js-->
<script type="text/javascript">
var Speed_1 = 10; //速度(毫秒)
var Space_1 = 20; //每次移动(px)
var PageWidth_1 = 223 ; //翻页宽度
var interval_1 = 3000; //翻页间隔时间
var fill_1 = 0; //整体移位
var MoveLock_1 = false;
var MoveTimeObj_1;
var MoveWay_1="right";
var Comp_1 = 0;
var AutoPlayObj_1=null;
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay_1(){clearInterval(AutoPlayObj_1);AutoPlayObj_1=setInterval('ISL_GoDown_1();ISL_StopDown_1();',interval_1)}
function ISL_GoUp_1(){if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="left";MoveTimeObj_1=setInterval('ISL_ScrUp_1();',Speed_1);}
function ISL_StopUp_1(){if(MoveWay_1 == "right"){return};clearInterval(MoveTimeObj_1);if((GetObj('ISL_Cont_1').scrollLeft-fill_1)%PageWidth_1!=0){Comp_1=fill_1-(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1);CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrUp_1(){if(GetObj('ISL_Cont_1').scrollLeft<=0){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft+GetObj('List1_1').offsetWidth}
GetObj('ISL_Cont_1').scrollLeft-=Space_1}
function ISL_GoDown_1(){clearInterval(MoveTimeObj_1);if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="right";ISL_ScrDown_1();MoveTimeObj_1=setInterval('ISL_ScrDown_1()',Speed_1)}
function ISL_StopDown_1(){if(MoveWay_1 == "left"){return};clearInterval(MoveTimeObj_1);if(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1-(fill_1>=0?fill_1:fill_1+1)!=0){Comp_1=PageWidth_1-GetObj('ISL_Cont_1').scrollLeft%PageWidth_1+fill_1;CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrDown_1(){if(GetObj('ISL_Cont_1').scrollLeft>=GetObj('List1_1').scrollWidth){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft-GetObj('List1_1').scrollWidth}
GetObj('ISL_Cont_1').scrollLeft+=Space_1}
function CompScr_1(){if(Comp_1==0){MoveLock_1=false;return}
var num,TempSpeed=Speed_1,TempSpace=Space_1;if(Math.abs(Comp_1)<PageWidth_1/2){TempSpace=Math.round(Math.abs(Comp_1/Space_1));if(TempSpace<1){TempSpace=1}}
if(Comp_1<0){if(Comp_1<-TempSpace){Comp_1+=TempSpace;num=TempSpace}else{num=-Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft-=num;setTimeout('CompScr_1()',TempSpeed)}else{if(Comp_1>TempSpace){Comp_1-=TempSpace;num=TempSpace}else{num=Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft+=num;setTimeout('CompScr_1()',TempSpeed)}}
function picrun_ini(){
GetObj("List2_1").innerHTML=GetObj("List1_1").innerHTML;
GetObj('ISL_Cont_1').scrollLeft=fill_1>=0?fill_1:GetObj('List1_1').scrollWidth-Math.abs(fill_1);
GetObj("ISL_Cont_1").onmouseover=function(){clearInterval(AutoPlayObj_1)}
GetObj("ISL_Cont_1").onmouseout=function(){AutoPlay_1()}
AutoPlay_1();
}
</script>


</head>
<!---->
<body>
<!--header start-->
<div class="header">
  <div class="top_one">
    <div class="w1200 clearfix">
      <div class="welcom_left fl">欢迎来到瑞博文官方网站！  您的当前站：石家庄</div>
      <div class="zxyy_right fr">
        <a href="">在线咨询</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="">在线预约</a>
      </div>
    </div>
  </div>
  
  <!--logo telqq start-->
  <div class="top_t w1200 clearfix">
    <div class="logo fl"><img src="images/logo.jpg" width="454" height="85"/></div>
    <div class="telqq fr">
      <p href="">24小时服务热线：<br/><b>0311-68093796</b></p>
      <!--<p href="">QQ：<br/>68093796</p>-->
      <div class="linezx"><a href="">在线咨询</a></div>
    </div>
  </div>
  <!--logo telqq end-->

  <div class="clear"></div>
</div>
<!--header end-->

<!--nav start-->
<div class="nav" id="nav">
  <ul class="nav1">
    <li> <a href="index.html" target="_self"><img src="images/icon0.png" />网站首页</a> </li>
    <li> <a href="about.html"><img src="images/icon1.png" />整装套餐</a>
      <ul class="nav2">
        <li><a href="">公司简介</a></li>
        <li><a href="">公司荣誉</a></li>
        <li><a href="">企业文化</a></li>
        <li><a href="">发展历程</a></li>
      </ul>
    </li>
    <li> <a href="products.html"><img src="images/icon6.png" />设计案例</a>
      <ul class="nav2">
        <li><a href="">楼盘信息</a></li>
        <li><a href="">产品展示二</a></li>
        <li><a href="">产品展示三</a></li>
        <li><a href="">产品展示四</a></li>
      </ul>
    </li>
    <li><a href="news.html"><img src="images/icon17.png"/>热门活动</a>
      <ul class="nav2">
        <li><a href="">热装楼盘</a></li>
        <li><a href="">装修活动</a></li>
      </ul>
    </li>
    <li> <a href=""><img src="images/icon11.png"/>设计团队</a>
      <ul class="nav2">
        <li><a href="">危化物流</a></li>
        <li><a href="">速递物流</a></li>
        <li><a href="">零担速运</a></li>
        <li><a href="">冷链物流</a></li>
        <li><a href="">砂石运输</a></li>
      </ul>
    </li>
    
    <li><a href=""><img src="images/icon22.png" />说装修</a>
      <ul class="nav2">
        <li><a href="">行业资讯</a></li>
        <li><a href="">装修攻略</a></li>
        <li><a href="">家装日记</a></li>
        <li><a href="">汽车出口</a></li>
        <li><a href="">二手车业务</a></li>
      </ul>
    </li>
    <li><a href=""><img src="images/icon28.png" />蓝钻工艺</a>
      <ul class="nav2">
      </ul>
    </li>
    <li><a href=""><img src="images/icon29.png" />瑞博文服务</a>
      <ul class="nav2">
        <li><a href="">觉见问题</a></li>
        <li><a href="">在线订单</a></li>
      </ul>
    </li>
    <li><a href=""><img src="images/icon28.png" />关于瑞博文</a>
  </ul>
</div>
  <!--nav end-->






  <!--banner start-->
  <div class="banner">
	<ul class="slides">
		<li style="background:url(images/banner01.jpg) 50% 0 no-repeat;"></li>
		<li style="background:url(images/banner02.jpg) 50% 0 no-repeat;"></li>
	</ul>
  </div>
  <!-- js调用部分begin -->
	
    <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
    <script>
    $(function(){
        $('.banner').flexslider({
            directionNav: true,
            pauseOnAction: false
        });
    });
    </script>
    <!-- js调用部分end -->
  <!--banner end-->


<!--报价神器 start-->
<div class="bj">
  <div class="w1200"> 
    <div class="bj_title fl">
       <h4>报价神器</h4>
       <p>10秒获取 免费报价</p>
    </div>

    <div class="bj_input fl">
      <input name="name" type="text" class="inputname" placeholder="姓名"/>
      <input name="tel" type="text" class="inputtel" placeholder="手机"/>
      <input name="mianji" type="text" class="inputmj" placeholder="面积"/>
      <input name="baojia" type="submit" class="inputbj" placeholder="为我报价" value="为我报价"/>
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
               <span class="fr"><a href="">MORE <b>+</b></a></span>
             </div>
             <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
           </div>
            
			<section>
				<ul id="da-thumbs" class="da-thumbs clearfix">
					<li>
						<a href="">
							<img src="images/fengge01.jpg" width="273" height="205"/>
							<div><span>东南亚风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge02.jpg" width="273" height="205" />
							<div><span>混搭风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge03.jpg" width="273" height="205" />
							<div><span>简约风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge04.jpg"  width="273" height="205"/>
							<div><span>美式风格</span></div>
						</a>
					</li>
					<li>	
						<a href="">
							<img src="images/fengge05.jpg" width="273" height="205" />
							<div><span>欧式风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge06.jpg" width="273" height="205" />
							<div><span>地中海风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge07.jpg"  width="273" height="205"/>
							<div><span>中式风格</span></div>
						</a>
					</li>
					<li>
						<a href="">
							<img src="images/fengge08.jpg" width="273" height="205" />
							<div><span>田园式风格</span></div>
						</a>
					</li>
				</ul>
			</section>
        </div>
     </div>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.hoverdir.js"></script>	
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
               <span class="fr"><a href="">MORE <b>+</b></a></span>
             </div>
             <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
           </div>
        
        
<div class="al_list clearfix">
  <dl class="clearfix">
     <dt><a target="_blank" href="">装修户型</a></dt>
     <dd>
       <p class="clearfix">
         <a target="_blank" href="">全部</a>
         <a target="_blank" href="">一居</a>
         <a target="_blank" href="">两居</a>
         <a target="_blank" href="">三居</a>
         <a target="_blank" href="">多居</a>
         <a target="_blank" href="">复式</a>
         <a target="_blank" href="">别墅</a>
         <a target="_blank" href="">洋房</a>
         <a target="_blank" href="">会所</a>
         <a target="_blank" href="">其他</a>
       </p>
     </dd>
  </dl>
   
   
   <dl>
     <dt><a target="_blank" href="">房屋面积</a></dt>
     <dd>
        <p class="clearfix">
          <a target="_blank" href="">全部</a>
          <a target="_blank" href="">50~80平米</a>
          <a target="_blank" href="">80~120平米</a>
          <a target="_blank" href="">120~150平米</a>
          <a target="_blank" href="">150平米以上</a>
          <a target="_blank" href="">其他</a>
        </p>
     </dd>
   </dl>
   
</div>

<script>
    $(".al_list dl:eq(0)").find("dd").addClass("nei_span_01");
</script>
<!--案例展示-->
            

<div id="ISL_Cont_1d1" style="position: relative;">
 
 <!--01-->
 <div class="al_l fl">
    <q>
      <div class="alzs01 clearfix">
        <div class="alzs01_left fl"><a href=""><img src="images/alzs01.jpg" width="340" height="680"/></a></div>
        <div class="alzs01_right fr">
          <div class="alzs01_r_t"><a href=""><img src="images/alzs02.jpg" width="850" height="399"/><p>￥5万元起</p></a></div>
          <div class="alzs01_r_b clearfix">
            <div class="alzs01_r_b_l fl"><a href=""><img src="images/alzs03.jpg" width="420" height="270"/><p>￥5万元起</p></a></div>
            <div class="alzs01_r_b_r fr"><a href=""><img src="images/alzs04.jpg" width="420" height="270"/><p>￥5万元起</p></a></div>
          </div>
        </div>
      </div>
    
    
    </q>
    <h3><a href="" target="_blank">案例展示</a></h3>
    <div>
        <div class="al_l_l">
            <span><a href="">装修风格</a></span>
        </div>
        <div class="al_l_r">
            <p><a href="" target="_blank"> 有人曾经问我：家是什么？家是心灵的归宿，家是梦想的乐园，家是驻泊的港湾。当你脆弱的心灵受到伤害，家是抚平伤口的良药；当你正处在人生的低谷，家是重获力量的源泉 ……</a></p>
        </div>
    </div>
    <div class="clear"></div>
</div>
       
   <!--02-->
  <div class="al_l fl">
    <q>
      <div class="alzs01">
        <div class="alzs01_left fl"><a href=""><img src="images/alzs05.jpg" width="340" height="680"/></a></div>
         <div class="alzs01_right fr">
          <div class="alzs01_r_t"><a href=""><img src="images/alzs06.jpg" width="850" height="399"/><p>5￥万起</p></a></div>
          <div class="alzs01_r_b">
            <div class="alzs01_r_b_l fl"><a href=""><img src="images/alzs07.jpg" width="420" height="270"/><p>5￥万起</p></a></div>
            <div class="alzs01_r_b_r fr"><a href=""><img src="images/alzs08.jpg" width="420" height="270"/><p>5￥万起</p></a></div>
          </div>
        </div>
      </div>
    </q>
    <h3><a href="" target="_blank">案例展示</a></h3>
    <div>
        <div class="al_l_l">
            <span><a href="">装修风格</a></span>
        </div>
        <div class="al_l_r">
            <p><a href="" target="_blank"> 有人曾经问我：家是什么？家是心灵的归宿，家是梦想的乐园，家是驻泊的港湾。当你脆弱的心灵受到伤害，家是抚平伤口的良药；当你正处在人生的低谷，家是重获力量的源泉……</a></p>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!--02  -->     
               
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
          <span class="fr"><a href="">MORE <b>+</b></a></span>
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
        <div class="title_s clearfix"><h3 class="fl">装修效果图</h3><span class="fr"><a href="">MORE<b>+</b></a></span></div>
     </div>
     
     <div class="xiaoguotupic clearfix">
       <div class="xiaoguotu_picleft fl"><a href=""><img src="images/xgt01.png" width="461" height="330"/><p>装修效果图</p></a></div>
       <div class="xiaoguotu_picright fr">
         <ul class="clearfix">
           <li><a href=""><img src="images/xgt02.png" width="221" height="156"/><p>装修效果图</p></a></li>
           <li><a href=""><img src="images/xgt03.png" width="221" height="156"/><p>装修效果图</p></a></li>
           <li class="no_mar"><a href=""><img src="images/xgt04.png" width="221" height="156"/><p>装修效果图</p></a></li>
           <li class="no_mar"><a href=""><img src="images/xgt05.png" width="221" height="156"/><p>装修效果图</p></a></li>
         </ul>
     </div>
     </div>
  </div>
  
  <div class="shejishi abo_r fr">
     <div class="title">
        <div class="title_s clearfix"><h3 class="fl">设计师</h3><span class="fr"><a href="">MORE<b>+</b></a></span></div>
     </div>
    
    
    <ul id="ISL_Cont_1d3">
       <li><a href=""><img  src="images/shejishi_01.jpg" width="250" height="285"/></a><span><a href="">设计师：高晓浩</a></span></li>
       <li><a href=""><img  src="images/shejishi_02.jpg" width="250" height="285"/></a><span><a href="">设计师：刘二洁</a></span></li>
    </ul>
    <p>
      <a href="javascript:void(0)" id="Left_ding3"> <img src="images/a_uu.gif"/></a>
      <a href="javascript:void(0)" id="Right_ding3" class="pal"><img src="images/a_dd.gif" /></a>
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
 
 
 <!--装修新闻 start-->
    <div class="zx_news w1200 clearfix">
      <div class="zx_gonglue fl">
        <div class="title">
          <div class="title_s clearfix"><h3 class="fl">装修攻略</h3><span class="fr">MORE<b>+</b></span></div>
        </div>
        
        <dl class="clearfix">
          <dt class="fl"><img src="images/fengge02.jpg" width="178" height="144"/></dt>
          <dd class="fl back">
            <a href="">
              <h4>谁来拯救用户对装修公司的信心 互联网家装任重而道远</h4>
              <p> 最近,经常听说有朋友需要装修自住的房子,但他们都有一个共同的特点:在自己装和找装修公司装...</p>
              <span>2016-08-26</span>
            </a>
          </dd>
        </dl>
        
        <dl class="clearfix">
          <dt class="fl"><img src="images/fengge05.jpg" width="178" height="144"/></dt>
          <dd class="fl">
            <a href="">
              <h4>业主装饰装修房屋注意事项</h4>
              <p> 业主装饰装修房屋,需要事先告知物业服务企业并签订装饰装修管理服务协议吗?装饰装修房屋是业主的权利,但这一权力的行使应以不损害他人利益和社会公共利益为前提。在一...</p>
              <span>2016-08-26</span>
            </a>
          </dd>
        </dl>
        
        
        
        <dl class="clearfix">
          <dt class="fl"><img src="images/fengge08.jpg" width="178" height="144"/></dt>
          <dd class="fl">
            <a href="">
              <h4>楼梯装修很重要,像不像豪宅就靠它!</h4>
              <p> 楼梯设计对整个家庭的装修布局、空间启着很大的影响。如果楼梯位置安装的不对,会使美观度降低...</p>
              <span>2016-08-26</span>
            </a>
          </dd>
        </dl>
        
      </div>
      
      <div class="zx_riji fr">
        <div class="title">
          <div class="title_s clearfix"><h3 class="fl">家装日记</h3><span class="fr">MORE<b>+</b></span></div>
        </div>
        
        <img src="images/news_longpic.jpg"/>
        <ul>
          <li><span>2016-08-26</span><a href="">客厅装修失误多,活生生的毁了一套房!</a></li>
          <li><span>2016-08-26</span><a href="">“互联网+”如何助顺企颠覆传统家装行业?</a></li>
          <li><span>2016-08-26</span><a href="">2016!简一的高档装修等你来赏!</a></li>
          <li><span>2016-08-26</span><a href="">大神教你用淘宝智能装修模板提高下单转化率</a></li>
          <li><span>2016-08-26</span><a href="">猴年装修流行趋势分析 五大流行趋势你不能不知</a></li>
          <li><span>2016-08-26</span><a href="">“家装e站”:互联网家装应回归理智的快车道</a></li>
        </ul>
      </div>
    </div>
    
    
    <div class="clear"></div>
 <!--装修新闻 end-->
 
 <!--长图 start-->
 <div class="longpic">
   <div class="longpic_con w1200">
     <ul>
       <li><span>手机：</span><input type="text" id="txtMobile"/></li>
       <li><span>姓名：</span><input type="text" id="txtName"/></li>
       <li><a href=""><img src="images/t_b1.gif"/></a></li>
     </ul>
   </div>
 </div>
 <!--长图 end-->
 
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
          <a href="">
            <i class="zxlc_ico1"></i>
            <span>收房量房</span>
          </a>
        </li>
        
        
        <li>
          <a href="">
            <i class="zxlc_ico2"></i>
            <span>前期准备</span>
          </a>
        </li>
        
        
        <li>
          <a href="">
            <i class="zxlc_ico3"></i>
            <span>选装修公司</span>
          </a>
        </li>
        
        
        <li>
          <a href="">
            <i class="zxlc_ico4"></i>
            <span>设计阶段</span>
          </a>
        </li>
        
        <li>
          <a href="">
            <i class="zxlc_ico5"></i>
            <span>材料选购</span>
          </a>
        </li>
        
        <li>
          <a href="">
            <i class="zxlc_ico6"></i>
            <span>施工阶段</span>
          </a>
        </li>
        
        
        <li>
          <a href="">
            <i class="zxlc_ico7"></i>
            <span>竣工验收</span>
          </a>
        </li>
        
        <li>
          <a href="">
            <i class="zxlc_ico8"></i>
            <span>软装配饰</span>
          </a>
        </li>
        
        <li class="no_mar">
          <a href="">
            <i class="zxlc_ico9"></i>
            <span>装修保障</span>
          </a>
        </li>
      </ul>
    </div>
    
 </div>
 <div class="clear"></div>
 <!--装修流程 end-->
 
 <!--热门楼盘 start-->
 <div class="loupan">
    <div class="title w1200">
        <div class="title_cen clearfix">
           <h3 class="fl">热门楼盘</h3>
           <span class="fr">MORE <b>+</b></span>
        </div>
        <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
    </div>
    
    <div class="loupan_con w1200 clearfix">
      
      <div class="loupan_con_left fl">
        <div class="loupan_con_left_top clearfix">
          <div class="loupan_con_diqu fl">
            <ul class="clearfix">
              <li><a href="">长安区</a></li>
              <li><a href="">裕华区</a></li>
              <li><a href="">桥西区</a></li>
              <li><a href="">桥东区</a></li>
              <li><a href="">新华区</a></li>
              <li><a href="">高新区</a></li>
              <li><a href="">矿 区</a></li>
              <li><a href="">新华区</a></li>
              <li><a href="">>></a></li>
            </ul>
          </div>
          <div class="loupan_img01 fr"><img src="images/xgt01.png" width="276" height="211"/></div>
        </div>      
        
        <div class="loupan_con_left_bot">
          <div class="loupan_img02 fl"><img src="images/xgt02.png" width="276" height="211"/></div>
          <div class="loupan_img02 fr"><img src="images/xgt03.png" width="276" height="211"/></div>
        </div>
      </div>
      
      
      <div class="loupan_con_right fr">
        <div class="loupan_con_right_img"><img src="images/loupanpic01.jpg" width="615" height="438"/></div>
        <div class="loupan_con_right_cont">
          <span></span>
          <h4>更多楼盘信息</h4>
           <p>已有<b>419230</b>位业主查看小区真实案例</p>
        </div>
      </div>
      
    </div>
    
 </div>
 
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
           <span class="fr"><a href="">MORE <b>+</b></a></span>
        </div>
        <p>瑞博文专业装修为您提供省时、省力、省钱的一站式家装服务。</p>
    </div>
  
   <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
  <div class="pcont" id="ISL_Cont_1">
    <div class="ScrCont clearfix">
      <div id="List1_1">
        <!-- piclist begin -->
        <a class="pl" href="#"><img src="images/hz01.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl"href="#"> <img src="images/hz02.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz03.jpg" alt=""width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz01.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz02.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz03.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz01.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz02.jpg" alt="" width="210" height="95"/></a> 
        <a class="pl" href="#"><img src="images/hz03.jpg" alt="" width="210" height="95"/></a>
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
<div class="footer">
  <div class="foot w1200">
     <div class="link">
       友情链接：<a href=""> 重庆装修公司 </a><a href="">防火隔离带</a><a href=""> 六安房产网 </a><a href=""> 亚麻地板</a>
     </div>
     
     <div class="foot01 clearfix">
       <div class="footer_nav fl">
         <h5>快速导航</h5>
         <a href="">装修套餐</a>
         <a href="">设计案例</a>
         <a href="">热门活动</a>
         <a href="">设计团队</a>
         <a href="">装修攻略</a>
         <a href="">蓝钻工艺</a>
         <a href="">三创服务</a>
         <a href="">关于三创</a>
       </div>
       
       <div class="footer_add fl">
         <ul class="clearfix">
           <li><img src="${ctx }/www/images/icon_phone.png"/><span>热线：18332069625</span></li>
           <li><img src="${ctx }/www/images/icon_tel.png"/>电话：0311-68093796</li>
           <li><img src="${ctx }/www/images/icon_qq.png"/>QQ：68093796</li>
           <li><img src="${ctx }/www/images/icon_add.png"/>地址：河北省石家庄市桥东区建设北大街228号东海国际3层</li>
         </ul>
       </div>
       
       <div class="footer_ewm fr">
         <ul class="clearfix">
           <li><img src="${ctx }/www/images/erCode.png" width="96" height="96"/><p>官方微信</p></li>
           <li><img src="${ctx }/www/images/weibo.png" width="96" height="96"/><p>官方微博</p></li>
         </ul>
       </div>
     </div>
  </div>
  
    <div class="foot_bot">
       <div class="w1200">瑞博文装饰有限公司  备ICP  版权所有 Copyright© 2014 All Rights Reserved 技术支持：瑞博文装饰</div>
     </div>
  
</div>
<!--footer end-->

<!-- 客服代码开始 -->
<div class="side-bar" style="visibility: visible; display: block;">
  <div class="to-top"><i class="ico2"></i>TOP</div>
  <div class="side-bar-qq"><a href="" target="_blank" class="totopa"><i class="ico2"></i>
    <p>联系我们</p>
    </a></div>
  <div class="side-bar-contact"><a href="" class="totopa" target="_blank"><i class="ico2"></i>
    <p>在线留言</p>
    </a></div>
  <div class="side-bar-erweima">
    <div class="erweima"><img src="${ctx }/www/images/ercode.png">关注我们<i class="arrow3"></i></div>
    <i class="ico2"></i></div>
</div>
<!--右侧悬浮js-->
<script type="text/javascript" src="${ctx }/www/js/common.js"></script>
</body>
</html>
