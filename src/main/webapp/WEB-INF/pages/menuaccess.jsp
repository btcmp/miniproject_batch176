<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<title>Access</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/assets/css/dashboard.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.css"/>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/open-iconic/font/css/open-iconic-bootstrap.min.css" rel="stylesheet">
<style>
		input.parsley-error
		{
		  color: #B94A48 !important;
		  background-color: #F2DEDE !important;
		  border: 1px solid #EED3D7 !important;
		}
		
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		<!-- DASHBOARD -->
			<nav class="col-md-2 d-none d-md-block bg-primary sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link text-white" href="#">
								 Dashboard	
						</a></li>
						<li class="nav-item"><a class="nav-link text-white master" href="#"> Master</a>
						<ul class="nave flex-column mastermenus">
						<c:forEach var="master" items="${mastermenus}">
						<li><a class="nav-link text-white" href="#"> Master Company</a></li>
						</c:forEach>
						
<!-- 						<li><a class="nav-link text-white" href="#"> Master Employee</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Role</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Menu</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Access</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master User</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Unit</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Souvenir</a></li> -->
<!-- 						<li><a class="nav-link text-white" href="#"> Master Product</a></li> -->
						</ul>
						</li>
						<li class="nav-item"><a class="nav-link text-white" href="http://localhost:8433/maven-project/design"> Transaction	
						</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="${logoutUrl}" > Logout	
						</a></li>
					</ul>
					</div>
			</nav><!-- END DASHBOARD -->
			<div role="main" class="col-md-8 ml-sm-auto col-lg-10">
				<div class="card text-white bg-primary mb-3">
					<div class="card-header">Product</div>
				</div>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item"><a href="#">Master</a></li>
						<li class="breadcrumb-item active" aria-current="page">Access</li>
					</ol>
				</nav>
				<!-- BUTTON ADD -->
		<table id="tableInput" style="width:100%">
	<thead>
			<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
				<th><a class="btn btn-primary" id="btnadd" href="#" style="width:100px">Add</a></th>
				</tr>
	<!-- BUTTON SEARCH -->
		<tr>
    			<th></th>
						<th><input type="text" class="form-control" placeholder="Select Role Code" id="data1" data-index="1" style="padding-right:10px;"></th>
						<th><input type="text" class="form-control" placeholder="Select Role Name" id="data2" data-index="2" style="padding-right:10px;"></th>
						<th><input type="text" class="form-control" placeholder="Created Date" id="data3" data-index="4" style="padding-right:10px;"></th>
						<th><input type="text" class="form-control" placeholder="Created By" id="data4" data-index="5" style="padding-right:10px;"></th>
    			<th><a class="btn btn-warning" id="btn-search" href="#" style="width:100px">Search</a></th>
    			</tr>
    			</thead>
    			</table>
				<table class="table table-striped table-hover DataTable" id="menuTable">
			<thead>
				<tr>
					<th>No</th>
					<th>Role Code</th>
					<th>Role Name</th>
					<th>Created Date</th>
					<th>Created By</th>
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
    <%@include file="/WEB-INF/pages/modal/update-product.html"%>
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
<script src="https://cdn.jsdelivr.net/npm/gijgo@1.9.10/js/gijgo.min.js" type="text/javascript"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/parsley.js/2.8.0/parsley.min.js"></script>
<!-- Material Dashboard javascript methods -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#data3').datepicker({
		format:'yyyy-mm-dd',
		autoclose:true,
		uiLibrary:'bootstrap4'
	});
	 loadData(); 
	
	/* BUTTON POP UP */
	$('#btnadd').on('click',function(){
		$('.addId').prop('checked',false);
		$.ajax({
			/* url:'${pagecontext.request.contextPath}/menu/getcode',
			type:'GET',
			success : function(data){
				$('#menucode').val(data);
			}, */
			dataType:'json'
		});
		$('#addModal').modal();
	});
	/* save 8*/
	$('.btn-save').on('click', function(e){
		
		
		var roleId= $('#add-role').val(); 
		 var menus =[]; 
			 $('#menuId:checked').each(function (){
			  var menuId={
					  id:$(this).val()		  
			  }
			  menus.push(menuId);
			 }); 
		
		
		/* for(var i=0;i<l;i++){ */
			var menuAccess = {
					menus :menus,
					role :{
						id: roleId		 
					}
			};
			/*  document.getElementById("notif").innerHTML ="Data saved! new code has been added with code : "+menuAccess.role.code+"!"; 
			$('#notif').show('slow').delay(1000).hide('slow'); */ 
			 $.ajax({
				  url :'${pageContext.request.contextPath}/access/save',
				  type : 'POST',
				  contentType :'application/json',
				  data : JSON.stringify(menuAccess),
				   beforeSend : function (){
					  console.log('sebelom post');
				  },
				  success: function (data) {
					  console.log(data)
					  console.log('data saved successfully')
					   loadData(); 
				  },
				  error : function(){
					  console.log('failed to save data')
				  }
			 });
				/* } */
		
		$('#addModal').modal('hide');
		
		});
		/*  load data */
		function loadData(){
			$.ajax({
				url:'${pageContext.request.contextPath}/access/getall',
				type:'GET',
				beforeSend : function(){
					console.log('before send');
				},
				success : function(output){
					console.log(output);
					convertToTable(output);
				},
				dataType:'json'
			});
	} 
	/* convert to table */
	function convertToTable(data){
		oTable=$('#menuTable').DataTable();
		oTable.rows('tr').remove();
		$.each(data,function(index,access){
			index++;
			var tRow ='<a id="'+access.id+'"href="#" class="btn-update-access">U</a>';
			tRow +=' ';
			tRow +='<a id="'+access.id+'"href="#" class="btn-view-access">V</a>';
			tRow +=' ';
			tRow +='<a id="'+access.id+'"href="#" class="btn-delete-access">D</a>';
			oTable.row.add([index,access.role.code,access.role.roleName,access.createdDate,access.createdBy,tRow]);
		});
		oTable.draw();
	};
	/* search */
	oTable=$('#menuTable').DataTable({
		'sDom':'tip',
		'ordering':false
	});
	$('#btn-search').on('click',function(){
	$('#btn-search').on('click',function(){
		for(var i=1;i<5;i++){
			oTable
			.column($('#data'+i).data('index'))
			.search($('#data'+i).val())
			.draw()
		}
	});
	});
	/* view */
	$(document).on('click','.btn-view-access',function(){
		var id=$(this).attr('id');
		$('.viewId').prop('checked',false);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/access/getmenuaccess/'+id,
			type:'GET',
			success:function(data){
				/* var in= data.menu.id;*/
				 $('#view-role').val(data.role.id);
				$('#ViewAccess').val(data.id);
				for(var i=0;i<data.menus.length;i++){
					$('#'+data.menus[i].id+'').prop('checked',true);   	
					console.log(data);
				}			
			},
			dataType:'json'
		});
		$('#viewModal').modal();
	});
	/* pop up update */
	$(document).on('click','.btn-update-access',function(){
		var id=$(this).attr('id');
		$('.updateId').prop('checked',false);
		
		$.ajax({
			url:'${pageContext.request.contextPath}/access/getmenuaccess/'+id,
			type:'GET',
			success:function(data){
				/* var in= data.menu.id;*/
				 $('#update-role').val(data.role.id);
				$('#idAccess').val(data.id);
				for(var i=0;i<data.menus.length;i++){
					$('#'+data.menus[i].id+'').prop('checked',true);   			
				}			
			},
			dataType:'json'
		});
		$('#updateModal').modal();
	});
	/* update data */
	$('.btn-update').click(function(){
		var id=$('#idAccess').val();
		var roleId= $('#update-role').val(); 
	 var menus =[]; 
		 $('.updateId:checked').each(function (){
		  var menuId={
				  id:$(this).val()		  
		  }
		  menus.push(menuId);
		 });
		 var menuAccess = {
					menus :menus,
					role :{
						id: roleId		 
					}
			};
		/*  var access={
				 isDelete:true
		 }
		 console.log(JSON.stringify(access)); */
		 console.log(menuAccess);
		 $.ajax({
			  url :'${pageContext.request.contextPath}/access/update/' +id,
			  type : 'POST',
			  contentType :'application/json',
			  data : JSON.stringify(menuAccess),
			   beforeSend : function (){
				  console.log('sebelom post');
			  },
			  success: function (data) {
				  console.log('data update successfully')
				   loadData(); 
			  },
			  error : function(){
				  console.log('failed to update data')
			  }
		 });
			
	
	$('#updateModal').modal('hide');
	});
	/* delete */
	$(document).on('click','.btn-delete-access',function(){
		var id=$(this).attr('id');
		console.log(id);
		$.ajax({
			url:'${pageContext.request.contextPath}/access/getid/'+id,
			type:'GET',
			success:function(data){
				$('#idDelete').val(data.id);
				$('#mRoleDelete').val(data.role.id);
				/* $('#mMenuDelete').val(data.menus.id); */
				$('#isDelete').val(data.isDelete);
				$('#crDelete').val(data.createdBy);
				$('#dateDelete').val(data.createdDate);
				console.log(data);
			},
			dataType:'json'
		});
		$('#deleteModal').modal();
	});
	/* delete data */
	$('#btnDelete').click(function(){
		var access={
				id:parseInt($('#idDelete').val()),
				role:$('#mRoleDelete').val(),
				menu:$('#mMenuDelete').val(),
				isDelete:true,
				createdBy:$('#crDelete').val(),
				createdDate:$('#dateDelete').val()
		}
		console.log(JSON.stringify(access));
		$.ajax({
			url:'${pageContext.request.contextPath}/access/delete/' +access.id,
			type:'DELETE',
			contentType:'application/json',
			data:JSON.stringify(access),
			success:function(data){
				console.log("data di delete");
				loadData();
				$('#deleteModal').modal('hide');
			},
			error :function(){
				console.log("data kacau");
			}
		});
	});
});

$('.master').click(function(){
	$('.mastermenus').toggle();
})
	
</script>
</html>