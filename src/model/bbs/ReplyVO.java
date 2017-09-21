package model.bbs;

public class ReplyVO {
	private int re_no;
	private String re_uid;
	private String re_bbsno;
	private String re_content;
	private String re_date;
	private int re_indent;
	private int re_ansnum;
	private int re_ref;
	
	
	public ReplyVO() {
		super();
	}
	public ReplyVO(int re_no, String re_uid, String re_bbsno, String re_content, String re_date, int re_indent,
			int re_ansnum, int re_ref) {
		super();
		this.re_no = re_no;
		this.re_uid = re_uid;
		this.re_bbsno = re_bbsno;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_indent = re_indent;
		this.re_ansnum = re_ansnum;
		this.re_ref = re_ref;
	}
	
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getRe_uid() {
		return re_uid;
	}
	public void setRe_uid(String re_uid) {
		this.re_uid = re_uid;
	}
	public String getRe_bbsno() {
		return re_bbsno;
	}
	public void setRe_bbsno(String re_bbsno) {
		this.re_bbsno = re_bbsno;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public int getRe_indent() {
		return re_indent;
	}
	public void setRe_indent(int re_indent) {
		this.re_indent = re_indent;
	}
	public int getRe_ansnum() {
		return re_ansnum;
	}
	public void setRe_ansnum(int re_ansnum) {
		this.re_ansnum = re_ansnum;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [re_no=" + re_no + ", re_uid=" + re_uid + ", re_bbsno=" + re_bbsno + ", re_content="
				+ re_content + ", re_date=" + re_date + ", re_indent=" + re_indent + ", re_ansnum=" + re_ansnum
				+ ", re_ref=" + re_ref + "]";
	}
	
	
}
