<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String path = request.getContextPath();
%>
<div class="left side-menu">
	<div class="sidebar-inner slimscrollleft">
		<div class="user-details">
			<div class="pull-left">
				<img src="<%=path%>/bootstrap/images/avatar-1.jpg" alt=""
					class="thumb-md img-circle">
			</div>
			<div class="user-info">
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"> ${sessionScope.user.username} </a>
				</div>
				<p class="text-muted m-0">${sessionScope.user.role}</p>
			</div>
		</div>
		<!--- Divider -->
		<div id="sidebar-menu">
			<ul>
				<li><a href="<%=path%>/index"
					class="waves-effect waves-light active"> <i class="md md-home"></i><span>
							首页 </span>
				</a></li>

				<li><a href="<%=path%>/views/files.jsp"
					class="waves-effect waves-light"> <i class="md md-folder-open"></i><span>
							文件管理 </span>
				</a></li>
				<li><a href="<%=path%>/views/collect.jsp"
					class="waves-effect waves-light"> <i class="md md-star-outline"></i><span>
							我的收藏 </span>
				</a></li>
				<li><a href="<%=path%>/views/recyclebin.jsp"
					class="waves-effect waves-light"> <i class="md md-delete"></i><span>
							回收站 </span>
				</a></li>

			</ul>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
