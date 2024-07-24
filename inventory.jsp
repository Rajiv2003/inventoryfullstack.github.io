<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="javax.swing.*"%> 
<%
	String btnval=request.getParameter("b1");
	if(btnval.equalsIgnoreCase("save"))
	{
		String t1=request.getParameter("t1");
		String t2=request.getParameter("t2");
		String t3=request.getParameter("t3");
		String t4=request.getParameter("t4");
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into inventory values(?,?,?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
			psmt.setString(3,t3);
			psmt.setString(4,t4);
			psmt.executeQuery();
			out.println("<script>alert('Your data is successfully Saved...')</script>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}//End of save
	//delete command
			if(btnval.equalsIgnoreCase("delete"))
			{
				String t1=request.getParameter("t1");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					PreparedStatement psmt=conn.prepareStatement("delete from inventory where id=?");
					psmt.setString(1,t1);
					psmt.executeQuery();
					out.println("<script>alert('Your data is deleted successfully...')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of save
			if(btnval.equalsIgnoreCase("Update"))
			{
				String t1=request.getParameter("t1");
				String t2=request.getParameter("t2");
				String t3=request.getParameter("t3");
				String t4=request.getParameter("t4");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					PreparedStatement psmt=conn.prepareStatement("Update Inventory set Qtyavail=?,Minstock=?,Maxstock=? Where id=?");
					psmt.setString(1,t2);
					psmt.setString(2,t3);
					psmt.setString(3,t4);
					psmt.setString(4,t1);
					psmt.executeQuery();
					out.println("<script>alert('Record Update......')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of Update
			if(btnval.equalsIgnoreCase("allsearch"))
			{
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					ResultSet rs=smt.executeQuery("select * from inventory");
					%>
					<table border=2>
					<tr>
						<th>Inventory ID</th>
						<TH>Qtyavail</TH>
						<th>Minstok</th>
						<th>Maxstok</th>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<th><%=rs.getString(1)%></th>
							<th><%=rs.getString(2)%></th>
							<th><%=rs.getString(3)%></th>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//end of all search
			if(btnval.equalsIgnoreCase("psearch"))
			{
				String t1=request.getParameter("t1");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					
					ResultSet rs=smt.executeQuery("select * from inventory where id='"+t1+"'");
					%>
					<table border=2>
					<tr>
						<th>Inventory ID</th>
						<TH>Qtyavail</TH>
						<th>Minstok</th>
						<th>Maxstok</th>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<th><%=rs.getString(1)%></th>
							<th><%=rs.getString(2)%></th>
							<th><%=rs.getString(3)%></th>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//end of Psearch
			
			

%>
</body>
</html>