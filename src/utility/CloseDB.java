package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CloseDB {
	public static void close(Connection conn){
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  Connection close Fail");
		}
	}
	public static void close(PreparedStatement pstmt){
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  PreparedStatement close Fail");
		}
	}
	public static void close(ResultSet rs){
		try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  ResultSet close Fail");
		}
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn){
		try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  ResultSet close Fail");
		}
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  PreparedStatement close Fail");
		}
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  Connection close Fail");
		}
	}
	
	public static void close(PreparedStatement pstmt, Connection conn){
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  PreparedStatement close Fail");
		}
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  Connection close Fail");
		}
	}

	public static void close(ResultSet rs, PreparedStatement pstmt){
		try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  ResultSet close Fail");
		}
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			Msg.msgE("CloseDB","close","SQLException  PreparedStatement close Fail");
		}
	}
}
