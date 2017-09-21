package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OpenDB {
	public static Connection getConnection(){
		Connection conn=null;
		
		try {
			Class.forName(OracleInfo.DRIVER);
			conn = DriverManager.getConnection(OracleInfo.URL, OracleInfo.USER, OracleInfo.PASSWORD);
		} catch (ClassNotFoundException e) {
			Msg.msgE("OpenDB","getConnection","ClassNotFoundException");
		} catch (SQLException e) {
			Msg.msgE("OpenDB","getConnection","SQLException  _URL Fail");
		}
		
		return conn;
	}
}
