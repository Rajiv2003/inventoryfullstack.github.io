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
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
			PreparedStatement psmt=conn.prepareStatement("insert into order1 values(?,?)");
			psmt.setString(1,t1);
			psmt.setString(2,t2);
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
				PreparedStatement psmt=conn.prepareStatement("delete from order1 where id=?");
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
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
				PreparedStatement psmt=conn.prepareStatement("update order1 set date1=? where id=?");
				psmt.setString(1,t2);
				psmt.setString(2,t1);
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
				ResultSet rs=smt.executeQuery("select * from order1");
				%>
				<table border=2>
				<tr>
					<th>Order1 ID</th>
					<TH>Date1</th>
				</tr>
				<%
				while(rs.next())
				{
				%>
					<tr>
						<th><%=rs.getString(1)%></th>
						<th><%=rs.getString(2)%></th>
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
						ResultSet rs=smt.executeQuery("select * from order1 where id='"+t1+"'");
						%>
						<table border=2>
						<tr>
							<th>Order1 ID</th>
							<TH>Date1</th>
						</tr>
						<%
						while(rs.next())
						{
						%>
							<tr>
								<th><%=rs.getString(1)%></th>
								<th><%=rs.getString(2)%></th>
							</tr>
						<%}%>
						<input type=button value="print" onclick="window.print()">
						</table>
					<%}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}//End of psearch
				if(btnval.equalsIgnoreCase("search"))
				{
					String s1 = request.getParameter("s1");
					String t1 = request.getParameter("t1");
					try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection conn=DriverManager.getConnection("ojdbc:oracle:thin:@localhost:1521:xe", "inventory", "inventory");
						Statement smt=conn.createStatement();
						ResultSet rs=smt.executeQuery("select * from order1 where "+s1+"="+"'"+t1+"'");
						%>
						<table border=2>
						<tr>
							<th>Order1 ID</th>
							<TH>Date1</th>
						</tr>
						<%
						while(rs.next())
						{
						%>
							<tr>
								<th><%=rs.getString(1)%></th>
								<th><%=rs.getString(2)%></th>
							</tr>
						<%}%>
						<input type=button value="print" onclick="window.print()">
						</table>
					<%}
					catch(Exception e)
					{
						out.println(e.toString());
					}
				}//End of special search




%>
</body>
</html>