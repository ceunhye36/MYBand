package model.band;

public class UBVO {
	private int ub_seq;
	private String ub_bid;
	private String ub_uid;
	private String grade;
	private String ub_rdate;

	public UBVO() {
		super();
	}

	public UBVO(int ub_seq, String ub_bid, String ub_uid, String grade, String ub_rdate) {
		super();
		this.ub_seq = ub_seq;
		this.ub_bid = ub_bid;
		this.ub_uid = ub_uid;
		this.grade = grade;
		this.ub_rdate = ub_rdate;
	}

	public int getUb_seq() {
		return ub_seq;
	}

	public void setUb_seq(int ub_seq) {
		this.ub_seq = ub_seq;
	}

	public String getUb_bid() {
		return ub_bid;
	}

	public void setUb_bid(String ub_bid) {
		this.ub_bid = ub_bid;
	}

	public String getUb_uid() {
		return ub_uid;
	}

	public void setUb_uid(String ub_uid) {
		this.ub_uid = ub_uid;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getUb_rdate() {
		return ub_rdate;
	}

	public void setUb_rdate(String ub_rdate) {
		this.ub_rdate = ub_rdate;
	}

	@Override
	public String toString() {
		return "UBVO [ub_seq=" + ub_seq + ", ub_bid=" + ub_bid + ", ub_uid=" + ub_uid + ", grade=" + grade
				+ ", ub_rdate=" + ub_rdate + "]";
	}
	
}
