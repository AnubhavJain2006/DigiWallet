<footer class="app-footer">
	<div class="container text-center py-3">
		<small>Kuch Sochne ke baad likh dunga</small>
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
	function confirmUpdate(){
		let confirmation=confirm("Do you really want to update?")
		return confirmation;
	}
	function confirmDelete(){
		let confirmation=confirm("Do you really want to delete?")
		return confirmation;
	}
	
	
	
</script>

<script>
	function myFunction() {
		  var eye=document.getElementById("eye");
		  var x = document.getElementById("signup-password");
		  if (x.type === "password") {
		    x.type = "text";
		    eye.classList.add("fa-eye-slash")
		    eye.classList.remove("fas fa-eye")
		  } else {
		    x.type = "password";
		    eye.classList.remove("fa-eye-slash")
		    eye.classList.add("fa-eye")
		  }
		}
	
	</script>