<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="topbar">
	<!-- LOGO -->
	<div class="topbar-left">
		<div class="text-center">
			<a href="${pageContext.request.contextPath}/views/index.jsp"
				class="logo"><i class="md md-cloud-queue"></i> <span>简存取</span></a>
		</div>
	</div>
	<!-- Button mobile view to collapse sidebar menu -->
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="">
				<div class="pull-left">
					<button class="button-menu-mobile open-left">
						<i class="fa fa-bars"></i>
					</button>
					<span class="clearfix"></span>
				</div>
				<form class="navbar-form pull-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control search-bar"
							placeholder="Type here for search...">
					</div>
					<button type="button"
						class="btn waves-effect waves-light btn-primary">
						<i class="fa fa-search"></i>
					</button>
				</form>
				<ul class="nav navbar-nav navbar-right pull-right">
					<li class="dropdown hidden-xs"><a href="#" data-target="#"
						class="dropdown-toggle waves-effect" data-toggle="dropdown"
						aria-expanded="true"> <i class="md md-notifications"></i> <span
							class="badge badge-xs badge-danger">1</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-lg">
							<li class="text-center notifi-title">通知</li>
							<li class="list-group"><a href="javascript:void(0);"
								class="list-group-item">
									<div class="media">
										<div class="pull-left">
											<em class="fa fa-bell-o fa-2x text-danger"></em>
										</div>
										<div class="media-body clearfix">
											<div class="media-heading">审核</div>
											<p class="m-0">
												<small>There are <span class="text-primary">2</span>
													new updates available
												</small>
											</p>
										</div>
									</div>
							</a> <a href="javascript:void(0);" class="list-group-item"> <small>点击查看更多</small>
							</a></li>
						</ul></li>
					<li class="hidden-xs"><a href="#" id="btn-fullscreen"
						class="waves-effect"><i class="md md-crop-free"></i> </a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>