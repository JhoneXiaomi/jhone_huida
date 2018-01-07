<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>设计师列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/easyui.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/common.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/www/css/QA.css" type="text/css" />
</head>
<body>
<div class="wrapper" id="js_layout">
	 <div data-options="region:'south',split:true,maxHeight:1000" class="layout-south border hidden" id="js_south">
        <!--//my code -->
        <iframe name="framebottom" id="framebottom" src="" height="100%" width="100%" frameborder="0" scrolling="yes" allowtransparency="true"></iframe> 
	</div>
	<div data-options="region:'center'" class="noborder hidden">
		<table class="easyui-datagrid" data-options="fitColumns:true,toolbar:'#toolbar'" id="grid_sysLog"></table>
		<div id="toolbar" class="toolpanel datagrid-toolbar">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-leadout" title="导出excel" plain="true" id="leadout">导出</a>
        	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-empty" plain="true" id="js_del">删除</a>
            <div class="rf reletive sch">
				<input class="txt" type="text" id="keyWord" name="keyWord" value="请输入操作描述"/>
				<button type="button" id="search" class="sbutton">查询</button>
			</div>
			<div class="rf">
				起止时间：<input class="easyui-datebox" id="startDate" name="startDate" type="text" style="width:98px;" value="" />&nbsp;至&nbsp;<input class="easyui-datebox" id="endDate" name="endDate" type="text" style="width:98px;" value="" />
	        </div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/static/www/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.datagrid.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/easyui.datebox.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/static/www/scripts/common.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
jQuery(function($){
	$("#js_south").height($(parent).height()*0.5);
    $("#js_layout").layout({fit:true});
	  var $$=window.$$={
        //加载表格
        loadGrid:function(param){
            $("#grid_sysLog").datagrid({
                url:'${pageContext.request.contextPath}/admin/listSysLogToJson',
                fit:true,
                striped: true,
                pagination:true,
                pageSize: 30,
                singleSelect:true,
				scrollbarSize:0,
				checkOnSelect:true,
           		selectOnCheck:false,
                columns:[[
					{field:'logId',checkbox:true},
					{field:'descName',align:'left',width:30,title:'操作描述'},
					{field:'operationType',align:'left',width:20,title:'操作类型'},
					{field:'mainKey',align:'left',width:20,title:'操作表主键'},
					{field:'tableName',align:'left',width:20,title:'操作表名'},
					{field:'creater',align:'left',width:15,title:'操作人'},
					{field:'createTime',align:'left',width:30,title:'操作时间'}
					
                ]],
				onLoadSuccess:function(node,data){
					$('.opration a').click(function(e){e.stopPropagation();});
				}
            });
        },
		init:function(){
            $$.loadGrid();
        }
    };
    $$.init();
    
    /*导出*/
     $("#leadout").on("click",function(){
    	location.href = '${pageContext.request.contextPath}/admin//exportSystemLogExcel'; 
     });
    /*删除 */
    $("#js_del").on("click",function(){
	   //获取复选框值
	   var items = $("input[name='logId']:checked");
       var logIdArr = [];
       $.each(items, function (index, item) {
    	   logIdArr[index] = item.value;
       });
       if(logIdArr.length>0){
    	   $.messager.confirm("确认", "确认删除选中的"+logIdArr.length+"条日志记录?", function (r){  
	   	        if (r) {
	   	        	$.ajax({
	   		   			type : "POST",
	   		   			dataType : "json",
	   		   			url : "${pageContext.request.contextPath}/admin/delSysLog",
	   		   			data : "logIds=" + logIdArr,
	   		   			success : function(data) {
	   		   				if(data.data=="ok"){
	   		   					$.messager.alert("操作提示", "删除成功！","info");
	   		   					$("#grid_sysLog").datagrid('reload'); //重新加载
	   		   				}
	   		   			}
	   	   			});
	   	        }
   	    	});
       }else{
    	   $.messager.alert("操作提示", "请选择一行！","info");
       }
	});
    /*搜索*/
	$("#search").on("click",function(){
		if($('#keyWord').val()=="请输入操作描述"){
			$('#keyWord').val('');
		}
		//加载搜索列表
		var query = {'keyWord': $('#keyWord').val(),'startDate': $("#startDate").datebox('getValue'),'endDate': $("#endDate").datebox('getValue')}; //把查询条件拼接成JSON
		$("#grid_sysLog").datagrid('options').queryParams = query; //把查询条件赋值给datagrid内部变量
		$("#grid_sysLog").datagrid({url:'searchListSysLog'}); //重新加载查询url
		$("#grid_sysLog").datagrid('reload'); //重新加载
	});
    
    /*window resize*/
    winResize=function(){
        var winWidth = $(window).width(),winHeight=$(window).height();
        $("#js_layout").layout("resize",{width:winWidth,height:winHeight});
		if ($.support.boxModel && !$.support.leadingWhitespace){
            var iframes = window.frames;
            for(var l = iframes.length,i=0;i<l;i++){
                var f = iframes[i].winResize;if(f)f();
            }
        }
    }
    $(window).wresize(winResize);
    winResize();
});
</script>
</body>
</html>