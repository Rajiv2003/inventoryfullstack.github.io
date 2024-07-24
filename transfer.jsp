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
			PreparedStatement psmt=conn.prepareStatement("insert into transfer values(?,?,?,?)");
			psmt.setString(1,t2);
			psmt.setString(2,t3);
			psmt.setString(3,t4);
			psmt.setString(4,t1);
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
					PreparedStatement psmt=conn.prepareStatement("delete from transfer where id=?");
					psmt.setString(1,t1);
					psmt.executeQuery();
					out.println("<script>alert('Your data is deleted successfully...')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of save
			//Update record
			if(btnval.equalsIgnoreCase("update"))
			{
				String t1=request.getParameter("t1");
				String t2=request.getParameter("t2");
				String t3=request.getParameter("t3");
				String t4=request.getParameter("t4");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					PreparedStatement psmt=conn.prepareStatement("update transfer set qty=?,sdate1=?,rdate1=? where id=?");
					psmt.setString(1,t2);
					psmt.setString(2,t3);
					psmt.setString(3,t4);
					psmt.setString(4,t1);
					psmt.executeQuery();
					out.println("<script>alert('Your data is Updated successfully....')</script>");
				}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of update
			//Record of Allsearch
			if(btnval.equalsIgnoreCase("allsearch"))
			{
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					ResultSet rs=smt.executeQuery("select * from Transfer");
					%>
					<table border=2>
					<tr>
						<th>Transfer ID</th>
						<TH>Qty</TH> 
						<th>Sdate1</th>
						<th>Rdate1</th>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<th><%=rs.getString(1)%></th>
							<th><%=rs.getString(2)%></th>
							<th><%=rs.getString(3)%></th>
							<th><%=rs.getString(4)%></th>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of all search
			//Record of Allsearch
			if(btnval.equalsIgnoreCase("psearch"))
			{
				String t1=request.getParameter("t1");
				try
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
					Statement smt=conn.createStatement();
					ResultSet rs=smt.executeQuery("select * from Transfer where id='"+t1+"'");
					%>
					<table border=2>
					<tr>
						<th>Transfer ID</th>
						<TH>Qty</TH> 
						<th>Sdate1</th>
						<th>Rdate1</th>
					</tr>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<th><%=rs.getString(1)%></th>
							<th><%=rs.getString(2)%></th>
							<th><%=rs.getString(3)%></th>
							<th><%=rs.getString(4)%></th>
						</tr>
					<%}%>
					<input type=button value="print" onclick="window.print()">
					</table>
				<%}
				catch(Exception e)
				{
					out.println(e.toString());
				}
			}//End of all search
%>
</body>
</html>