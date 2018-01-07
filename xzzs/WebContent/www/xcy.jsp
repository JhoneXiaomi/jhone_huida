<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="public/include.jsp" %>
 <%@ include file="public/shangqiao.jsp" %>   
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新洲新站PC——团装小区列表页</title>

	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/www/css/component.css" />
	<script type="text/javascript" src="${ctx }/www/js/xcy_js.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/pptBox.js"></script>
	<script type="text/javascript" src="${ctx }/www/js/commen.js"></script>


</head>
<body>

<div class="md-modal md-effect-1" id="modal-1" >
					<div>
					<div class="md-content">
						<h3>立即预约设计师</h3>
						<div>
							<p>您的姓名：<input type="text" name="order_clientName"/></p>
							<p>您的手机：<input type="text" name="order_phone"/></p>
							<p>楼盘信息：<input type="text" name="order_address"/></p>							
							<p>房屋面积：<input type="text" name="order_acreage"/></p>
							<p>设&nbsp;计&nbsp;师&nbsp;:
							<%-- <select name="designerName" id="designerName" style="width:200px;font-size:12px">
								<c:forEach items="${designerList }" var="designer">
									<option value="${designer.designerName }">${designer.designerName } </option>
								</c:forEach>
							</select> --%>
							</p>
							<div class="submit_btn" id="but_order">立即预约</div>
							<button class="md-close" style="left: 317px;"></button>	
						</div>
					</div>
					</div>
				</div>	
	<div class="xcy">
	  <div class="xcy_img">
	    <img src="${ctx }/www/images/xcy_01.jpg" alt=""/>
	    <div class="bm01_div">
	      <img class="bm01" src="${ctx }/www/images/xcy_02.jpg" alt=""/>
	      <span class="bm01_con"><button class="md-trigger" data-modal="modal-1" style="backgroud-color:transparent;color:#fff;border:0;">立即报名</button></span>
	    </div>
	    <img src="${ctx }/www/images/xcy_03.jpg" alt=""/>
	    <img src="${ctx }/www/images/xcy_04.jpg" alt=""/>
	   <div class="xcy_bg">   
		<div id="imgPlay">
			<ul class="imgs">
				<li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0101.jpg"></a></li>
				<li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0102.jpg"></a></li>
				<li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0103.jpg"></a></li>
			</ul>
			<div class="num">
				<p class="lc"></p>
				<p class="mc"></p>
				<p class="rc"></p>
			</div>
			<div class="num" id="numInner"></div>
			<div class="prev">上一张</div>
			<div class="next">下一张</div>
		</div>
	  </div>  
	    
	    
	    
	    <img  src="${ctx }/www/images/xcy_05.jpg" alt=""/>
	     <div class="xcy_bg">   
	      <div id="imgPlaya">
	          <ul class="imgs">
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0201.jpg"></a></li>
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0202.jpg"></a></li>
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0203.jpg"></a></li>
	          </ul>
	          <div class="num">
	              <p class="lc"></p>
	              <p class="mc"></p>
	              <p class="rc"></p>
	          </div>
	          <div class="num" id="numInner"></div>
	          <div class="prev">上一张</div>
	          <div class="next">下一张</div>
	      </div>
	    </div>  
	    
	    
	    
	    <img src="${ctx }/www/images/xcy_06.jpg" alt=""/>
	     <div class="xcy_bg">   
	      <div id="imgPlayb">
	          <ul class="imgs">
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0301.jpg"></a></li>
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0302.jpg"></a></li>
	          </ul>
	          <div class="num">
	              <p class="lc"></p>
	              <p class="mc"></p>
	              <p class="rc"></p>
	          </div>
	          <div class="num" id="numInner"></div>
	          <div class="prev">上一张</div>
	          <div class="next">下一张</div>
	      </div>
	    </div> 
	     
	    
	    <div class="bm02_div">
	    <img class="bm02" src="${ctx }/www/images/xcy_07.jpg" alt=""/>
	    
	     <div class="xcy_bg">   
	      <div id="imgPlayc">
	          <ul class="imgs">
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0401.jpg"></a></li>
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0402.jpg"></a></li>
	              <li><a href="" target="_blank"><img title="" src="${ctx }/www/images/xcyimg_0403.jpg"></a></li>
	          </ul>
	          <div class="num">
	              <p class="lc"></p>
	              <p class="mc"></p>
	              <p class="rc"></p>
	          </div>
	          <div class="num" id="numInner"></div>
	          <div class="prev">上一张</div>
	          <div class="next">下一张</div>
	      </div>
	    </div> 
	    <span class="bm02_con"><a href="http://www.xz27800.com/cases/p1">查看更多案例>></a></span>
	    </div>
	    <img src="images/xcy_08.jpg" alt=""/>
	    <img src="images/xcy_09.jpg" alt=""/>
	    <img src="images/xcy_10.jpg" alt=""/>
	    <div class="bm03_div"><img  class="bm03" src="${ctx }/www/images/xcy_11.jpg" alt=""/>
	     <span class="bm03_con"><a href="http://www.xz27800.com">更多优惠活动等您来>></a></span>
	    </div>
	  </div>
	</div>
	
	<div class="clear"></div>
		<script src="${ctx }/www/js/classie.js"></script>
		<script src="${ctx }/www/js/modalEffects.js"></script>
	
		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="${ctx }/www/js/cssParser.js"></script>
		<script src="${ctx }/www/js/css-filters-polyfill.js"></script>
<script type="text/javascript">

		 $(".submit_btn").click(function(){
				
				var orderId =  getOrderId();
				var order_clientName = $("input[name='order_clientName']").val();
				var order_phone = $("input[name='order_phone']").val();
				var order_acreage = $("input[name='order_acreage']").val();
				var branchCompany= '${sessionScope.branchCompany}';
				var order_address = $("input[name='order_address']").val();
				// var designerName = $("#designerName").val();
				console.info("order_clientName:"+order_clientName+"order_phone:"+order_phone+"order_address"+order_address);
				if(order_clientName.match(/^\s*$/)){
					
					alert("对不起，请填写您的名字！");
					return false;
				}
				if(!order_phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
					
					alert("对不起，请填写您的手机号！");
					return false;
				}
				if(order_address.match(/^\s*$/)){
					
					alert("对不起，请填写您的地址！");	
					return false;
				}
			    $.ajax({
			    	
			    	type : "POST",
					dataType : "json",
					url : "${ctx}/saveOrder",
					data : {'acreage':order_acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':order_clientName,'phone':order_phone,'address':order_address,'sourceType':'立即预约'},
					success : function(data) {
						
						if (data.data == "ok") {
							alert("请您稍等，稍后会有客服人员为您服务!");
						}else{
							alert("保存失败");
						}
					}
			    });
				$(".md-close").click();
			});
	</script>
	
	${sessionScope.statistics.value }
	${sessionScope.shangqiao.value }		
	${sessionScope.cnzzSession }
</body>
</html>
