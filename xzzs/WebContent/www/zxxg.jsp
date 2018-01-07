<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath}" var="ctx" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新洲新站PC首页</title>
<link rel="stylesheet" type="text/css" href="../www/css/style.css"/>
<script type="text/javascript" src="../www/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../www/js/pptBox.js"></script>

<!--底部报价 js-->
<script src="../www/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script>
   var jq = jQuery.noConflict();
</script>
<script type="text/javascript" src="../www/js/db_01.js"></script>
<script type="text/javascript" src="../www/js/GlobalProvinces.js"></script>
<script src="../www/js/bdzxbj_bottom_new.js" type="text/javascript"></script>
<!--底部报价 js-->


<!--产品配置 js-->
<script type="text/javascript" src="../www/js/jquery-1.8.3.min.js"></script> 
<script src="../www/js/jquery.scrollbox.js"></script><!--设计师-->
<script type="text/javascript" src="../www/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="../www/js/js.js"></script>
<!--产品配置 js-->



<script type="text/javascript" src="../www/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../www/js/pptBox.js"></script>
<script type="text/javascript" src="../www/js/hezuo.js"></script> 

</head>

<body>
<!--邀请框  start-->
	<input type="hidden" id="branchCompany" value="${branchCompany }"/>
	<div class="tan_body" id="popFormtan" style="display: none;">
		<div class="tan_main">
			<div class="tan_main_m">
				<div class="tan_top">
					<a><img src="${ctx}/www/images/top01.png"
						style="display: inline;"></a>
					<div class="tan_top_right">
						<a class="popFormCloseBtntan" href="javascript:void(0);"><img
							src="${ctx}/www/images/top_right.jpg"></a>
					</div>
				</div>
				<div class="tan_left">
					<h2>装修计算器</h2>
					<p class="ff_title">
						今天已有<font>628</font>位业主获得报价
					</p>
					<form id="tanForm" action="" method="post">
						<ul class="tan_left_b">
							<li><p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</p>
								<span class="color_gold">*</span><input type="text"
								name="clientName" placeholder="请输入您的姓名"
								class="tan_left_input"></li>
							<li><p>房屋面积:</p>
								<span class="color_gold">*</span><input type="text"
								name="acreage" placeholder="请输入房屋面积" class="tan_left_input"></li>
							<li><p>手机号码:</p>
								<span class="color_gold">*</span><input type="text"
								name="phone" placeholder="请输入您的手机号码"
								class="tan_left_input"></li>
							<li><!-- <input type="text" name="data[url]" value=""
								style="display: none;"> <input type="hidden"
								name="submit" value="提交">  --><input type="button"
								value="开始报价" class="ff_red_btn" onclick="submitOrder()" id="lb_submitButton"></li>
						</ul>
					</form>
				</div>
				<div class="tan_right">
					<a><img src="${ctx}/www/images/right_1.png"
						style="display: inline;"></a>
					<!--<p>关注官方微信</p> 
      <h2 style="margin-top:0px;">400-0940-100</h2>-->
					<p>
						<b>周一至周末8:00-23:00</b>
					</p>
					<h2 class="tan_right_h2"
						style="margin-top: 10px; padding-top: 10px;">
						<a
							href="http://pht.zoosnet.net/LR/Chatpre.aspx?id=PHT90969211&lng=cn"
							onclick="openZoosUrl();return false;" target="_blank"
							style="color: #FD3331;">立刻咨询客服</a>
					</h2>
				</div>
			</div>
		</div>
	</div>


<div class="xgt_banner"><img src="../www/images/zxxg/pcxgt_banner.jpg" /></div>

<div class="main w1200">
  
  
<!--产品配置 start-->
<div class="peizhi">
  <div class="pz_1 pz689_box">
    <div class="pz_title1 title689 title689_1">打造舒适乐活之家</div>
    <div class="pz_hd pz689">
      <ul>
        <li><span class="pz_span_1">&nbsp;</span></li>
        <li><span class="pz_span_2">&nbsp;</span></li>
        <li><span class="pz_span_3">&nbsp;</span></li>
        <li><span class="pz_span_4">&nbsp;</span></li>
        <li><span class="pz_span_5">&nbsp;</span></li>
        <li class="pz_last"><span class="pz_span_6">&nbsp;</span></li>
      </ul>
    
    <div class="clear19">&nbsp;</div>
    </div>
    
    <div class="pz_bd">
      <div class="bdcon" style="display: none;">
        <div class="bd_img"><img alt="客餐厅" src="../www/images/zxxg/kct.jpg"></div>
        <div class="bd_taocan">
          <div class="bd_titile">客餐厅配置</div>
          <span>1、基层处理</span><br>
          <span>2、墙衬 </span><br>
          <span>3、墙 漆</span><br>
          <span>4、顶面乳胶漆</span><br>
          <span>5、石膏线</span>
          <div class="bd_bottom">-------全包含-------</div>
        </div>
        <div class="clear19">&nbsp;</div>
      </div>
    <!--客厅end-->
      <div class="bdcon" style="display: block;">
        <div class="bd_img"><img alt="厨房" src="../www/images/zxxg/cf.jpg"></div>
        <div class="bd_taocan">
          <div class="bd_titile">厨房配置</div>
          <span>1、钛镁合金门</span><br>
          <span>2、墙地砖</span><br>
          <span>3、铝扣板吊顶满铺</span><br>
          <span>4、扣板吊顶</span><br>
          <span>5、整体橱柜</span><br>
          <span>6、水槽/龙头</span><br>
          <span>7、集成灯</span><br>
          <span>8、过门石</span>
          <div class="bd_bottom">-------全包含-------</div>
        </div>
       <div class="clear19">&nbsp;</div>
      </div>
    <!--客厅end-->
      <div class="bdcon" style="display: none;">
        <div class="bd_img"><img alt="卧室" src="../www/images/zxxg/ws.jpg"></div>
        <div class="bd_taocan">
          <div class="bd_titile">卧室配置</div>
          <span>1、基层处理</span><br>
          <span>2、墙衬 </span><br>
          <span>3、墙 漆</span><br>
          <span>4、木地板/找平</span><br>
          <span>5、套装木门</span><br>
          <span>6、五金件</span><br>
          <span>7、石膏线</span><br>
          <span>8、过门石</span>
          <div class="bd_bottom">-------全包含-------</div>
        </div>
      <div class="clear19">&nbsp;</div>
      </div>
    <!--客厅end-->
      <div class="bdcon" style="display: none;">
        <div class="bd_img"><img alt="卫生间" src="../www/images/zxxg/wsj.jpg"></div>
        <div class="bd_taocan">
          <div class="bd_titile">卫生间配置</div>
          <span>1、钛镁合金门</span><br>
          <span>2、墙地砖</span><br>
          <span>3、扣板吊顶</span><br>
          <span>4、洁具</span><br>
          <span>6、集成灯</span><br>
          <span>7、包立管。 </span><br>
          <span>8、防水</span><br>
          <span>9、过门石</span><br>
          <span>9、地漏</span>
          <div class="bd_bottom">-------全包含-------</div>
        </div>
        <div class="clear19">&nbsp;</div>
      </div>
    <!--客厅end-->
      <div class="bdcon" style="display: none;">
        <div class="bd_img"><img alt="阳台" src="../www/images/zxxg/qt.jpg"></div>
        <div class="bd_taocan">
          <div class="bd_titile">其他配置</div>
          <span>1、水泥、沙子</span><br>
          <span>2、材料搬运</span><br>
          <span>3、垃圾清理 </span><br>
          <span>4、成品保护 </span><br>
          <span>5、主材损耗</span>
          <div class="bd_bottom">-------全包含-------</div>
        </div>
      <div class="clear19">&nbsp;</div>
      </div>
    <!--客厅end--></div>
</div>
<!--产品配置-->
</div>
<!--产品配置  end-->
  
  
  
  
  
  
  
  
  <!--产品优势 start-->
  <div class="zxxg_youshi">
    <div class="peizhi">
      <div class="pz_1 pz689_pinpai">
      <div class="pz_title1 title689 title689_3">打造舒适乐活之家</div>
        <ul class="youshi">
          <li>
            <div class="yz_title yz_odd">包含水电</div>
            <span>唯一一家含水电的套餐，杜绝水电施工过程增项。</span>
            <div class="yzodd_box">&nbsp;</div>
          </li>
          <li>
            <div class="yz_title  yz_ogg">一站式</div>
            <span>5890m²体验馆一站式选购所有材料百分百正品。整修效果及装修费用用户心中有数，杜绝边装边改边加钱。</span>
            <div class="yzodd_box">&nbsp;</div>
          </li>
          <li>
            <div class="yz_title  yz_odd">精准报价</div>
            <span>新洲装饰将家装工程与材料产品进行整合，六个不计量（水电、地板、墙砖、地砖、乳胶漆、扣板）全包，避免装修预算低开</span>
            <div class="yzodd_box">&nbsp;</div>
          </li>
          <li class="no_bor">
            <div class="yz_title  yz_ogg">规模采购</div>
            <span>降低采购成本，价格降到最低，同时省去客户自己采购过程中的交通费，误工费，餐费等杂费。</span></li>
          <li>
            <div class="yz_title  yz_odd">双倍退差</div>
            <span>保障客户始终享受合作主材最优惠价格并做出双倍退差承诺，让客户不在为买贵担忧。</span></li>
          <li>
            <div class="yz_title  yz_ogg">无忧服务</div>
            <span>帮助客户完成装修过程中主材订货、验货、补货、退货，安装繁琐工作，节省客户时间成本。</span></li>
          <li>
            <div class="yz_title  yz_odd">全责售后</div>
            <span>新洲装饰全责售后服务，为您协调装修中的各种问题，避免了多头对接造成的责任推诿，让消费者享受无忧整装服务。</span></li>
          <li class="no_bor">
        <div class="yz_title  yz_ogg">品牌传承</div>
        <span>新洲装饰成立18年本土企业行业内首推套餐，并先后获得中国装饰协会颁发的AAAAA级诚信企业“3·15诚信企业”等荣誉。</span></li>
        </ul>
      </div>
     </div>
  </div>
  <!--产品优势  end-->

 
 
 <!--案例展示 start-->
<div class="zxxg_anli">
  <div class="anli_list w1200 clearfix">
    
    <div class="peizhi"><div class="pz_title1 title689 title689_5">打造舒适乐活之家</div></div>
    <c:forEach items="${casesList }" var="cases" begin="0" end="5" varStatus="status">
    	<c:if test="${(status.index+1)%3 != 0 }">
		    <dl>
		      <dt><a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		      		<img src="${cases.caseThumbImg }" width="380" height="288"/>
		      		</a>
		      	</dt>
		      <dd>
		        <p><span class="">【案例】</span>【${cases.caseCommunity }】    ${cases.caseHouseType }  ${cases.caseStyle }   ${cases.caseAcreage }㎡</p>
		             <p class="detail">
		               <a href=""><img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/><span class="m50">${cases.designerName }</span></a>
		               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
		               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
		               <!--<span class="m13">这样装修多少钱？</span>-->
		               <a href="${ctx}/subject/xzpc" style="height:20px; line-height:20px;"><font class="col">这样装修得花多少钱？</font></a>
		               
		             </p>
		      </dd>
		    </dl>
     	</c:if>
     	 <c:if test="${(status.index+1)%3 == 0 }">
	    	<dl class="no_mar">
		      <dt><a href="${ctx}/casesDetail?casesId=${cases.caseId }&designerId=${cases.designerId}">
		      		<img src="${cases.caseThumbImg }" width="380" height="288"/>
		      		</a>
		      </dt>
		      <dd>
		        <p><span class="">【案例】</span>【${cases.caseCommunity }】   ${cases.caseHouseType }  ${cases.caseStyle }   ${cases.caseAcreage }㎡</p>
		             <p class="detail">
		               <a href=""><img class="photo" src="${cases.designerPhoto }" alt="${cases.designerName }"/><span class="m50">${cases.designerName }</span></a>
		               <span class="m8"><i>${cases.caseThumbNumber }</i>张</span>
		               <span class="m12"><i>${cases.caseReadNum }</i>浏览</span>
		               <!--<span class="m13">这样装修多少钱？</span>-->
		               <a href="${ctx}/subject/xzpc" style="height:20px; line-height:20px;"><font class="col">这样装修得花多少钱？</font></a>
		               
		             </p>
		      </dd>
		    </dl>
	     </c:if>    
    </c:forEach>
  </div>
</div> 

 <!--案例展示 end-->
  
  
  
  
  <!--设计师 start-->
   <div class="hzbj">
<!-- picrotate_left start  -->
<div class="blk_18"> 
   <div class="title">
        <div class="title_cen title_cen01 clearfix">
           <h3 class="fl">大牌设计师</h3>
           <!--<span class="fr"><a href="">MORE <b>+</b></a></span>-->
        </div>
    </div>
  <div class="padlef">
   <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
  <div class="pcont pcont01" id="ISL_Cont_1">
    <div class="ScrCont clearfix">
      <div id="List1_1">
        <!-- piclist begin -->
        <c:forEach items="${designers }" var="designer" varStatus="status" >
        	<a class="pl" href="${ctx}/designerDetail/p1?designerId=${designer.designerId}">
        	<img src="${designer.designerPhotoImg }" width="150" height="150" alt="${companyCity}新洲装修设计师${designer.designerName}" />
        	<span>${designer.designerName} ${designerDept}</span></a>
        
        </c:forEach>
        <!-- piclist end -->
      </div>
      <div id="List2_1"></div>
    </div>
  </div>
   <a class="RightBotton" onmousedown="ISL_GoDown_1()" onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()" href="javascript:void(0);" target="_self"></a> 
   </div>
</div>
 
 </div>
<!--设计师 end-->
  
  
  
  <div class="clear"></div>
  <!--合作品牌 start-->
    <div class="hzpp">
       <div class="pz_title1 title689 title689_2">打造舒适乐活之家</div>
      
      <!--<div class="main_title"><h2 class="fl">合作品牌</h2><span>/&nbsp;&nbsp;一线大牌让您无忧住新家？</span></div>-->
      <ul class="clearfix">
	      <c:forEach items="${homeCok}" var="coworker" varStatus="status">
	      	<c:if test="${(status.index+1)%5 != 0 }">
				 <li>
					<img src="${coworker.value}" width="225" height="107"/>
				 </li>
			</c:if>
			<c:if test="${(status.index+1)%5 == 0 }">
				<li class="no_mar">
					<img src="${coworker.value}" width="225" height="107"/>
				</li>
			</c:if>
	       </c:forEach>
      </ul>
    </div>
  <!--合作品牌 end-->
  
</div>

<div class="clear"></div>
<script>
		var checkSubmitFlg = false; //全局变量防止提交两次
		function showtan() {
			var popFormtan = document.getElementById("popFormtan");
			popFormtan.style.display = "block";

		}
		var itime = 5000;
		$(".popFormCloseBtntan").click(function() {
			setTimeout('showtan()', itime);
			itime += 8000;
			$("#popFormtan").fadeOut();
	
		});
		
		function submitOrder(){
			
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
			var orderId = year + month +  day + hour + minute + second + ms;
			var clientName= $("input[name='clientName']").val();
			 var phone= $("input[name='phone']").val();
			 var acreage= $("input[name='acreage']").val();
			 var branchCompany= $('#branchCompany').val();
			 console.info("orderId"+orderId,"clientName"+clientName+"phone"+phone+"acreage"+acreage+"branchCompany"+branchCompany);
			 var reg = /^\d+\.?\d*$/;//用于判断面积是否为数字
			 var acreages=$.trim(acreage);//房屋面积去空格
			 if(checkSubmitFlg==false&&!clientName.match(/^\s*$/) && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)&&reg.test(acreages)){
				 checkSubmitFlg = true; 
				 
				 $.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/saveOrder",
						data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'acreage':acreage,'sourceType':'在线订单'},
						success : function(data) {
							if (data.data == "ok") {
								alert("请您稍等，稍后会有客服人员为您服务!");
								$("#popFormtan").hide();
							}else{
								alert("保存失败");
							}
						}
					});  
			 }else if(clientName.match(/^\s*$/)){
				 alert("对不起,请正确填写姓名!");
			 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
				 alert("对不起，请正确填写电话格式!");
			 }else if(!reg.test(acreages)){
				 alert("对不起,请正确填写房屋面积!");
			 }else if(checkSubmitFlg){
				 alert("已经提交您的信息,稍后会有客服人员为您服务!")
			 }
		}
		
		$(document).ready(function() {
			if (getCookie("Browse") == "idea") {

			} else {
				setTimeout('showtan()', 5000);//1000毫秒后弹出根据自己的需要设置时间

			}
			if(checkSubmitFlg){
				$("#popFormtan").hide();
			}
		})
	</script>


	<!--邀请框 end-->
${sessionScope.shangqiao.value }
</body>
</html>