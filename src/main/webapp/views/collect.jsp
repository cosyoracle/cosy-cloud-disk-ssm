<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
		String path = request.getContextPath();
		if(session.getAttribute("user")==null)
		{
			response.sendRedirect(path+"/login.jsp");
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
	href="<%=path %>/bootstrap/images/isoftstone.png">

<title>简存取 -  拾光笔记</title>

<jsp:include page="common/_css.jsp" />

<!-- bootstrap table css -->
<link href="<%=path %>/bootstrap/table/bootstrap-table.min.css"
	rel="stylesheet" type="text/css">
<!-- modal css -->
<link href="<%=path %>/bootstrap/plugins/modal-effect/component.css"
	rel="stylesheet" type="text/css">
<!-- sweetalert css -->
<link href="<%=path %>/bootstrap/plugins/sweetalert/sweetalert.css"
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
									<h3 class="panel-title">收藏列表</h3>
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
											<button id="btn_delete" class="btn btn-default"
												onclick="deleteFiles()">
												<span class="md md-delete" aria-hidden="true" />批量删除
											</button>

										</div>
										<table id="fileTable"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Row -->

					<div class="row">
						<div class="col-md-12">
							<div id="fileDetails" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="fileDetailsLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="fileDetailsLabel">详情信息</h4>
										</div>
										<div class="modal-body">
											<form id="viewForm" class="form-horizontal" role="form"
												enctype="multipart/form-data">
												<div class="form-group">
													<label class="col-md-2 control-label">文件名称</label>
													<div class="col-md-10">
														<input id="ffname" type="text" name="ffname"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">文件大小</label>
													<div class="col-md-10">
														<input id="ffsize" type="text" name="ffsize"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">文件后缀</label>
													<div class="col-md-10">
														<input id="ffsuffix" type="text" name="ffsuffix"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">文件路径</label>
													<div class="col-md-10">
														<input id="ffpath" type="text" name="ffpath"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">上传时间</label>
													<div class="col-md-10">
														<input id="fftime" type="text" name="fftime"
															class="form-control" readonly="readonly">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default waves-effect"
												data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col-md-12">
							<div id="fileModify" class="modal fade" tabindex="-1"
								role="dialog" aria-labelledby="fileModifyLabel"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="fileModifyLabel">修改文件</h4>
										</div>
										<div class="modal-body">
											<form id="modifyForm" class="form-horizontal" role="form"
												enctype="multipart/form-data">
												<div class="form-group" style="display: none;">
													<label class="col-md-2 control-label">文件编号</label>
													<div class="col-md-10">
														<input id="mfid" type="text" name="fid"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group" style="display: none;">
													<label class="col-md-2 control-label">文件路径</label>
													<div class="col-md-10">
														<input id="mfpath" type="text" name="fpath"
															class="form-control" readonly="readonly">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-2 control-label">文件名称</label>
													<div class="col-md-10">
														<input id="mfname" type="text" name="fname"
															class="form-control">
													</div>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default waves-effect"
												data-dismiss="modal">取消</button>
											<button onclick="updateFile()" type="button"
												class="btn btn-primary waves-effect waves-light">修改</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



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
	<script src="<%=path %>/bootstrap/table/bootstrap-table.min.js"></script>
	<script src="<%=path %>/bootstrap/table/bootstrap-table-zh-CN.min.js"></script>

	<!-- modal-effect js -->
	<script src="<%=path %>/bootstrap/plugins/modal-effect/classie.js"></script>
	<script src="<%=path %>/bootstrap/plugins/modal-effect/modalEffects.js"></script>

	<!-- sweetalert js -->
	<script src="<%=path %>/bootstrap/plugins/sweetalert/sweetalert.min.js"></script>

	<script>
        // $ == jQuery
        $(function () {
            $('#fileTable').bootstrapTable({
                url: '<%=path %>/file/getCollectFiles',
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
                    {
                    	field: 'fname', title: '文件名', align: 'center',
                    	formatter: function (value, row, index) {
                    	return '<a href="<%=path %>/hdfs/download?fileName=' + row.fpath + '">'+value + '</a>'
                    			}
                    },
                    {field: 'fsize', title: '文件大小（字节）', align: 'center'},
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
                    {field: 'ftime', title: '上传时间', align: 'center'},
                    {
                        field: 'fid', title: '操作', align: 'center',
                        formatter: function (value, row, index) {
                           return '<a href="#" onclick="viewFile(\'' + value + '\')">详情</a>&nbsp;&nbsp;<a href="#" onclick="dislikeFile(\'' + value + '\')">取消收藏</a>&nbsp;&nbsp;<a href="#" onclick="modifyFile(\'' + value + '\')">编辑</a>';
                        }
                    }
                ],
                queryParams: function (params) {
                    //这里的键的名字和控制器的变量名必须一致，这边改动，控制器也需要改成一样的
                    params = {
                    	fowner: "${user.id}",
                        pageNum: (params.offset / params.limit) + 1,    
                        pageSize: params.limit                         //页面大小
                    };
                    return params;
                }
            });
        });

  
        function dislikeFile(fid) {
        	$.get('<%=path%>/file/dislikeFile', {fid: fid}, function (data) {
        		swal("已取消收藏!", "这个文件已移出收藏夹.", "success");
        		$('#fileTable').bootstrapTable('refresh');
        	}, 'json');
        }
        

      
        function viewFile(fid){
        	var row=$('#fileTable').bootstrapTable('getRowByUniqueId',fid); 
        	$('#ffname').val(row.fname);
        	$('#ffsize').val(row.fsize+' 字节');
        	$('#ffsuffix').val(row.fsuffix);
        	$('#ffpath').val(row.fpath);
        	$('#fftime').val(row.ftime);
        	$('#fileDetails').modal('show');
        }
        

        function deleteFile(fid) {
            swal({
                title: "是否确认?",
                text: "你将会删除这个文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete it!",
                closeOnConfirm: false
            }, function () {
                $.get('<%=path%>/file/deleteFile', {fid: fid}, function (data) {
                        swal("已删除!", "这个文件已删除.", "success");
                        // refresh table
                        $('#fileTable').bootstrapTable('refresh');
                }, 'json');
            });
        }

        function deleteFiles() {
            var rows = $('#fileTable').bootstrapTable('getSelections');
            if (rows.length == 0) {
                swal("请选择需要删除的文件 ... ");
                return;
            }
            var fids = '';
            for (var i = 0; i < rows.length; i++) {
                fids += ',' + rows[i].fid;
            }
            // ids : ,1,2,3,4,5,6
            fids = fids.substring(1, fids.length); // 1,2,3,4,5,6
            swal({
                title: "是否确认?",
                text: "你将会删除选中的文件！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, delete them!",
                closeOnConfirm: false
            }, function () {
	            $.get('<%=path%>/file/deleteFiles', {fids: fids}, function (data) {
	                /* alert(data.msg); */
	                    // reload table
	                    swal("已删除!", "选中文件已删除.", "success");
	                    $('#fileTable').bootstrapTable('refresh');
	            }, 'json');
        	});
        }


        function modifyFile(fid) {
        	var row=$('#fileTable').bootstrapTable('getRowByUniqueId',fid); 
        	$('#mfname').val(row.fname.substring(0,row.fname.lastIndexOf('.'))); 
        	$('#mfid').val(row.fid);
        	$('#mfpath').val(row.fpath);
        	$('#fileModify').modal('show');
        	
        }
        
        function updateFile() {
            $.ajax({
                url: "<%=path%>/file/updateFile",
				type : "POST",
				data : new FormData($('#modifyForm')[0]),
				processData : false,// 告诉jQuery不要去处理发送的数据(必须设置)
				contentType : false, // 告诉jQuery不要去设置Content-Type请求头（必须设置）
				dataType : "json",
				success : function(result) {
					swal("已修改!", result.msg, "success");
					$('#fileModify').modal('hide'); // $('#userModal').modal('show');
					$('#modifyForm')[0].reset();
					$('#fileTable').bootstrapTable('refresh');
				}
			});
		}
	</script>
</body>
</html>