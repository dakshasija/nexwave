<!DOCTYPE html>
<%@page import="com.pm.model.Product"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>pm-app</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a href="/" class="navbar-brand">PM-app</a>
			</div>
		</div>
	</nav>

	<div class="container">

		<%
			List<Product> products = (List<Product>) request.getAttribute("allProducts");
			if (products != null) {
		%>

		<div class="panel panel-danger">
			<div class="panel-heading">All Products</div>
			<div class="panel-body">

				<table
					class="table table-bordered table-condensed table-hover table-stripped table-responsive">
					<%
						for (Product product : products) {
					%>

					<tr>
						<td>
							<%
								out.print(product.getName());
							%>
						</td>
						<td><%=product.getPrice()%></td>
						<td><%=product.getType()%></td>
						<td><%=product.getMakeDate()%></td>
						<td><%=product.getDescription()%></td>
						<td><a href><span class="glyphicon glyphicon-edit"></span></a></td>
						<td><a href="delete-product?id=<%=product.getId()%>"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
					<%
						}
					%>
				</table>



			</div>
		</div>

		<%
			}
		%>

		<hr />

		<div class="col-md-6">
			<div class="panel panel-danger">
				<div class="panel-heading">Product Form</div>
				<div class="panel-body">
					<form action="save-product" method="post">
						<div class="form-group">
							<label>Name</label> <input name="name" class="form-control">
						</div>
						<div class="form-group">
							<label>Price</label> <input name="price" type="number"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Type</label> <select name="type" class="form-control">
								<option>ELEC</option>
								<option>OTHER</option>
							</select>
						</div>
						<div class="form-group">
							<label>Make-date</label> <input name="makeDate" type="date"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Description</label>
							<textarea name="description" rows="5" cols="35"
								class="form-control"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Add</button>
					</form>
				</div>
			</div>
		</div>



	</div>


</body>
</html>