package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConn {
	public static Connection getConnection(){
		Connection connection=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection=DriverManager.getConnection("jdbc:oracle:thin:@db.980108.shop:1521:xe","JSPUSER","JSPUSER");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
}
