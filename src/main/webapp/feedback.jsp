<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<%@include file="comp/links.jsp"%>
</head>
<body>
	<%@include file="header.jsp"%>
	<div
		class="content_container mt-3 d-flex flex-column justify-content-center align-items-center">
		<h3>Fill the feedback form</h3>

		<form class="mt-2" action="<%=application.getContextPath()%>/feedback"
			method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Email
					address</label> <input required name="email"
					placeholder="Enter your email here" type="email"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Phone
					number</label> 
				<input required name="phone" placeholder="Enter here"
					type="tel" pattern="[0-9]{10}" class="form-control" id="exampleInputPassword1">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Your
					Feedback Message</label><br>
				<textarea required name="feedback_message" rows="10" cols="35"
					placeholder="Enter Your text here" class="form-control"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-secondary ">Reset</button>
			</div>
		</form>
	</div>

	<%@include file="scripts.jsp"%>
</body>
</html>