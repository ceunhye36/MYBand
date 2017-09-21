package model.bbs;

public class BbsVO {
	private int bbs_no;
	private String bbs_bid;
	private String bbs_uid;
	private String bbs_title;
	private String bbs_content;
	private String bbs_fname;
	private int bbs_fsize;
	private int bbs_vcnt;
	private String bbs_date;
	private int rcnt;
	
	public BbsVO() {
		super();
	}
	public BbsVO(int bbs_no, String bbs_bid, String bbs_uid, String bbs_title, String bbs_content, String bbs_fname,
			int bbs_fsize, int bbs_vcnt, String bbs_date, int rcnt) {
		super();
		this.bbs_no = bbs_no;
		this.bbs_bid = bbs_bid;
		this.bbs_uid = bbs_uid;
		this.bbs_title = bbs_title;
		this.bbs_content = bbs_content;
		this.bbs_fname = bbs_fname;
		this.bbs_fsize = bbs_fsize;
		this.bbs_vcnt = bbs_vcnt;
		this.bbs_date = bbs_date;
		this.rcnt = rcnt;
	}
	
	
	public int getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(int bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getBbs_bid() {
		return bbs_bid;
	}
	public void setBbs_bid(String bbs_bid) {
		this.bbs_bid = bbs_bid;
	}
	public String getBbs_uid() {
		return bbs_uid;
	}
	public void setBbs_uid(String bbs_uid) {
		this.bbs_uid = bbs_uid;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_fname() {
		return bbs_fname;
	}
	public void setBbs_fname(String bbs_fname) {
		this.bbs_fname = bbs_fname;
	}
	public int getBbs_fsize() {
		return bbs_fsize;
	}
	public void setBbs_fsize(int bbs_fsize) {
		this.bbs_fsize = bbs_fsize;
	}
	public int getBbs_vcnt() {
		return bbs_vcnt;
	}
	public void setBbs_vcnt(int bbs_vcnt) {
		this.bbs_vcnt = bbs_vcnt;
	}
	public String getBbs_date() {
		return bbs_date;
	}
	public void setBbs_date(String bbs_date) {
		this.bbs_date = bbs_date;
	}
	public void setRcnt(int rcnt){
		this.rcnt = rcnt;
	}
	public int getRcnt(){
		return rcnt;
	}
	
	
	@Override
	public String toString() {
		return "BbsVO [bbs_no=" + bbs_no + ", bbs_bid=" + bbs_bid + ", bbs_uid=" + bbs_uid + ", bbs_title=" + bbs_title
				+ ", bbs_content=" + bbs_content + ", bbs_fname=" + bbs_fname + ", bbs_fsize=" + bbs_fsize
				+ ", bbs_vcnt=" + bbs_vcnt + ", bbs_date=" + bbs_date +", rcnt=" + rcnt + "]";
	}
	
	
}
