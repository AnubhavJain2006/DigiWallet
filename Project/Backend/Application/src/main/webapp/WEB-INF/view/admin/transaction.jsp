<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="head.jsp"%>
<title>Transaction</title>
<link href="<c:url value="/resources/css/transaction.css"/>"
	rel="stylesheet">


</head>
<%@include file="header.jsp"%>
<div class="app-wrapper">
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl"></div>
		<%@include file="transactionDisplay.jsp"%>
	</div>
</div>

</body>
<script type="text/javascript">
function confirmDelete() {
	var confirmation = confirm("Are you sure.... ?")
	return confirmation;
}
function callModal(){
		document.getElementById('modalSelectCategoryForExpense').value = document.getElementById('trans_category_for_expense').value;
		document.getElementById('modalSelectCategoryForIncome').value = document.getElementById('trans_category_for_income').value;
		console.log('function called');	
}
</script>
<script>

	$('.form').find('input, textarea').on('keyup blur focus', function(e) {

		var $this = $(this), label = $this.prev('label');

		if (e.type === 'keyup') {
			if ($this.val() === '') {
				label.removeClass('active highlight');
			} else {
				label.addClass('active highlight');
			}
		} else if (e.type === 'blur') {
			if ($this.val() === '') {
				label.removeClass('active highlight');
			} else {
				label.removeClass('highlight');
			}
		} else if (e.type === 'focus') {

			if ($this.val() === '') {
				label.removeClass('highlight');
			} else if ($this.val() !== '') {
				label.addClass('highlight');
			}
		}

	});

	$('.tab a').on('click', function(e) {

		e.preventDefault();

		$(this).parent().addClass('active');
		$(this).parent().siblings().removeClass('active');

		target = $(this).attr('href');

		$('.tab-content > div').not(target).hide();

		$(target).fadeIn(600);

	});
</script>
<script>
	
	function formatting(target) {
	  return target < 10 ? '0' + target : target;
	}
	var dt = new Date()
	var dateStr = "";
	dateStr += dt.getFullYear() + "-";
	dateStr += formatting(dt.getMonth()+1) + "-";
	dateStr += formatting(dt.getDate()) + "T";
	dateStr += formatting(dt.getHours()) + ":";
	dateStr += formatting(dt.getMinutes());
	document.getElementById('trans_date_for_expense').value = dateStr
	document.getElementById('trans_date_for_income').value = dateStr
	
	function convertJsToDatetimeLocal(strDate){
		var dt = new Date(strDate)
		var dateStr = "";
		dateStr += dt.getFullYear() + "-";
		dateStr += formatting(dt.getMonth()+1) + "-";
		dateStr += formatting(dt.getDate()) + "T";
		dateStr += formatting(dt.getHours()) + ":";
		dateStr += formatting(dt.getMinutes());
		return dateStr;
	}
</script>
<script>
let categoryDropdownForIncome = document.getElementById("trans_category_for_income")
let subCategoryDropdownForIncome = document.getElementById("trans_sub_category_for_income")
categoryDropdownForIncome.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForIncome.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForIncome.value).then(data => data.text())
             subCategoryDropdownForIncome.innerHTML = response;
            console.log(response);
    })()
})
let categoryDropdownForExpense = document.getElementById("trans_category_for_expense")
let subCategoryDropdownForExpense = document.getElementById("trans_sub_category_for_expense")
categoryDropdownForExpense.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForExpense.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForExpense.value).then(data => data.text())
             subCategoryDropdownForExpense.innerHTML = response;
            console.log(response);
    })()
})

</script>
<script type="text/javascript">
	function stringToRupees(value){
	    let dollarIndianLocale = Intl.NumberFormat('en-IN');
	    return "&#8377 "+ dollarIndianLocale.format(value)
	}
	
	let accountListJson='<%=request.getAttribute("account_list_json")%>'
	let accountObj = JSON.parse(accountListJson);
	/* let accountDropDown = document.getElementById('trans_account_expense') ;
	accountDropDown.addEventListener('change',() => {
	    document.getElementById('span_account_amount_expense').innerText = accountObj[accountDropDown.value]
	});
	 */
	 
	 $( document ).ready(function() {
		    console.log( "ready!" );
			$('#trans_account_expense').on('load change focus',function(e){
				document.getElementById('span_account_amount_expense').innerHTML = stringToRupees(accountObj[this.value]);
			});
			document.getElementById('span_account_amount_expense').innerHTML = stringToRupees(accountObj[document.getElementById('trans_account_expense').value]);		
	});
	 
	
	
</script>
<script>

	
	function confirmDelete() {
		var confirmation = confirm("Are you sure.... ?")
		return confirmation;
	}
	
	/* 
	categoryDropdownForExpense1.addEventListener('change',() => {
	    console.log("changed");
	    console.log(categoryDropdownForExpense1.value);
	    (async () => {
	        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForExpense1.value).then(data => data.text())
	             subCategoryDropdownForExpense1.innerHTML = response;
	            console.log(response);
	    })()
	}) */
	
	var categoryDropdownForExpense1 = document.getElementById("trans_category_for_expense1")
	var subCategoryDropdownForExpense1 = document.getElementById("trans_sub_category_for_expense1")
	categoryDropdownForExpense1.addEventListener('change',() => {
	    console.log("changed");
	    console.log(categoryDropdownForExpense1.value);
	    (async () => {
	        let response  = await fetch('/ExpenseApplication/admin/getUserSubCategory?categoryId='+categoryDropdownForExpense1.value).then(data => data.text())
	             subCategoryDropdownForExpense1.innerHTML = response;
	            console.log(response);
	    })()
	})
	    
	    
			editExpence = document.getElementsByClassName('editExpence');
        	Array.from(editExpence).forEach((Element) => {
            Element.addEventListener("click", (e) => {
            	
                tr = e.target.parentNode.parentNode;
                
                trans_date_for_expense1.value			=	convertJsToDatetimeLocal(tr.getElementsByTagName("td")[0].innerText);
                
                trans_user_id1.value			=	tr.getElementsByTagName("td")[6].id;
                
                console.log("userid : "+ trans_user_id1.value);
                
                let AccountDropdownForExpense1 = document.getElementById("trans_account_expense1");
                (async () => {
        	        let response  = await fetch('/ExpenseApplication/admin/getUserAccount?userId='+trans_user_id1.value).then(data => data.text())
        	            AccountDropdownForExpense1.innerHTML = response;
        	        trans_account_expense1.value	=	tr.getElementsByTagName("td")[1].id;
        	           
        	            
        	    })();
                
                trans_category_for_expense1.value		=	tr.getElementsByTagName("td")[2].id;
            	console.log(trans_category_for_expense1);
                (async () => {
        	        let response  = await fetch('/ExpenseApplication/admin/getUserCategory?userId='+trans_user_id1.value).then(data => data.text())
        	            categoryDropdownForExpense1.innerHTML = response;
        	        	trans_category_for_expense1.value		=	tr.getElementsByTagName("td")[2].id;
        	            
        	    })();
                categoryDropdownForExpense1.value=	tr.getElementsByTagName("td")[2].id;
        		let cat_id = tr.getElementsByTagName("td")[2].id;
        		
                console.log("tr 2 "+tr.getElementsByTagName("td")[2].id);
                console.log("tr 3 "+tr.getElementsByTagName("td")[3].id);
                
                (async () => {
        	        let response  = await fetch('/ExpenseApplication/admin/getUserSubCategory?categoryId='+cat_id).then(data => data.text())
        	        subCategoryDropdownForExpense1.innerHTML = response;
        	        trans_sub_category_for_expense1.value		=	tr.getElementsByTagName("td")[3].id;
        	            
        	    })();
                
        		subCategoryDropdownForExpense1.value	=	tr.getElementsByTagName("td")[3].id;
                
                trans_amount1.value						=	tr.getElementsByTagName("td")[4].innerText;
                
                trans_note1.value						=	tr.getElementsByTagName("td")[5].innerText;
                
                trans_id1.value							=	e.target.id
                
                console.log(trans_account_expense1);
                console.log("Value "+trans_sub_category_for_expense1);

				
				$('#updateModalForExpense').modal('toggle');
                
           /*  	console.log("e.target.id is "+e) */
            })
        })
        
        
        
        
let categoryDropdownForIncome1 = document.getElementById("trans_category_for_income1")
let subCategoryDropdownForIncome1 = document.getElementById("trans_sub_category_for_income1")
categoryDropdownForIncome1.addEventListener('change',() => {
    console.log("changed");
    console.log(categoryDropdownForIncome1.value);
    (async () => {
        let response  = await fetch('/ExpenseApplication/user/getUserSubCategory?categoryId='+categoryDropdownForIncome1.value).then(data => data.text())
             subCategoryDropdownForIncome1.innerHTML = response;
            console.log(response);
    })()
})


editIncome = document.getElementsByClassName('editIncome');
Array.from(editIncome).forEach((Element) => {
	Element.addEventListener("click", (e) => {
 		
		tr = e.target.parentNode.parentNode;
        
		trans_date_for_income1.value			=	convertJsToDatetimeLocal(tr.getElementsByTagName("td")[0].innerText);
        
		trans_user_id2.value			=	tr.getElementsByTagName("td")[6].id;
		
		trans_account_income1.value			=	tr.getElementsByTagName("td")[1].id;
        
        let AccountDropdownForIncome1 = document.getElementById("trans_account_income1");
        
        (async () => {
	        let response  = await fetch('/ExpenseApplication/admin/getUserAccount?userId='+trans_user_id2.value).then(data => data.text());
	        AccountDropdownForIncome1.innerHTML = response;
	            
	    })()
        
        AccountDropdownForIncome1.value	=	tr.getElementsByTagName("td")[1].id;
        
        let cat_id = tr.getElementsByTagName("td")[2].id;
        
        (async () => {
	        let response  = await fetch('/ExpenseApplication/admin/getUserCategoryIncome?userId='+trans_user_id2.value).then(data => data.text());
	        categoryDropdownForIncome1.innerHTML = response;
	        trans_category_for_income1.value		=	tr.getElementsByTagName("td")[2].id;
	    })()
	    categoryDropdownForIncome1.value =	tr.getElementsByTagName("td")[2].id;
	            
        (async () => {
            let response  = await fetch('/ExpenseApplication/admin/getUserSubCategory?categoryId='+cat_id).then(data => data.text());
            subCategoryDropdownForIncome1.innerHTML = response;
            trans_sub_category_for_income1.value		=	tr.getElementsByTagName("td")[3].id;
        })()
            
        subCategoryDropdownForIncome1.value =	tr.getElementsByTagName("td")[3].id;
        trans_amount_income1.value			=	tr.getElementsByTagName("td")[4].innerText;
		trans_note_income1.value			=	tr.getElementsByTagName("td")[5].innerText;
        trans_id2.value						=	e.target.id
            
        console.log(trans_account_income1)
        console.log("Value qwe "+e.target.id)


		$('#updateModalForIncome').modal('toggle');
            
       /*  	console.log("e.target.id is "+e) */
	})
})



        	
</script>
<%@include file="footer.jsp"%>
</html>