<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- FontAwesome JS-->
<script defer
	src="<c:url value="/resources/plugins/fontawesome/js/all.min.js"/>"></script>

<!-- App CSS -->
<link id="theme-style" rel="stylesheet"
	href="<c:url value="/resources/css/portal.css"/>">

<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
</script>
<style>
.error {
	color: red;
}
</style>