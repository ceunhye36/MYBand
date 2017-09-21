package model.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import utility.CloseDB;
import utility.Msg;
import utility.OpenDB;

public class BbsDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	//1.bbs write
	public boolean writeBbs(BbsVO bbs){
		int cnt =0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into EH_BBS ");
		sql.append(" (bbs_no,bbs_bid,bbs_uid,bbs_title,bbs_content, bbs_fname, bbs_date) ");
		sql.append(" values((select NVL(MAX(bbs_no),0)+1 from EH_BBS),?,?,?,?,?,sysdate) ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, bbs.getBbs_bid());
			pstmt.setString(2, bbs.getBbs_uid());
			pstmt.setString(3, bbs.getBbs_title());
			pstmt.setString(4, bbs.getBbs_content());
			pstmt.setString(5, bbs.getBbs_fname());
			
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BbsDAO", "writeBbs", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		return cnt>0;
	}
	//2.bbs list _band
	
	//3.bbs one
	//4.bbs modify
	
}
