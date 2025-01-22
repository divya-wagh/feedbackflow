<style>
.navbar {
	padding: 0.5rem 0;
}

.navbar-brand {
	font-size: 1.2rem;
}

.navbar-nav {
	margin-left: auto;
	display: flex;
	align-items: space-between;
}

.nav-item {
	display: flex;
	align-items: center;
}
.nav-item {
    position: relative;
}

.nav-item::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 0;
    height: 2px;
    background-color: #fff; /* Change to your preferred color */
    transition: width 0.4s ease-in-out;
}

.nav-item:hover::after {
    width: 100%;
}

</style>

<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #D6DCE7;">
	<div class="container-fluid">
		<a class="navbar-brand">FeedbackFlow</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav ms-auto my-5 my-lg-0 navbar-nav-scroll"
				style="--bs-scroll-height: 100px;">
				<li class="nav-item me-5"><a class="nav-link active"
					aria-current="page"
					href="<%=application.getContextPath()%>/index.jsp">Home</a></li>
				<li class="nav-item me-5">
					<form action="FeedbackRecords" method="post">
						<button class="nav-link active"
							style="background: none; border: none; color: black; padding: 0; font-size: inherit; cursor: pointer;">
							Feedback Records</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
</nav>