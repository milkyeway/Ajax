<%@ page language="java" contentType="text/html;charset=UTF-8"
	import="java.sql.*" %>
<%
	String cname = request.getParameter("cname");
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=ajaxdb";
	Connection conn = DriverManager.getConnection(connUrl, "sa", "passw0rd");
	
	String qryStmt = "SELECT cname FROM customer WHERE cname = ?";
	PreparedStatement stmt = conn.prepareStatement(qryStmt);
	stmt.setString(1, cname);
	ResultSet rs = stmt.executeQuery();
	
	boolean isAccOk = false;
	if (rs.next())
		isAccOk = true;
	out.print(isAccOk);
	conn.close();
%>
