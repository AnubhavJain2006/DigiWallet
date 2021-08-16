<footer class="app-footer">
	<div class="container text-center py-3">
		<!--/* This template is free as long as you keep the footer attribution link. If you'd like to use the template without the attribution link, you can buy the commercial license via our website: themes.3rdwavemedia.com Thank you for your support. :) */-->
		<small class="copyright">&copy; All rights are reserved</small>

	</div>
</footer>

<!-- Javascript -->
<script src="<c:url value="/resources/plugins/popper.min.js"/>"></script>
<script
	src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js"/>"></script>
<!-- Page Specific JS -->
<script src="<c:url value="/resources/js/app.js"/>"></script>

<script>
	let items=document.querySelectorAll("li a.nav-link");
	items.forEach(item=>{
		item.addEventListener('click',()=>{
			items.forEach(item=>item.classList.remove('active'))
			item.classList.add('active')
		})
	});
	
	function logout(){
	var confirmation=confirm("Do you want to logout..?");
	return confirmation
	}
	
</script>

