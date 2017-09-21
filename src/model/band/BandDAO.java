package model.band;

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
import utility.Utility;

public class BandDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public boolean createBand(BandVO band){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into EH_BAND ");
		sql.append(" (b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date) ");
		sql.append(" values((select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0)+1,5,'0') from eh_band), ");
		sql.append(" ?,?,?,?,?,sysdate) ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, band.getB_title());
			pstmt.setString(2, band.getB_category());
			pstmt.setString(3, band.getB_exp());
			pstmt.setString(4, band.getB_infop());
			if(band.getB_category().equals("Study")){
				pstmt.setString(5, "studyBasic.jpg");
			}else if(band.getB_category().equals("Sports")){
				pstmt.setString(5, "sportsBasic.jpg");
			}else if(band.getB_category().equals("Travel")){
				pstmt.setString(5, "travelBasic.jpg");
			}else if(band.getB_category().equals("Food")){
				pstmt.setString(5, "foodBasic.jpg");
			}else{
				pstmt.setString(5, "hobbyBasic.jpg");
			}
			
			cnt= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "createBand", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}

		return cnt>0;
	}
	public String crtBandUser(String uid){  //mvc v1 넘어가면 service단에서 conn.setAutoCommit(false);해주어야...
		String str="";
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into eh_ub ");
		sql.append(" (ub_seq, ub_bid,ub_uid,grade,ub_rdate) ");
		sql.append(" values((select nvl(max(ub_seq),0)+1 from eh_ub),(select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0),5,'0') from eh_band),?,'M',sysdate) ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			if(pstmt.executeUpdate()>0){
				sql.setLength(0);
				sql.append("select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0),5,'0') from eh_band");
				CloseDB.close(pstmt);
				pstmt=conn.prepareStatement(sql.toString());
				rs=pstmt.executeQuery();
				rs.next();
				str=rs.getString(1);
			}else{
				str="false";
			}
		}catch (SQLException e) {
			Msg.msgE("BandDAO", "crtBandUser", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return str;
	}
	
	public boolean joinBandUser(UBVO ub){  //mvc v1 넘어가면 service단에서 conn.setAutoCommit(false);해주어야...
		int cnt=0;
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into eh_ub ");
		sql.append(" (ub_seq, ub_bid,ub_uid,grade,ub_rdate) ");
		sql.append(" values((select nvl(max(ub_seq),0)+1 from eh_ub),?,?,'U',sysdate) ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, ub.getUb_bid());
			pstmt.setString(2, ub.getUb_uid());
			cnt=pstmt.executeUpdate();
		}catch (SQLException e) {
			Msg.msgE("BandDAO", "joinBandUser", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return cnt>0;
	}
	
	public BandVO selectBandOne(String bid){
		BandVO band=null;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid  ");
		sql.append(" from eh_band b join eh_ub ub  ");
		sql.append(" on(b_id=ub_bid) where b_id=? and grade='M' ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				band=new BandVO();
				band.setB_id(rs.getString("b_id"));
				band.setB_title(rs.getString("b_title"));
				band.setB_category(rs.getString("b_category"));
				band.setB_exp(Utility.checkNull(rs.getString("b_exp")).replaceAll("\n\r", "<br>"));
				band.setB_infop(rs.getString("b_infop"));
				band.setB_fname(rs.getString("b_fname"));
				band.setB_date(rs.getString("b_date"));
				band.setUb_uid(rs.getString("ub_uid"));
			}
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "selectBandOne", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return band;
	}
	
	public List<BandVO> crtBList(String uid){
		List<BandVO> list = new ArrayList<>();
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid  ");
		sql.append(" from eh_band b join eh_ub ub  ");
		sql.append(" on(b_id=ub_bid) where ub_uid=? and grade='M' ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BandVO band=new BandVO();
				band.setB_id(rs.getString("b_id"));
				band.setB_title(rs.getString("b_title"));
				band.setB_category(rs.getString("b_category"));
				band.setB_exp(Utility.checkNull(rs.getString("b_exp")).replaceAll("\n\r", "<br>"));
				band.setB_infop(rs.getString("b_infop"));
				band.setB_fname(rs.getString("b_fname"));
				band.setB_date(Utility.formatD(rs.getString("b_date")));
				band.setUb_uid(rs.getString("ub_uid"));
				
				list.add(band);
			}
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "crtBList", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<BandVO> joinBList(String uid){
		List<BandVO> list = new ArrayList<>();
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid  ");
		sql.append(" from eh_band join eh_ub  ");
		sql.append(" on(b_id=ub_bid) where ub_uid=? and grade='U' ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BandVO band=new BandVO();
				band.setB_id(rs.getString("b_id"));
				band.setB_title(rs.getString("b_title"));
				band.setB_category(rs.getString("b_category"));
				band.setB_exp(Utility.checkNull(rs.getString("b_exp")).replaceAll("\n\r", "<br>"));
				band.setB_infop(rs.getString("b_infop"));
				band.setB_fname(rs.getString("b_fname"));
				band.setB_date(Utility.formatD(rs.getString("b_date")));
				band.setUb_uid(rs.getString("ub_uid"));
				
				list.add(band);
			}
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "crtBList", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return list;
	}
	public boolean updateBand(BandVO band){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update eh_band set ");
		sql.append(" 	b_title=?, ");
		sql.append(" 	b_category=?, ");
		sql.append(" 	b_exp=?, ");
		sql.append(" 	b_infop=? ");
		sql.append(" where b_id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, band.getB_title());
			pstmt.setString(2, band.getB_category());
			pstmt.setString(3, band.getB_exp());
			pstmt.setString(4, band.getB_infop());
			pstmt.setString(5, band.getB_id());
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "updateBand", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
	public boolean updateFileBand(Map map){
		int cnt=0;

		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update eh_band set ");
		sql.append(" 	b_fname=? ");
		sql.append(" where b_id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("b_fname"));
			pstmt.setString(2, (String)map.get("b_id"));
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "updateFileBand", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
	public boolean delUBinfo(String b_id){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from eh_ub ");
		sql.append(" where ub_bid=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, b_id);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "delUBinfo", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
	public boolean delBand(String b_id){
		int cnt=0;
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from eh_band ");
		sql.append(" where b_id=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, b_id);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "delBand", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
	public List<BandVO> list(){
		List<BandVO> list=new ArrayList<>();
		
		conn = OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,r ");
		sql.append(" from( ");
		sql.append(" 	select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,rownum  ");
		sql.append(" 		from eh_band join eh_ub on(b_id=ub_bid) ");
		sql.append(" 		where b_infop='Public' and grade='M' ");
		sql.append(" 		order by b_id desc ");
		sql.append(" ))where r between 1 and 5 ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()){
				BandVO band=new BandVO();
				band.setB_id(rs.getString("b_id"));
				band.setB_title(rs.getString("b_title"));
				band.setB_category(rs.getString("b_category"));
				band.setB_exp(Utility.checkNull(rs.getString("b_exp")).replaceAll("\n\r", "<br>"));
				band.setB_infop(rs.getString("b_infop"));
				band.setB_fname(rs.getString("b_fname"));
				band.setB_date(Utility.formatD(rs.getString("b_date")));
				band.setUb_uid(rs.getString("ub_uid"));
				
				list.add(band);
			}
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "list", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public List<UBVO> joinUserList(String b_id){
		List<UBVO> list = new ArrayList<>();
		
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select ub_seq, ub_bid,ub_uid,grade,ub_rdate from eh_ub where ub_bid=? order by grade ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, b_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				UBVO ub = new UBVO();
				ub.setUb_seq(rs.getInt("ub_seq"));
				ub.setUb_bid(rs.getString("ub_bid"));
				ub.setUb_uid(rs.getString("ub_uid"));
				ub.setGrade(rs.getString("grade"));
				ub.setUb_rdate(rs.getString("ub_rdate"));
				list.add(ub);
			}
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "joinUserList", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(rs, pstmt, conn);
		}
		
		return list;
	}
	public boolean quitBandUser(Map map){
		int cnt=0;
		
		conn=OpenDB.getConnection();
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from eh_ub where ub_bid=? and ub_uid=? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, (String)map.get("b_id"));
			pstmt.setString(2, (String)map.get("u_id"));
			cnt= pstmt.executeUpdate();
		} catch (SQLException e) {
			Msg.msgE("BandDAO", "quitBandUser", "SQLException  _sql driver loading Fail");
		}finally{
			CloseDB.close(pstmt, conn);
		}
		
		return cnt>0;
	}
}

