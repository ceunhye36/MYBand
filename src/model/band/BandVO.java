package model.band;

public class BandVO {
	private String b_id;
	private String b_title;
	private String b_category;
	private String b_exp;
	private String b_infop;
	private String b_fname;
	private String b_date;
	private String ub_uid;
	
	public BandVO() {
		super();
	}

	public BandVO(String b_id, String b_title, String b_category, String b_exp, String b_infop, String b_fname,
			String b_date) {
		super();
		this.b_id = b_id;
		this.b_title = b_title;
		this.b_category = b_category;
		this.b_exp = b_exp;
		this.b_infop = b_infop;
		this.b_fname = b_fname;
		this.b_date = b_date;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_exp() {
		return b_exp;
	}

	public void setB_exp(String b_exp) {
		this.b_exp = b_exp;
	}

	public String getB_infop() {
		return b_infop;
	}

	public void setB_infop(String b_infop) {
		this.b_infop = b_infop;
	}

	public String getB_fname() {
		return b_fname;
	}

	public void setB_fname(String b_fname) {
		this.b_fname = b_fname;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getUb_uid() {
		return ub_uid;
	}

	public void setUb_uid(String ub_uid) {
		this.ub_uid = ub_uid;
	}

	@Override
	public String toString() {
		return "BandVO [b_id=" + b_id + ", b_title=" + b_title + ", b_category=" + b_category + ", b_exp=" + b_exp
				+ ", b_infop=" + b_infop + ", b_fname=" + b_fname + ", b_date=" + b_date + "]";
	}
	
	
}
