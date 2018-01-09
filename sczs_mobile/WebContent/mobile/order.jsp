<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="x-rim-auto-match" content="none"> 
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<title>${statScinterHomeSeoTitle.value }</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"  />
<link rel="stylesheet" type="text/css" href="${ctx }/mobile/css/style.css">
</head>
<body>
  <div class="wrap">
    <div class="mList_al clearfix">
      <div class="mList_title fl">
        <h3>【在线订单】</h3>
      </div>
      <div class="mList_position fr">您的当前位置：<a href="${ctx }/">首页</a> > <a href="">在线订单</a></div>
    </div>
   
   <div class="mDingdan">
     
   <div class="postForm">
    <form >
      <input type="hidden" id="tourl" name="tomsg" value="发布成功，我们将第一时间与您取得联系！">
	  <input type="hidden" id="subject" name="subject" value="来源：在线订单【手机订单】">
	    <div class="table ext cls_contact">
           <div class="left"><span class="red">*</span> 业主姓名：</div>
           <div class="right">
             <div>
               <table cellpadding="0" cellspacing="0">
               <tbody>
               <tr>
               <td>
               <input type="text" class="input-text" name="clientName" id="clientName" placeholder="业主姓名" >
               </td>
               </tr></tbody>
               </table>
             </div>
           </div>
           <div class="clear"></div>
	    </div>
        
	    <div class="table ext cls_phone">
           <div class="left"><span class="red">*</span> 联系手机：</div>
           <div class="right">
             <div>
               <table cellpadding="0" cellspacing="0"><tbody><tr>
               <td><input type="text" class="input-text" name="phone" id="phone" placeholder="联系手机" value="">
               </td><td class="clue_on">&nbsp;请您填写手机号码，我们会保护您的隐私</td></tr></tbody>
               </table>
             </div>
           </div>
           <div class="clear"></div>
	    </div>	    
            
	    <div class="table ext cls_addr">
          <div class="left">楼盘地址：</div>
          <div class="right">
            <div>
              <table cellpadding="0" cellspacing="0"><tbody><tr>
              <td><input type="text" class="input-text" name="address" id="address" placeholder="楼盘地址" value=""></td><td class="clue_on">&nbsp;填写详细楼盘或地址</td></tr></tbody>
              </table>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="table ext cls_area">
          <div class="left">使用面积：</div>
          <div class="right">
            <div>
              <table cellpadding="0" cellspacing="0"><tbody><tr>
              <td >
              <input type="text" class="input-text" name="acreage" id="acreage" placeholder="使用面积" >
              <span class="add-on">平方米</span></td><td class="clue_on">&nbsp;平方米</td></tr></tbody>
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
                <tbody><tr>
                 <td><input type="hidden" name="designer" id="designer"></td>
                 <td id="_opt_parent_designer">
                 <select id="Mdesigner"  name="designer">
                    <option value="无">点击选择设计师</option>
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
        <div class="right"><div>
        <table style="cellpadding: 0px; cellspacing: 0px; width: 100%;">
	        <tbody>
		        <tr>
			        <td>
			       	 <textarea class="input-text" placeholder="装修要求" name="note" id="note" style="width: 100%;"></textarea>
			        </td>
		        </tr>
	        </tbody>
        </table>
        </div>
        </div>
        <div class="clear"></div>
        </div>		
        <div class="table cls_check">
	
	<input type="hidden" id="orderId" name="orderId"> 
	<input type="hidden" id="sourceType" name="sourceType" value="在线订单">
</div>



	<div class="table">
		<div class="left">&nbsp;</div>
		<div class="jz_more"><input type="button" onclick="bjbaoming()" class="btn btn-red btn-lg" value="提 交"/></div>
	</div>
   </form>
   </div>
   </div>
  </div>
<!--底部导航 start-->
<jsp:include page = "public/fotter.jsp"/>
<!--底部导航  end-->   
<script src="${pageContext.request.contextPath}/static/www/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.datebox.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/mobile/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">

   /* 实现点击预约默认选中 */
   $(document).ready(function(){
			var designerName='${designerName}';
			
			$("#Mdesigner").val(designerName);
				
			
		});
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
    $("#orderId").val(dateTime);
    
function bjbaoming(){
	 
	 var branchCompany = '${sessionScope.branchCompany}';
	 var orderId = $("#orderId").val();
	 var clientName= $("#clientName").val();
	 var phone= $("#phone").val();
	 var address= $("#address").val();
	 var acreage= $("#acreage").val();
	 var designer= $("#Mdesigner").val();
	 var note= $("#note").val();
	 var sourceType= "在线订单(手机站)";
	 if(clientName.match(/^\d*$/)){
         alert('请填写正确的姓名');
         return false;
     }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
         alert('请填写11位号码');
         return false;
     }else if(acreage === ''){
         alert('请填写面积');
         return false;
     }
	 $.ajax({
			type : "POST",
			dataType : "json",
			async: false,
			url : "${pageContext.request.contextPath}/saveMOrder",
			data : {'sourceType':sourceType,'acreage':acreage,'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'designer':designer,'note':note},
			success : function(data) {
				if (data.data == "ok") {
					alert("您的订单已经提交成功，稍后会将有工作人员联系你！");
				}else{
					
					alert("保存失败");
				}
			}
		});  
	
}
</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>
