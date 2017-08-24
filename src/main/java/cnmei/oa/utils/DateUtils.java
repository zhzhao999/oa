package cnmei.oa.utils;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 日期类
 * 
 * @author zhzhao
 */
public class DateUtils {

	/**
	 * 获取当前日期
	 */
	public static String getCurrentDate() {
		Date today = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String time = f.format(today);
		return time;
	}

	public static String getCurrentDate(String pattern) {
		Date today = new Date();
		SimpleDateFormat f = new SimpleDateFormat(pattern);
		String time = f.format(today);
		return time;
	}

	/**
	 * 字符串转换成Date
	 */
	public static Date getStringToDate(String dateString) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateString);
		return date;
	}

	public static Date getStringToDate(String dateString, String pattern) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date date = sdf.parse(dateString);
		return date;
	}

	/**
	 * Date转换成字符串
	 */
	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);
		return time;
	}

	public static String dateToString(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String time = sdf.format(date);
		return time;
	}

	/**
	 * 判断两个日期是否为同一天
	 */
	public static boolean isSameDate(Date date1, Date date2) {
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);

		boolean isSameYear = cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR);
		boolean isSameMonth = isSameYear && cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH);
		boolean isSameDate = isSameMonth && cal1.get(Calendar.DAY_OF_MONTH) == cal2.get(Calendar.DAY_OF_MONTH);

		return isSameDate;
	}

	/**
	 * 获取 增加(减少)一定年(月/日)后的日期
	 * @param date 待改变的日期
	 * @param changeKey 改变的类型  如：Calendar.DATE Calendar.MONTH Calendar.YEAR
	 * @param changeValue 改变的值  如：-1,1...
	 * @return yyyy-MM-dd样式的新日期
	 */
	public static Date getParseDate(Date date, int changeKey,int changeValue) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(changeKey,changeValue);
		Date time = calendar.getTime();
		/*SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		String dateString = formatter.format(time);  
		ParsePosition pos = new ParsePosition(8);  
		Date parse = formatter.parse(dateString, pos); */
		return time;
	}
}
