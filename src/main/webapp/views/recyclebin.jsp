<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String path = request.getContextPath();
	if (session.getAttribute("user") == null) {
		response.sendRedirect(path + "/login.jsp");
	}
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon"
	href="<%=path%>/bootstrap/images/isoftstone.png">

<title>简存取 - 拾光笔记</title>

<jsp:include page="common/_css.jsp" />

<!-- bootstrap table css -->
<link href="<%=path%>/bootstrap/table/bootstrap-table.min.css"
	rel="stylesheet" type="text/css">
<!-- modal css -->
<link href="<%=path%>/bootstrap/plugins/modal-effect/component.css"
	rel="stylesheet" type="text/css">
<!-- sweetalert css -->
<link href="<%=path%>/bootstrap/plugins/sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css">

</head>

<body class="fixed-left">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<jsp:include page="common/topBar.jsp" />
		<!-- Top Bar End -->

		<!-- Left Sidebar Start -->
		<jsp:include page="common/sidebar.jsp" />
		<!-- Left Sidebar End -->

		<!-- right Content Start -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">

					<!-- Page-Title -->
					<div class="row">
						<div class="col-sm-12">
							<h4 class="pull-left page-title">Welcome !</h4>
							<ol class="breadcrumb pull-right">
								<li><a href="#">Cosy-Cloud-Disk</a></li>
								<li class="active">文件管理</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">回收站列表</h3>
								</div>
								<div class="col-md-12">
									<form class="form-inline" role="form">
										<div class="form-group">
											<input type="text" class="form-control"
												placeholder="请输入文件名 ... ">
										</div>
										<button type="button"
											class="btn waves-effect waves-light btn-primary">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</div>
								<br>
								<br>
								<div class="panel-body">
									<div class="row">
										<div id="toolbar" class="toolbar">
											<button id="btn_mkdir" class="btn btn-default"
												onclick="recoveryFiles()">
												<span class="md md-folder" aria-hidden="true" />批量恢复
											</button>
										</div>
										<table id="fileTable"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Row -->


				</div>
				<!-- container -->
			</div>
			<!-- content -->

			<footer class="footer text-right"> 2020 © cosy-cloud-disk. </footer>

		</div>
		<!-- right Content Start End -->

	</div>
	<!-- END page -->

	<jsp:include page="common/_js.jsp" />

	<!-- bootstrap table js -->
	<script src="<%=path%>/bootstrap/table/bootstrap-table.min.js"></script>
	<script src="<%=path%>/bootstrap/table/bootstrap-table-zh-CN.min.js"></script>

	<!-- modal-effect js -->
	<script src="<%=path%>/bootstrap/plugins/modal-effect/classie.js"></script>
	<script src="<%=path%>/bootstrap/plugins/modal-effect/modalEffects.js"></script>

	<!-- sweetalert js -->
	<script src="<%=path%>/bootstrap/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
    

        // $ == jQuery
        $(function () {
            $('#fileTable').bootstrapTable({
                url: '<%=path%>/file/getRecycleFiles',
                method: 'get',
                cache: false,
                pagination: true,
                pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                pageSize: 10,                     //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                sidePagination: 'server',
                clickToSelect: true,
                uniqueId: "fid",
                toolbar: "#toolbar",
                columns: [
                    {checkbox: true, visible: true},                  //是否显示复选框
                    {field: 'fname', title: '文件名', align: 'center'},
                    {field: 'fsize', title: '文件大小', align: 'center'},
                    {
                    	field: 'ftype', title: '文件类型', align: 'center',
                      	formatter: function (value, row, index) {
                    		var type = ''
                    		switch (value) {
                    		case 1 :
                    			type = '图片';
                    			break;
                    		case 2 :
                    			type = '文档';
                    			break;
                    		case 3 :
                    			type = '音乐';
                    			break;
                    		case 4 :
                    			type = '视频';
                    			break;
                    		case 5 :
                    			type = '其他';
                    			break;
                    		default:
                    			type = '未知类型';
                    		}
                    		return type;
                    	}
                    },
                    {field: 'fdtime', title: '删除时间', align: 'center'},
                    {
                        field: 'fid', title: '操作', align: 'center',
                        formatter: function (value, row, index) {
                           return '<a href="#" onclick="recoveryFile(\'' + value + '\')">恢复</a>&nbsp;&nbsp;<a href="#" onclick="deleteFile(\'' + value +'\',\''+ row.fpath + '\')">删除</a>';
                        }
                    }
                ],
                queryParams: function (params) {
                    params = {
                    	fowner: "${user.id}",    //用户id
                        pageNum: (params.offset / params.limit) + 1,    
                        pageSize: params.limit                         
                    };
                    return params;
                }
            });
        });
        
		//从回收站删除文件
        function deleteFile(fid,fpath) {
            swal({
                title: "是否确认?",
                text: "你将会删除这个文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: false
            }, function () {
                $.get('<%=path%>/file/dropFile', {fid: fid,fpath: fpath}, function (data) {
                        swal("已删除!", "这个文件已删除.", "success");
                        // refresh table
                        $('#fileTable').bootstrapTable('refresh');
                }, 'json');
            });
        }
        
        
        //恢复文件
        function recoveryFile(fid) {
        	$.get('<%=path%>/file/recoveryFile', {fid: fid}, function (data) {
        		swal("已恢复删除!", "这个文件已恢复.", "success");
        		$('#fileTable').bootstrapTable('refresh');
        	}, 'json');
        }
        
        
        //批量恢复文件
        function recoveryFiles() {
            var rows = $('#fileTable').bootstrapTable('getSelections');
            if (rows.length == 0) {
                swal("请选择需要恢复的文件 ... ");
                return;
            }
            var fids = '';
            for (var i = 0; i < rows.length; i++) {
                fids += ',' + rows[i].fid;
            }
            fids = fids.substring(1, fids.length); 
            swal({
                title: "是否确认?",
                text: "你将会恢复选中的文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, recovery them!",
                closeOnConfirm: false
            }, function () {
	            $.get('<%=path%>/file/recoveryFiles', {
					fids : fids
				}, function(data) {
					/* alert(data.msg); */
					// reload table
					swal("已恢复!", "选中文件已恢复.", "success");
					$('#fileTable').bootstrapTable('refresh');
				}, 'json');
			});
		}
	</script>
</body>
</html>