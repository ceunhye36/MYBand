package model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.CloseDB;
import utility.Msg;
import utility.OpenDB;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//insert
	public boolean joinUser(UserVO user){
		int cnt = 0;
		
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO EH_USER ");
		sql.append(" (id, pw, u_name,email, u_infop, u_date) ");
		sql.append(" VALUES(?,?,?,?,?,sysdate) ");
//		Admin 계정은 회원가입이 아닌 DB로만 생성가능하다
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getU_name());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getU_infop());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "joinUser", "SQLException  _sql driver loading Fail");
			e.printStackTrace();
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	
	//check id
	public boolean checkID(String id){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(id) FROM EH_USER ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt(1);
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "checkID", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return cnt>0;
	}
	
	//check email
	public boolean checkEMail(String email){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(email) FROM EH_USER ");
		sql.append(" WHERE email=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt(1);
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "checkEMail", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return cnt>0;
	}
	
	//check pw
	public boolean checkPW(Map map){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(id) FROM EH_USER ");
		sql.append(" WHERE id=? and pw=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("id"));
			pstmt.setString(2, (String)map.get("pw"));
			rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt(1);
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "checkPW", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return cnt>0;
	}
	
	//getGrade
	public String getUGRADE(String id){
		String grade=null;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT u_grade FROM EH_USER ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				grade=rs.getString("u_grade");
			}
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "getUGRADE", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return grade;
	}
	
	//select one
	public UserVO selectUserOne(String id){
		UserVO user = null;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, u_name, email, u_infop, u_grade ");
		sql.append(" FROM EH_USER ");
		sql.append(" WHERE id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setU_name(rs.getString("U_NAME"));
				user.setEmail(rs.getString("EMAIL"));
				user.setU_infop(rs.getString("U_INFOP"));
				user.setU_grade(rs.getString("U_GRADE"));
			}
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "selectUserOne", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return user;
	}
	
	//select list 추가해야 하는것 >> 페이징 검색
	public List<UserVO> selectUserList(){
		List<UserVO> list = new ArrayList<>();
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT id, u_name, email, u_infop, u_grade ");
		sql.append(" FROM EH_USER ");
		sql.append(" WHERE u_grade = 'U' ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				UserVO user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setU_name(rs.getString("U_NAME"));
				user.setEmail(rs.getString("EMAIL"));
				user.setU_infop(rs.getString("U_INFOP"));
				user.setU_grade(rs.getString("U_GRADE"));
				
				list.add(user);
			}
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "selectUserOne", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//update pw
	public boolean updatePW(Map map){
		int cnt=0;

		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE EH_USER SET ");
		sql.append(" 	pw=? ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("pw"));
			pstmt.setString(2, (String)map.get("id"));
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "updatePW", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	//update name
	public boolean updateNAME(Map map){
		int cnt=0;

		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE EH_USER SET ");
		sql.append(" 	u_name=? ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("u_name"));
			pstmt.setString(2, (String)map.get("id"));
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "updateNAME", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	//update email
	public boolean updateEMAIL(Map map){
		int cnt=0;

		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE EH_USER SET ");
		sql.append(" 	EMAIL=? ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("email"));
			pstmt.setString(2, (String)map.get("id"));
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "updateEMAIL", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	//update infop
	public boolean updateINFOP(Map map){
		int cnt=0;

		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE EH_USER SET ");
		sql.append(" 	U_INFOP=? ");
		sql.append(" WHERE id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("u_infop"));
			pstmt.setString(2, (String)map.get("id"));
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "updateINFOP", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	//delete
	public boolean deleteUser(Map map){
		int cnt =0;
		
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM EH_USER WHERE id=? and pw=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("id"));
			pstmt.setString(2, (String)map.get("pw"));
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("UserDAO", "deleteUser", "SQLException  _sql driver loading Fail");
		}finally {
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
}
