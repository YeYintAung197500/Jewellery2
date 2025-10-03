package package1;

import java.sql.*;
public class Connection_provider {
	
	
	public static Connection getConnecttion() {
		Connection cons = null;
		try {
		
			Class.forName("com.mysql.cj.jdbc.Driver");

			cons = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jewellery", "root", "4388gigi");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cons;
	}
	
	public static void main(String[] args) {
		System.out.println(getConnecttion());
	}

}