package cp.pay.mj.utils;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

public abstract class DateUtils
{
  public static final TimeZone TIME_ZONE_BEIJING = TimeZone.getTimeZone("GMT+8:00");

  static final Map<Integer, Integer> WEEK = new HashMap<Integer, Integer>();
  static long NANO_ONE_MINUTE;
  static long NANO_ONE_HOUR;
  static long NANO_ONE_DAY;

  static
  {
    WEEK.put(Integer.valueOf(2), Integer.valueOf(1));
    WEEK.put(Integer.valueOf(3), Integer.valueOf(2));
    WEEK.put(Integer.valueOf(4), Integer.valueOf(3));
    WEEK.put(Integer.valueOf(5), Integer.valueOf(4));
    WEEK.put(Integer.valueOf(6), Integer.valueOf(5));
    WEEK.put(Integer.valueOf(7), Integer.valueOf(6));
    WEEK.put(Integer.valueOf(1), Integer.valueOf(7));

    NANO_ONE_MINUTE = 60000L;
    NANO_ONE_HOUR = 3600000L;
    NANO_ONE_DAY = NANO_ONE_HOUR * 24L;
  }

  public static int getWeekOfDate(java.util.Date date)
  {
    if (date == null) {
      throw new IllegalArgumentException("Argument date is null.");
    }
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    int day = cal.get(7);
    return ((Integer)WEEK.get(Integer.valueOf(day))).intValue();
  }

  public static Time createSqlTime(int hour, int minute, int second) {
    Calendar c = Calendar.getInstance();
    c.set(0, 0, 0, hour, minute, second);
    c.add(14, 0);
    return new Time(c.getTimeInMillis());
  }
  
  static Locale resolveLocale(Locale locale) {
	    if (locale == null) {
	      locale = LocaleHolder.getLocale();
	    }
	    if (locale == null) {
	      locale = Locale.CHINA;
	    }
	    return locale;
	  }
  public static DateFormat getDateFormat(String formatString) {
	    return getDateFormat(formatString, null, null);
	  }
  

  public static DateFormat getDateFormat(String formatString, Locale locale)
  {
    return getDateFormat(formatString, locale, null);
  }
  
  public static DateFormat getDateFormat(String formatString, Locale locale, TimeZone timeZone) {
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatString, resolveLocale(locale));
	    if (timeZone != null) {
	      simpleDateFormat.setTimeZone(timeZone);
	    }
	    return simpleDateFormat;
	  }
  public static String formatDate(java.util.Date date, String formatString) {
	    if (date == null) {
	      return null;
	    }
	    return getDateFormat(formatString, LocaleHolder.getLocale()).format(date);
	  }
}