<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="/public/shangqiao.jsp" %> 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>在线订单-${cityCompany}三创装饰公司</title>
<meta name="keywords" content="${statScinterhomeSeoKeyword.value }">
<meta name="description" content="${statScinterHomeSeoDesc.value }">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/easyui.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="${ctx }/www/css/style.css">
<script type="text/javascript" src="${ctx }/www/js/nav.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/www/js/minify(2).js"></script>
<script type="text/javascript" src="${ctx}/www/js/top.js"></script>
</head>
<body>
<!--header start-->
<div class="header">
 <jsp:include page="../public/head.jsp"/>
   <!--nav start-->
   <jsp:include page="../public/nav.jsp"/>
  <!-- nav end -->
  
</div>
<!--header end-->


<div class="line_main w1180">
   <div class="list_position">您的当前位置：<a href="${pageContext.request.contextPath}/">${cityCompany}装修</a> > <a href=""> 三创服务</a></div>
  <div class="list_huodong_title"> <div class="cont_anli_title"><h3 class="">【在线订单】</h3></div></div>
  
  <div class="line_left">
     
     <div class="Column-L">
    <!--<div class="bigTitle">在线订单</div>-->
    <div class="postForm" id="postForm">
    
    <form id="orderForm">
		<input type="hidden" id="orderId" name="orderId"> 
	    <div class='table ext cls_contact'>
	        <div class='left'><span class='red'>*</span> 业主姓名：</div>
	        <div class='right'>
	        <div>
	        <table style="cellpadding: 0; cellspacing: 0;">
	        <tr>
	        <td><input type='text' class='input-text' name='clientName' id='clientName' style='width:100px;'></td>
	        <td class='clue_on' style="color: #f39800;">&nbsp;请填写您的姓名</td>
	        </tr>
	        </table>
	        </div>
	        </div>
	        <div class='clear'></div>
        </div>	    
            
        <div class='table ext cls_phone'>
	        <div class='left'><span class='red'>*</span> 联系手机：</div>
		        <div class='right'>
		        <div>
			        <table style="cellpadding: 0; cellspacing: 0;">
				        <tr>
					        <td><input type='text' class='input-text' name='phone' id='phone' style='width:150px;'></td>
					        <td class='clue_on'style="color: #f39800;">&nbsp;请您填写手机号码，我们会保护您的隐私</td>
				        </tr>
			        </table>
		        </div>
		        </div>
	        <div class='clear'></div>
        </div>	    
        <div class='table ext cls_addr'><div class='left'><span class='red'>*</span> 楼盘地址：</div>
	        <div class='right'>
		        <div>
			        <table style="cellpadding: 0; cellspacing: 0;">
				        <tr>
					        <td><input type='text' class='input-text' name='address' id='address' style='width:350px;'></td>
					        <td class='clue_on' style="color: #f39800;">&nbsp;填写详细楼盘或地址</td>
				        </tr>
			        </table>
		        </div>
		    </div>
	        <div class='clear'></div>
        </div>	 
        <div class='table ext cls_sex'>
	        <div class='left'>业主性别：</div>
		        <div class='right'>
			        <div>
				        <table style="cellpadding: 0; cellspacing: 0;">
					        <tr>
						        <td>
							        <table style="cellpadding: 0; cellspacing: 0;">
								        <tr>
									        <td><input type="radio" name="sex" id="sexMan" value="男"> 男 &nbsp; </td>
									        <td><input type="radio" name="sex" id="sexWomen" value="女"> 女 &nbsp; </td>
								        </tr>
							        </table>
						        </td>
					        </tr>
				        </table>
			        </div>
		        </div>
	        <div class='clear'></div>
        </div>	   
        <div class='table ext cls_area'>
        <div class='left' >使用面积：</div>
        <div class='right'><div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td><input type='text' class='input-text' name='acreage' id='acreage' style='width:100px;'></td>
        <td class='clue_on' style="color: #f39800;">&nbsp;平方米</td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        <div class='table ext cls_cost'><div class='left'>装修预算：</div>
        <div class='right'>
        <div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td><input type='text' class='input-text' name='budget' id='budget' style='width:100px;'></td>
        <td class='clue_on' style="color: #f39800;">&nbsp;万元</td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        <div class='table ext cls_unit'><div class='left'>您的户型：</div>
        <div class='right'><div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td>
	        <select id="houseType">
	        	<option value="无">===请选择===</option>
	        	<option value="一居">一居</option>
	        	<option value="两居">两居</option>
	        	<option value="三居">三居</option>
	        	<option value="多居">多居</option>
	        	<option value="复式">复式</option>
	        	<option value="别墅">别墅</option>
	        	<option value="洋房">洋房</option>
	        	<option value="会所">会所</option>
	        	<option value="其他">其他</option>
	        </select>
        </td>
        
        <td id='_opt_parent_unit'></td>
        <td id='_opt_son_unit' style='padding-left:3px;'></td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        
        <div class='table ext cls_dstyle'>
        <div class='left'>装修风格：</div>
        <div class='right'><div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td>
            <select id="style">
                <option value="无">===请选择===</option>
	        	<option value="现代简约" >现代简约</option>
	        	<option value="经典欧式" >经典欧式</option>
	        	<option value="中式风格" >中式风格</option>
	        	<option value="乡村田园" >乡村田园</option>
	        	<option value="地中海" >地中海</option>
	        	<option value="淡雅时光" >淡雅时光</option>
	        	<option value="美式乡村" >美式乡村</option>
	        	<option value="其他" >其他</option>
	        </select>
        </td>
        <td id='_opt_parent_dstyle'></td>
        <td id='_opt_son_dstyle' style='padding-left:3px;'></td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        
        <div class='table ext cls_designer'>
        <div class='left'>预约设计师：</div>
        <div class='right'>
        <div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td>
         <select id="designer">
                <option value="无">===请选择===</option>
                <c:forEach items="${designerList }" var="designer">
                	<option value="${designer.designerName }">${designer.designerName }</option>
                </c:forEach>
	        </select>
        </td>
        <td id=_opt_parent_designer></td>
        <td><span id='designer_tmp_show' class='stips'></span></td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        <div class='table ext cls_content'>
        <div class='left'><span class='red'>*</span> 装修要求：</div>
        <div class='right'>
        <div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr><td><textarea class='input-text' style='width:350px;height:80px' name='note' id='note'></textarea></td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>	    
        <div class='table ext cls_dtime'>
        <div class='left'>动工时间：</div>
        <div class='right'>
        <div>
        <table style="cellpadding: 0; cellspacing: 0;">
        <tr>
        <td><input class="easyui-datebox" id="startDate" name="startDate" type="text" style="width:248px;" /></td>
        <td class='clue_on' style="color: #f39800;">&nbsp;请输入预计动工时间</td>
        </tr>
        </table>
        </div>
        </div>
        <div class='clear'></div>
        </div>		
        <%-- <div class="table">
			<div class="left"><span class="red">*</span> 验证码：</div>
			<div class="right">
				<input name="sys_check" id="sys_check" type="text" class="input-text" style="width:50px;" /><img id="imgcode" src="${ctx }/www/images/yzm.png" border="0" align="top" onclick="check_code(this)" title="点击更换验证码">
			</div>
		</div> --%>
	<div class="table">
		<div class="left">&nbsp;</div>
		<div class="right"><input type="button" class="button" id="_phpok_submit" value=" 确认提交 "></div>
	</div>
</form>
</div>
</div>

     
  </div>
  <div class="line_right list_hd_right">
   
    <div class="anli_hxgh">
          <div class="anli_hxgh_title">
            <h3>免费申请户型规划</h3>
            <p>专业设计师提供全程一对一专业服务</p>
          </div>
          
          <form>
            <p><input class="inp" type="text" id="Mname" name="Mname" placeholder="您的姓名" data-title="您的姓名"></p>
            <p><input class="inp" type="text" id="Mphone" name="Mphone" placeholder="您的手机号" data-title="您的手机号"></p>
            <p><input class="inp" type="text" id="Maddress" name="Maddress" placeholder="楼盘名称" data-title="楼盘名称"></p>
            <p><input class="inp" type="text" id="Macreage" name="Macreage" placeholder="房屋面积" data-title="房屋面积"></p>
            <p class="">
            <input type="hidden" id="orderId" name="orderId"  >
            <input type="button" class="sq" onclick="bjbaoming()" id="MsourceType" name="MsourceType"  value="免费申请">
            </p>
            <p></p>
           
          </form>
        </div> 
  </div>
</div>

<!--footer start-->
<jsp:include page="../public/fotter.jsp"/>
<!--footer end--
<!--右侧悬浮 开始-->
<jsp:include page="../public/fastToTop.jsp"/>
<!--右侧悬浮 结束-->
<script src="${pageContext.request.contextPath}/static/www/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.datebox.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var designerName='${designerName}';
$("#designer").val(designerName);
var orderId = $("#orderId").val();
/* 默认选中性别 */
var designerSex = '${designerSex}';
if(designerSex =='男' ){
	$("#sexMan").attr("checked",true);
}else{
	$("#sexWomen").attr("checked",true);
}
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
    
//设置easyui-datebox日期只读
$(".datebox :text").attr("readonly","readonly");
$(".datetimebox :text").attr("readonly","readonly");

/*保存 */
$("#_phpok_submit").click(function(){
	 
   	/*  var acreage = $("#acreage").val(); */
	 var branchCompany = '${sessionScope.branchCompany}';
	 var orderId = $("#orderId").val();
	 var sex= $("#sex").val();
	 var clientName= $("#clientName").val();
	 var phone= $("#phone").val();
	 var address= $("#address").val();
	 var acreage= $("#acreage").val();
	 var budget= $("#budget").val();
	 var houseType= $("#houseType").val();
	 var style= $("#style").val();
	 var designer= $("#designer").val();
	 var note= $("#note").val();
	 var startDate=$("#startDate").combobox('getValue');
	 var sourceType= "在线订单";
	 if(clientName!="" && phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/) && address!=""){
		 $.ajax({
				type : "POST",
				dataType : "json",
				async: false,
				url : "${pageContext.request.contextPath}/saveOrder",
				data : {'sourceType':sourceType,'acreage':acreage,'branchCompany':branchCompany,'orderId':orderId,'sex':sex,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'budget':budget,'houseType':houseType,'style':style,'designer':designer,'note':note,'startDate':startDate},
				success : function(data) {
					if (data.data == "ok") {
						alert("您的订单已经提交成功!");
					}else{
						
						alert("保存失败");
					}
				}
			});  
	 }else if(clientName==""){
		 alert("姓名不能为空,请填写姓名!");
	 }else if(!phone.match(/^(((1[0-9][0-9]{1})|159|153)+\d{8})$/)){
		 alert("手机号格式不正确,重新填写手机号!");
	 }else if(address==""){
		 alert("楼盘名称不能为空,请填写楼盘名称!");
	 }
});
function bjbaoming(){
	 var orderId = $("#orderId").val();
	 var clientName= $("#Mname").val();
	 var phone= $("#Mphone").val();
	 var address= $("#Maddress").val();
	 var acreage= $("#Macreage").val();
	 var sourceType= $("#MsourceType").val();
	 var branchCompany = '${sessionScope.branchCompany}';
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
			url : "${pageContext.request.contextPath}/saveOrder",
			data : {'branchCompany':branchCompany,'orderId':orderId,'clientName':clientName,'phone':phone,'address':address,'acreage':acreage,'sourceType':sourceType},
			success : function(data) {
				if (data.data == "ok") {
					alert("请您稍等，稍后会有客服人员为您服务!");
				}else{
					
					alert("保存失败");
				}
			}
		});  
}
function faseMoney(){
	
	window.location.href="${ctx }/orderLine";
}
</script>
${sessionScope.statistics.value }
${sessionScope.shangqiao.value }
</body>
</html>