<%@page import="java.sql.ResultSet"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Feedback Records</title>
    <%@include file="comp/links.jsp"%>
    <style>
    	body{
			background: none;
		}
        .table-container {
            width: 70%;
            margin: 20px auto;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .table td, .table th {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .table th {
            background-color: #D6DCE7;
            color: black;
            text-align: center;
            font-weight:400;
            font-size:18px;
            padding:10px;
        }
        .table td{
        	font-size:15px;
        }

    </style>
</head>
<body>
    <%@ include file="header.jsp" %> 
    <h1 class="text-center" style="font-size: 1.5rem; margin-top:10px; color: #333;">Feedback Records</h1>
    <div class="table-container">
        <table class="table  table-bordered text-center">
            <thead class="table-dark">
                <tr>
                	<th>Sr.No.</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Message</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    ResultSet feedbacks = (ResultSet) request.getAttribute("feedbacks");
                    if (feedbacks != null) {
                        while (feedbacks.next()) {
                %>
                        <tr>
                        	<td><%= feedbacks.getString("srno") %></td>
                            <td><%= feedbacks.getString("email") %></td>
                            <td><%= feedbacks.getString("phone") %></td>
                            <td><%= feedbacks.getString("message") %></td>
                        </tr>
                <% 
                        }
                    } else { 
                %>
                        <tr>
                            <td colspan="3" class="text-danger">No feedback records available</td>
                        </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <%@include file="scripts.jsp"%>
</body>
</html>
