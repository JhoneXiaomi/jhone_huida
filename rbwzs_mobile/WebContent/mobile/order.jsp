<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="public/include.jsp" %>    
<!doctype html>
<html>
<head>
	<meta name="viewport" content="initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no" />
	<meta name="keywords" content="${statScinterhomeSeoKeyword.value }"/>
	<meta name="description" content="${statScinterHomeSeoDesc.value }"/>
	<title>${statScinterHomeSeoTitle.value }</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css"/>
	<script type="text/javascript" src="${ctx }/mobile/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="wrap">
 <div class="ej_top">
  <div class="ej_tit clearfix">
   <div class="back fl"><img src="${ctx }/mobile/images/backicon.png"/><a href="javascript:history.back();">返回</a></div>
   <div class="lanmu">设计师</div>
  </div>
  <div class="ej_local fl">您的当前位置：<a href="${ctx }/">首页</a>> <a href="javascript:void(0)">在线订单</a></div>
 </div>
 <div class="clear"></div>
  <div class="mDingdan">
   <div class="postForm">
    <form>
      <input type="hidden" id="branchCompany" name="branchCompany" value="${branchCompany }">
	  <input type="hidden" id="sourceType" name="sourceType" value="瑞博文手机站在线订单">
	    <div class="table ext cls_contact">
           <div class="left"><span class="red">*</span> 业主姓名：</div>
           <div class="right">
             <div>
               <table cellpadding="0" cellspacing="0">
               <tbody>
	               <tr>
		               <td><input type="text" class="input-text" name="clientName" id="clientName" placeholder="业主姓名"></td>
		               <td class="clue_on">&nbsp;请填写您的姓名</td>
	               </tr>
               </tbody>
               </table>
             </div>
           </div>
           <div class="clear"></div>
	    </div>
        
	    <div class="table ext cls_phone">
           <div class="left"><span class="red">*</span> 联系手机：</div>
           <div class="right">
             <div>
               <table cellpadding="0" cellspacing="0">
	               <tbody>
		               <tr>
			               <td><input type="text" class="input-text" name="phone" id="phone" placeholder="联系手机" /></td>
			               <td class="clue_on">&nbsp;请您填写手机号码，我们会保护您的隐私</td>
		               </tr>
	               </tbody>
               </table>
             </div>
           </div>
           <div class="clear"></div>
	    </div>	    
	    <div class="table ext cls_addr">
          <div class="left">楼盘地址：</div>
          <div class="right">
            <div>
              <table cellpadding="0" cellspacing="0">
              <tbody>
	              <tr>
		              <td><input type="text" class="input-text" name="address" id="address" placeholder="楼盘地址"></td>
		              <td class="clue_on">&nbsp;填写详细楼盘或地址</td>
	              </tr>
              </tbody>
              </table>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="table ext cls_area">
          <div class="left">使用面积：</div>
          <div class="right">
            <div>
              <table cellpadding="0" cellspacing="0">
              <tbody>
	              <tr>
		              <td><input type="text" class="input-text" name="acreage" id="acreage" placeholder="使用面积">
		              <span class="add-on">平方米</span></td>
		              <td class="clue_on">&nbsp;平方米</td>
	              </tr>
              </tbody>
              </table>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="table ext cls_designer">
          <div class="left">预约设计师：</div>
          <div class="right">
            <div>
              <table cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                 <td id="_opt_parent_designer">
                 <select id="designer" style="height: 48px;weight: 100%!important;text-align: center;color: color:#FF0000;">
                     <option value="">===============请选择===============</option>
	                 <c:forEach items="${designerList }" var="designer">
	                		<option value="${designer.designerName }">${designer.designerName }</option>
	                 </c:forEach>                   
                 </select>
                 </td>
                 <td><span id="designer_tmp_show" class="stips"></span></td></tr>
                </tbody>
              </table>
            </div>
          </div><div class="clear"></div>
        </div>	   
        
         <div class="table ext cls_content">
	         <div class="left">
		         <span class="red">*</span> 装修要求：</div>
		         <div class="right">
		         <div>
			         <table cellpadding="0" cellspacing="0">
				         <tbody>
					         <tr>
					         	<td><textarea class="input-text" placeholder="装修要求" name="noto" id="noto"></textarea></td>
					         </tr>
				         </tbody>
			         </table>
		         </div>
	         </div><div class="clear"></div>
         </div>		
         <div class="table cls_check">
	     <div class="left">&nbsp;</div>
	     <div class="right">
	    </div>
     </div>

	<div class="table">
		<div class="left">&nbsp;</div>
		<input type="button" class="btn btn-red btn-lg" id="checkBut" value="提 交">
	</div>
</form>
</div>
     
</div>
<div class="clear"></div>
</div>
<!--底部导航 start-->
<jsp:include page="public/fotter.jsp"/>
<!--底部导航  end-->
<div class="" style="margin-bottom:50px;"></div>
<script type="text/javascript">

	/* 选中默认的设计师 */
	var designerName='${designerName}';
	$("#designer").val(designerName);
	/* 默认选中性别 */
	/* var designerSex = '${designerSex}';
	if(designerSex =='男' ){
		$("#sexMan").attr("checked",true);
	}else{
		$("#sexWomen").attr("checked",true);
	} */
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
	$("#checkBut").bind("click",function(){
		/*  var branchCompany = '${sessionScope.branchCompany}'; */
		 var orderId = dateTime;
		 var clientName= $("#clientName").val();
		 var phone= $("#phone").val();
		 var address= $("#address").val();
		 var acreage= $("#acreage").val();
		 var designer = $('#designer').val();
		 var sourceType= $('#sourceType').val();
		 var branchCompany= $('#branchCompany').val();
		 if(clientName==""){
			 alert("用户名不能为空，请填写用户名!");
			 return false;
		 }
		 if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
			 alert("手机号格式不正确，请重新填写手机号!");
			 return false;
		 }
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "${pageContext.request.contextPath}/m/saveOrder",
				data : {'branchCompany':branchCompany,'designer':designer,'sourceType':sourceType,'acreage':acreage,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage},
				success : function(data) {
					if (data.data == "ok") {
						alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
					}else{
						alert("保存失败");
					}
				}
			});  
		
	});
</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
