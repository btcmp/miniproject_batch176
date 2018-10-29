<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/assets/css/dashboard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/assets/datepicker/dist/datepicker.min.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		<!-- DASHBOARD -->
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active" href="#">
								 Dashboard
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> Master
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#">
								Products
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> Transaction	
						</a></li>
					</ul>
					</div>
			</nav><!-- END DASHBOARD -->
			<div role="main" class="col-md-9 ml-sm-auto col-lg-10">
				<div class="card text-white bg-primary mb-3" style="width: 100%;">
					<div class="card-header">List Company</div>
				</div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Library</a></li>
						<li class="breadcrumb-item active" aria-current="page">Data</li>
					</ol>
				</nav>
				<div class="row d-flex justify-content-end" style="float:right;padding-bottom:10px;">
			<div class="col">
				<button class="btn btn-primary" id="addBtn" type="submit" style="width:100px;">Add</button>
			</div>
		</div>
		
			<div class="row d-flex justify-content-end" style="width: 100%; margin : auto; padding-bottom:10px;">
					<form class="form-inline">
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Select Product Code" style="padding-right:30px;">
						</div>
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Select Product Name" style="padding-right:30px;">
						</div>
						<div class="col">
							<input type="text" class="form-control"
								placeholder="Created Date" style="padding-right:30px;">
						</div>
						<div class="col">
							<input type="text" class="form-control" placeholder="Created By" style="padding-right:30px;">
						</div>
						<a class="btn btn-warning" id="searchBtn" href="#" style="width:100px;">Search</a>
					</form>
				</div>
		
				<table id="productTable" class="table">
				<thead class="thead-light">
					<tr>
						<th>No.</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Description</th>
						<th>Created By</th>
						<th>Created Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			</div>
		</div>
	<%@include file="/WEB-INF/pages/modal/add-product.html"%>
	<%@include file="/WEB-INF/pages/modal/delete-product.html"%>
    <%@include file="/WEB-INF/pages/modal/view-product.html"%>
	</div>
	
</body>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/datepicker/dist/datepicker.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.8.0/parsley.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" ></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	loadData();
	$(document).on('click','.btn-view-product',function(){
								var id = $(this).attr('id');
								$.ajax({
									url : '${pageContext.request.contextPath}/product/getbyid/'+id,
									type : 'GET',
									success : function(data) {
										$('#codeView').val(data.code);
										$('#nameView').val(data.name);
										$('#descView').val(data.description);
										console.log(data);
									},
									dataType : 'json'
								});
								$('#viewProductModal').modal();
							});
	//delete product
	$(document).on('click','.btn-delete-product',function(){
								var id = $(this).attr('id');
								$.ajax({
									url : '${pageContext.request.contextPath}/product/getbyid/'+id,
									type : 'GET',
									success : function(data) {
										$('#idDelete').val(data.id);
										$('#codeDelete').val(data.code);
										$('#nameDelete').val(data.name);
										$('#descDelete').val(data.description);
										$('#isDelete').val(data.isDelete);
										$('#crDelete').val(data.createdBy);
										$('#dateDelete').val(data.createdDate);
										console.log(data);
									},
									dataType : 'json'
								});
								$('#deleteProductModal').modal();
							});
	$('#btnDelete').click(function(){	
		var product ={
				id:parseInt($('#idDelete').val()),
				code:$('#codeDelete').val(),
				name:$('#nameDelete').val(),
				description:$('#descDelete').val(),
				'delete' : true,
				createdBy:$('#crDelete').val(),
				createdDate:$('#dateDelete').val()
		}
		console.log(JSON.stringify(product));
		$.ajax({
			url : '${pageContext.request.contextPath}/product/delete',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(product),
			success : function(data){
				console.log("data di delete");
				loadData();
				$('#deleteProductModal').modal('hide');
			},
			error : function(){
				console.log("data error");
			}
		});
	});
	
	
	//get code send to modal
	$(document).on('click','#addBtn',function(){
		 $.ajax({
			 url : '${pageContext.request.contextPath}/product/getcode',
			 type: 'GET',
			 success : function(data){
				 $('#productcode').val(data);
			 },
			 dataType: 'json'
		 })
 	   	$('#productname').removeClass('is-invalid')
 	   	
		$('#addProductModal').modal();
	 });
	//validasi
 	$('#addBtnModal').on('click', function(){
 		//Fetch form to apply custom Bootstrap validation
 	    var validate = $('#addForm').parsley();
    	if(validate.validate()){    		
    		var product = {
    				code : $('#productcode').val(),
    				name : $('#productname').val(),
    				description : $('#description').val()
    			}
    		$.ajax({
    			url : '${pageContext.request.contextPath}/product/save',
    			type : 'POST',
    			contentType : 'application/json',
    			data : JSON.stringify(product),
    			success : function(data){
    				console.log("data telah disimpan");
    				loadData();
    				$('#addProductModal').modal('hide');
    				$('#productcode').val("");
    				$('#productname').val("");
    				$('#description').val("");
    			},
    			error : function(){
    				console.log("data error");
    			}
    		});	
 	    }
 	});
	//Load Data
	function loadData(){
		$.ajax({
			url : '${pageContext.request.contextPath}/product/getall',
			type : 'GET',
			success : function(data){
				console.log("data telah disimpan");
				convertToTable(data);
			},
			error : function(){
				console.log("data error");
			},
			dataType : 'json'
		});
	}
	//convert to table
	function convertToTable(data){
		var oTable = $('#productTable');
		var tBody = oTable.find('tBody');
		tBody.find('tr').remove();
		$.each(data,function(index,product){
			index++;
			var tRow = '<tr>';
			tRow +='<td>';
			tRow +=index;
			tRow +='</td>';
			tRow +='<td>';
			tRow +=product.code;
			tRow +='</td>';
			tRow +='<td>';
			tRow +=product.name;
			tRow +='</td>';
			tRow +='<td>';
			tRow +=product.description;
			tRow +='</td>';
			tRow +='<td>';
			tRow +=product.createdBy;
			tRow +='</td>';
			tRow +='<td>';
			tRow +=product.createdDate;
			tRow +='</td>';
			tRow +='<td>';
			tRow +='<a id="'+product.id+'" href="#" class="btn btn-warning btn-edit-product" style="color: #e01616;">E</a>';
			tRow +=' ';
			tRow +='<a id="'+product.id+'" href="#" class="btn btn-warning btn-view-product" style="color: #e01616;">V</a>';
			tRow +=' ';
			tRow +='<a id="'+product.id+'" href="#" class="btn btn-warning btn-delete-product" style="color: #e01616;">D</a>';
			tRow +='</td>';
			tRow +='</tr>';
			tBody.append(tRow);
		});
	}
})
	
</script>
</html>