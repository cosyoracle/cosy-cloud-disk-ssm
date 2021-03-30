<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <link rel="shortcut icon" href="<%=path %>/bootstrap/images/isoftstone.png">

    <title>简存取 -  拾光笔记</title>

    <jsp:include page="common/_css.jsp"/>

</head>

<body class="fixed-left">


    <!-- Begin page -->
    <div id="wrapper">

        <!-- Top Bar Start -->
        <jsp:include page="common/topBar.jsp"/>
        <!-- Top Bar End -->

        <!-- Left Sidebar Start -->
        <jsp:include page="common/sidebar.jsp"/>
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
                                <li>
                                    <a href="#">Cosy-Cloud-Disk</a>
                                </li>
                                <li class="active">首页</li>
                            </ol>
                        </div>
                    </div>

                    <!-- Start Widget -->
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bx-shadow bg-info">
                                <span class="mini-stat-icon"><i class="ion-ios7-photos"></i></span>
                                <div class="mini-stat-info text-right">
                                    <span class="counter">${fpage.tpicture}</span>
                                    图片
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-purple bx-shadow">
                                <span class="mini-stat-icon"><i class="ion-ios7-filing"></i></span>
                                <div class="mini-stat-info text-right">
                                    <span class="counter">${fpage.tfile}</span>
                                    文档
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-success bx-shadow">
                                <span class="mini-stat-icon"><i class="ion-music-note"></i></span>
                                <div class="mini-stat-info text-right">
                                    <span class="counter">${fpage.tmusic}</span>
                                    音乐
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-primary bx-shadow">
                                <span class="mini-stat-icon"><i class="ion-ios7-film"></i></span>
                                <div class="mini-stat-info text-right">
                                    <span class="counter">${fpage.tvideo}</span>
                                    视频
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End row-->

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="portlet"><!-- /portlet heading -->
                                <div class="portlet-heading">
                                    <h3 class="portlet-title text-dark text-uppercase">
                                        Status of document addition:
                                    </h3>
                                    <div class="portlet-widgets">
                                        <a data-toggle="collapse" data-parent="#accordion1" href="#portlet1"><i class="ion-minus-round"></i></a>
                                        <span class="divider"></span>
                                        <a href="#" data-toggle="remove"><i class="ion-close-round"></i></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div id="portlet1" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div id="main" style="width:100%;height:350px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- /Portlet -->
                        </div> <!-- end col -->
                    </div> <!-- End row -->

                </div> <!-- container -->
            </div> <!-- content -->

            <footer class="footer text-right">
                2020 © cosy-cloud-disk.
            </footer>

        </div>
        <!-- right Content Start End -->

    </div>
    <!-- END page -->

    <jsp:include page="common/_js.jsp"/>

    <script src="<%=path %>/bootstrap/plugins/echarts/echarts.min.js"></script>

    <script>
       
		
        var myChart = echarts.init(document.getElementById('main'));

        option = {
            legend: {
                data: ['图片', '文档', '音乐', '视频']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['${fpage.date[0]}', '${fpage.date[1]}', '${fpage.date[2]}', '${fpage.date[3]}', '${fpage.date[4]}', '${fpage.date[5]}', '${fpage.date[6]}']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '图片',
                    type: 'line',
                    stack: '总量',
                    data: [${fpage.abc[0]}]
                },
                {
                    name: '文档',
                    type: 'line',
                    stack: '总量',
                    data: [${fpage.abc[1]}]
                },
                {
                    name: '音乐',
                    type: 'line',
                    stack: '总量',
                    data: [${fpage.abc[2]}]
                },
                {
                    name: '视频',
                    type: 'line',
                    stack: '总量',
                    data: [${fpage.abc[3]}]
                }
            ]
        };
        myChart.setOption(option);
    </script>

</body>
</html>