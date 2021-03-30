<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="bootstrap/images/isoftstone.png">

<title>简存取 - 拾光笔记</title>

<jsp:include page="./views/common/_css.jsp" />

</head>
<body>

	<div class="wrapper-page">
		<div class="panel panel-color panel-primary panel-pages">
			<div class="panel-heading bg-img">
				<div class="bg-overlay"></div>
				<h3 class="text-center m-t-10 text-white">
					Sign In to <strong>简存取</strong>
				</h3>
			</div>

			<div class="panel-body">
				<form class="form-horizontal m-t-20" method="post" action="login">

					<div class="form-group">
						<div class="col-xs-12">
							<input class="form-control input-lg" type="text" required=""
								name="username" placeholder="Username">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-12">
							<input class="form-control input-lg" type="password" required=""
								name="password" placeholder="Password">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-12">
							<div class="checkbox checkbox-primary">
								<input id="checkbox-signup" type="checkbox"> <label
									for="checkbox-signup"> Remember me </label>
							</div>

						</div>
					</div>

					<div class="form-group text-center m-t-40">
						<div class="col-xs-12">
							<button
								class="btn btn-primary btn-lg w-lg waves-effect waves-light"
								type="submit">Log In</button>
						</div>
					</div>

					<div class="form-group m-t-30">
						<div class="col-sm-5 text-right">
							<a href="register.jsp">Create an account</a>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>

	<jsp:include page="./views/common/_js.jsp" />
</body>
</html>
