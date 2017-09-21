package utility;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Utility {
	public static String checkNull(String str) {
		if (str == null || str.equals("null")) {
			str = "";
		}
		return str;
	}
	public static String formatD(String date_str){
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss"); 
		SimpleDateFormat d = new SimpleDateFormat("yyyy-mm-dd");
		Date date = new Date();
		try {
			date = dt.parse(date_str);
		} catch (ParseException e) {
			Msg.msgE("Utility", "formatD", "ParseException date type fail..");
		}
		
		return d.format(date);
	}
}
