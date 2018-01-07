<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>活动信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/easyui.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/common.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/QA.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/webuploader.css" type="text/css" >
</head>
<body>
<div class="wrapper details notblbew" id="js_layout">
    <div data-options="region:'center'" class="noborder">
        <div class="easyui-tabs" data-options="tools:'#tab-tools'" id="tabs"> 
            <div title="活动基本信息" data-options="" class="pad10 relative" id="tab1">
				<form id="newsForm" method="post" action="/admin/saveMscActivity">
				<input type="hidden" id="id" name="id" value="${mobileActivityDtoInfo.id}"  />
                <input type="hidden" id="createId" name="createId" value="${mobileActivityDtoInfo.createId}" />
               <%--  <input type="hidden" id="createTime" name="createTime" value="${mobileActivityDtoInfo.createTime}" /> --%>
                <input type="hidden" id="person" name="person" value="${mobileActivityDtoInfo.person}" />
             <%--    
                <input type="hidden" id="createTime" name="createTime" value="${mobileActivityDtoInfo.createTime}" />
                <input type="hidden" id="seoTitle" name="seoTitle" value="${mobileActivityDtoInfo.seoTitle}"  />
                <input type="hidden" id="seoKeyword" name="seoKeyword" value="${mobileActivityDtoInfo.seoKeywords}" />
                <input type="hidden" id="seoDesc" name="seoDesc" value="${mobileActivityDtoInfo.seoDesc}" /> --%>
                <table class="forms" style="table-layout:fixed;">
                    <tbody>
                    	<tr>
                            <td class="right" width="120"></td>
                            <td width="300"></td>
                            <td class="right" width="120"></td>
                            <td width="300"></td>
                        </tr>
                    	<tr>
                    		<td class="right"><i class="require">*</i>活动标题：</td>
                    		<td>
                    			<input class="txt" id="title" name="title" type="text" value="${mobileActivityDtoInfo.title}" />
                    		</td>
                    		<c:if test='${sessionScope.Role.roleName=="超级管理员" }'>
                    		<td class="right" width="10%"><i class="require">*</i>隶属分公司：</td>
                    		<td colspan="3">
                    			<select name="branchCompany" id="branchCompany" class="easyui-combobox" 
                    			data-options="panelHeight:'200',editable : false,
                    			valueField: 'id',
                     			textField: 'text',
                     			groupField:'group',
                     			url:'${pageContext.request.contextPath}/static/www/json/scinter/scinter_company.json',
                     			onLoadSuccess:function(data){
			                    	var status = '${mobileActivityDtoInfo.branchCompany }';
			                    	if(status!=''){
			                   			$('#branchCompany').combobox('setValue',status);
			                   		}
			                    }" style="width:247px;">
                    			 	<option>===请选择===</option>
                    			</select>
                    		</td>
                    	</c:if>
                    	</tr>
                    	<tr>
                    		<td class="right" width="10%"><i class="require">*</i>活动正文：</td>
                    		<td colspan="3" width="80%">
                    			<!-- 加载编辑器的容器 -->
							    <script id="container" name="content" type="text/plain">${mobileActivityDtoInfo.content}</script>
							    <!-- 配置文件 -->
							    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
							    <!-- 编辑器源码文件 -->
							    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
							    <!-- 实例化编辑器 -->
							    <script type="text/javascript">
							        var ueditor = UE.getEditor('container',{
							                initialFrameHeight: 600
							            });
							    </script>
                    		</td>
                    	</tr>
                    	
                    </tbody>
                </table>
				</form>
				<div class="blank10"></div>
            </div>
            
            <%-- <div title="SEO信息" data-options="" class="pad10 relative" id="tab2">
            	<table class="forms" style="table-layout:fixed;">
                    <tbody>
                    	<tr>
                            <td class="right" width="120"></td>
                            <td width="300"></td>
                            <td class="right" width="120"></td>
                            <td width="300"></td>
                        </tr>
                    	<tr>
                    		<td class="right"><i class="require">*</i>SEO标题：</td>
                    		<td>
                    			<input class="txt" id="seoTitle_str" type="text" value="${mobileActivityDtoInfo.seoTitle}" />
                    		</td>
                    	</tr>
                    	<tr>
                    		<td class="right"><i class="require">*</i>SEO关键字：</td>
                    		<td>
                    			<textarea id="seoKeyword_str" style="width:500px;height:80px;">${mobileActivityDtoInfo.seoKeywords }</textarea>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td class="right"><i class="require">*</i>SEO描述：</td>
                    		<td>
                    			<textarea id="seoDesc_str" style="width:500px;height:80px;">${mobileActivityDtoInfo.seoDesc }</textarea>
                    		</td>
                    	</tr>
                    </tbody>
                </table>
                <div class="blank10"></div>
            </div> --%>
        </div>
        <div id="tab-tools" class="">
            <a href="javascript:void(0)" class="ico pop" title="全屏" id="winMax">&nbsp;</a>
        </div>
    </div>
    <div data-options="region:'south',collapsible:false,height:50" class="noborder hidden">
        <div class="ftbutton border-n">
            <ul class="lists rf">
                <li><button class="button" type="button" id="js_save">保存</button></li>
            </ul>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/www/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.datagrid.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/jquery.cityselect.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/webuploader.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" charset="utf-8">
jQuery(function($){
	//选择活动状态
	var status = '${mobileActivityDtoInfo.status}';
	if(status=="1"){		
		$("#status1").attr("checked","checked");
	}
	if(status=="2"){
		$("#status2").attr("checked","checked");
	}
	
	//图片上传
	// 初始化Web Uploader
	var uploader = WebUploader.create({
	
	    // 选完文件后，是否自动上传。
	    auto: true,
	
	    // swf文件路径
	    swf: '${pageContext.request.contextPath}/static/www/scripts/Uploader.swf',
	
	    // 文件接收服务端。
	    server: '${pageContext.request.contextPath}/admin/newsThumbImgUpload?id=${mobileActivityDtoInfo.id}',
	    
	    fileNumLimit: 5,
	    
	    // 选择文件的按钮。可选。
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: {
	    	id:'#filePicker',
	    	multiple : false,
	    },
	
	    // 只允许选择图片文件。
	    accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png,GIF,JPG,JPEG,BMP,PNG',
            mimeTypes: 'image/*'
        },
	});
	
	// 文件上传成功，显示图片。
	uploader.on('uploadSuccess', function( file,response ) {
		var url = response.data;
		$(".zoom_img").remove();
		$("#thumbImg").val(url);
	    $("#upload_img_span").append('<a title="查看大图" class="zoom_img" target="_blank" href="'+url+'"><img alt="缩略图" src="'+url+'" style="margin-left:10px;width:80px;height:80px;cursor:pointer;"/></a>');
	});
	
	
	/*layout*/
    $("#js_layout").layout({fit:true});
	
    /*保存 */
	$("#js_save").click(function(){
		
		$('#newsForm').form({
			onSubmit : function() {
			},
			success : function(data) {
				var str=jQuery.parseJSON(data);
				if(str.data=='ok'){
					//刷新父窗口表格
					$.messager.alert("操作提示", "保存成功！","info",function(){
						location.href = "sjhdList.jsp";
					});
					
					var row = parent.$("#grid_recheck").datagrid('getSelected');
				  	var rowIndex = parent.$("#grid_recheck").datagrid('getRowIndex', row);
				  	parent.rowIndex = rowIndex;
					parent.$("#grid_recheck").datagrid("reload");
					
				}else{
					$.messager.alert("操作提示", "操作失败！","info");
				}
			}
		});
		//提交表单
		$('#newsForm').submit();
	});
    
    /*tabs切换*/
    $("#tabs").tabs({fit:true,tools:'#tab-tools',onSelect:function(title,index){
        var tab=$("#tabs").tabs("getTab",index),loaded = tab.attr("loaded");
        if(loaded=="true")
            return;
        else
            tab.attr("loaded",true);
    }});
	
    /*全屏按钮*/
	$("#winMax").click(function(){
		var id = '${mobileActivityDtoInfo.id}';
		parent.hideCenter(id);
	});
    
	//自适应窗口大小
     winResize=function(){
        var winWidth = $(window).width(),winHeight=$(window).height();
        $("#js_layout").layout("resize",{width:winWidth,height:winHeight});
		var tdW2=$("table.forms td").eq(1).width();
		var tdW3=$("table.forms td").eq(2).width();
		$("div.equalW").width(tdW2+tdW3+247+12+2);
		tableAlign("tab1");
		
		
   }
    $(window).wresize(winResize);
    winResize();
});
</script>
</body>
</html>
