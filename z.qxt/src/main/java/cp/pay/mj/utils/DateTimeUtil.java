package cp.pay.mj.utils;
import java.text.*;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * ժ¼����http://blog.csdn.net/lzkkevin/article/details/6698213
 * Class Name:DateTimeUtil.java
 * Purpose:Ϊ�˱��ڲ��� ʱ�����͸�ʽ��
 */
public class DateTimeUtil
{
	private static String TIME_PATTERN = "HH:mm:ss";// �����׼ʱ���ʽ
	public static String DATE_PATTERN_1 = "yyyy/MM/dd";// �����׼���ڸ�ʽ1
	public static String DATE_PATTERN_2 = "yyyy-MM-dd";// �����׼���ڸ�ʽ2
	public static String DATE_PATTERN_3 = "yyyy/MM/dd HH:mm:ss";// �����׼���ڸ�ʽ3������ʱ��
	public static String DATE_PATTERN_32 = "yyyy-MM-dd:HH:mm:ss";// �����׼���ڸ�ʽ3������ʱ��
	public static String DATE_PATTERN_33 = "yyyy-MM-dd HH:mm:ss";// �����׼���ڸ�ʽ3������ʱ��
	public static String DATE_PATTERN_4 = "yyyy/MM/dd HH:mm:ss E";// �����׼���ڸ�ʽ4������ʱ�������
	public static String DATE_PATTERN_5 = "yyyy��MM��dd�� HH:mm:ss E";// �����׼���ڸ�ʽ5������ʱ�������
	public static String DATE_PATTERN_6 = "yyyyMMddHHmmss";// �����׼���ڸ�ʽ5������ʱ�������
	public static String DATE_PATTERN_MY = "yy-MM-dd";// �����׼���ڸ�ʽ used in parse
														// Excel

	/**
	 * ����ʱ�����ͳ���
	 */
	public final static int SECOND = 1;
	public final static int MINUTE = 2;
	public final static int HOUR = 3;
	public final static int DAY = 4;
	private Date now;

	public Date getNow()
	{
		return now;
	}

	public void setNow(Date now)
	{
		this.now = now;
	}

	/**
	 * ���췽������ʼ��nowʱ��
	 */
	public DateTimeUtil()
	{
		now = new Date();
	}

	/**
	 * ��һ�����ڣ�����ĳ�ָ�ʽ ��ʽ�����
	 * 
	 * @param date
	 *            ���ڶ���
	 * @param pattern
	 *            ��ʽģ��
	 * @return �����ַ�������
	 */
	public static String formatDate(Date date, String pattern)
	{
		if (date == null)
		{
			return null;
		}
		else
		{
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(date);
		}
	}

	/**
	 * ���ַ������͵�ʱ��ת��ΪDate����
	 * 
	 * @param str
	 *            ʱ���ַ���
	 * @param pattern
	 *            ��ʽ
	 * @return ����Date����
	 */
	public static Date formatString(String str, String pattern)
	{
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date time = null;
		// ��Ҫ����ParseException�쳣���粻Ҫ���񣬿���ֱ���׳��쳣�������׳����ϲ�
		try
		{
			time = sdf.parse(str);
		}
		catch (ParseException e)
		{
			e.printStackTrace();
		}
		return time;
	}

	/**
	 * ��һ����ʾʱ��ε���ת��Ϊ������
	 * 
	 * @param num
	 *            ʱ�����ֵ,֧��С��
	 * @param type
	 *            ʱ�����ͣ�1->��,2->����,3->Сʱ,4->��
	 * @return long����ʱ������������Ϊ-1ʱ��ʾ�����д�
	 */
	public static long formatToTimeMillis(double num, int type)
	{
		if (num <= 0) return 0;
		switch (type)
		{
			case SECOND:
				return (long) (num * 1000);
			case MINUTE:
				return (long) (num * 60 * 1000);
			case HOUR:
				return (long) (num * 60 * 60 * 1000);
			case DAY:
				return (long) (num * 24 * 60 * 60 * 1000);
			default:
				return -1;
		}
	}

	/**
	 * ֻ���һ��ʱ���е��·�
	 * 
	 * @param date
	 * @return ����int��ֵ����
	 */
	public int getMonth(Date date)
	{
		String month = formatDate(date, "MM");// ֻ���ʱ��
		return Integer.parseInt(month);
	}

	/**
	 * ֻ���һ��ʱ���е����
	 * 
	 * @param date
	 * @return ������ֵ����
	 */
	public int getYear(Date date)
	{
		String year = formatDate(date, "yyyy");// ֻ������
		return Integer.parseInt(year);
	}

	/**
	 * �õ�һ�����ں����ĸ�ʽ��ʱ��
	 * 
	 * @param date
	 *            ���ڶ���
	 * @return
	 */
	public String getTimeByDate(Date date)
	{
		return formatDate(date, TIME_PATTERN);
	}

	/**
	 * ��ȡ��ǰ��ʱ�䣬new Date()��ȡ��ǰ������
	 * 
	 * @return
	 */
	public  String getNowTime()
	{
		return formatDate(new Date(), TIME_PATTERN);
	}

	/**
	 * ��ȡĳһָ��ʱ���ǰһ��ʱ��
	 * 
	 * @param num
	 *            ʱ�����ֵ
	 * @param type
	 *            ʱ������ͣ�1->��,2->����,3->Сʱ,4->��
	 * @param date
	 *            �ο�ʱ��
	 * @return ���ظ�ʽ��ʱ���ַ���
	 */
	public String getPreTimeStr(double num, int type, Date date)
	{
		long nowLong = date.getTime();// ���ο�����ת��Ϊ����ʱ��
		Date time = new Date(nowLong - formatToTimeMillis(num, type));// ��ȥʱ��������
		return getTimeByDate(time);
	}
	

	/**
	 * ��ȡĳһָ��ʱ���ǰһ��ʱ��
	 * 
	 * @param num
	 *            ʱ�����ֵ
	 * @param type
	 *            ʱ������ͣ�1->��,2->����,3->Сʱ,4->��
	 * @param date
	 *            �ο�ʱ��
	 * @return ����Date����
	 */
	public static Date  getPreTime(double num, int type, Date date)
	{
		long nowLong = date.getTime();// ���ο�����ת��Ϊ����ʱ��
		Date time = new Date(nowLong - formatToTimeMillis(num, type));// ��ȥʱ��������
		return time;
	}

	/**
	 * ��ȡĳһָ��ʱ��ĺ�һ��ʱ��
	 * 
	 * @param num
	 *            ʱ�����ֵ
	 * @param type
	 *            ʱ������ͣ�1->��,2->����,3->Сʱ,4->��
	 * @param date
	 *            �ο�ʱ��
	 * @return ���ظ�ʽ��ʱ���ַ���
	 */
	public String getNextTimeStr(double num, int type, Date date)
	{
		long nowLong = date.getTime();// ���ο�����ת��Ϊ����ʱ��
		Date time = new Date(nowLong + formatToTimeMillis(num, type));// ����ʱ��������
		return getTimeByDate(time);
	}

	/**
	 * ��ȡĳһָ��ʱ��ĺ�һ��ʱ��
	 * 
	 * @param num
	 *            ʱ�����ֵ
	 * @param type
	 *            ʱ������ͣ�1->��,2->����,3->Сʱ,4->��
	 * @param date
	 *            �ο�ʱ��
	 * @return ����Date����
	 */
	public Date getNextTime(double num, int type, Date date)
	{
		long nowLong = date.getTime();// ���ο�����ת��Ϊ����ʱ��
		Date time = new Date(nowLong + formatToTimeMillis(num, type));// ����ʱ��������
		return time;
	}

	/**
	 * �õ�ǰ�����µ�����
	 * ����GregorianCalendar���set������ʵ��
	 * 
	 * @param num
	 * @param date
	 * @return
	 */
	public Date getPreMonthTime(int num, Date date)
	{
		GregorianCalendar gregorianCal = new GregorianCalendar();
		gregorianCal
				.set(Calendar.MONTH, gregorianCal.get(Calendar.MONTH) - num);
		return gregorianCal.getTime();
	}

	/**
	 * �õ��󼸸��µ�����ʱ��
	 * ����GregorianCalendar���set������ʵ��
	 * 
	 * @param num
	 * @param date
	 * @return
	 */
	public Date getNextMonthTime(int num, Date date)
	{
		GregorianCalendar gregorianCal = new GregorianCalendar();
		gregorianCal
				.set(Calendar.MONTH, gregorianCal.get(Calendar.MONTH) + num);
		return gregorianCal.getTime();
	}

	/**
	 * Author: Tom Hu
	 * Method Name:getDaysBetweenDates
	 * Purpose:Get the days between two Date objects.
	 */
	public int getDaysBetweenDates(Date startDate, Date endDate)
	{
		int days = 0;

		days = (int) ((endDate.getTime() - startDate.getTime()) / 86400000);

		return days;
	}

	/**
	 * Author:Tom Hu
	 * Method Name:getDayOfWeek
	 * Purpose:Gat which of this week
	 * Sunday --> 7 Saturday --> 6
	 */
	public int getDayOfWeek(Date date)
	{
		int day = 0;
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		if (c.get(Calendar.DAY_OF_WEEK) == 1)
		{
			day = 7;
		}
		else
		{
			day = c.get(Calendar.DAY_OF_WEEK) - 1;
		}
		return day;
	}

	/**
	 * Author:Tom Hu
	 * Method Name:getWeeksBetweenDates
	 * Purpose:Get the weeks between two date, but when the date
	 */
	public int getWeeksBetweenDates(Date startDate, Date endDate)
	{
		int weeks = 0;
		int days = getDaysBetweenDates(startDate, endDate);
		weeks = (days + 1) / 7;
		return weeks;
	}

	/**
	 * Method Name:getPreFriDay
	 * Purpose:
	 */
	public Date getPreFriday(Date date)
	{
		int dayOfWeek = getDayOfWeek(date);
		if (5 == dayOfWeek)
		{
			return date;
		}
		else if (5 > dayOfWeek)
		{
			date = getPreTime(dayOfWeek + 2, 4, date);
			return date;
		}
		else
		{
			date = getPreTime(dayOfWeek - 5, 4, date);
			return date;
		}
		
	}

	public Date getNextFriday(Date date)
	{
		int dayOfWeek = new DateTimeUtil().getDayOfWeek(date);
		if (5 == dayOfWeek)
		{
			return date;
		}
		else if (5 < dayOfWeek)
		{
			date = new DateTimeUtil().getNextTime(dayOfWeek, 4, date);
			return date;
		}
		else
		{
			date = new DateTimeUtil().getNextTime(5 - dayOfWeek, 4, date);
			return date;
		}
		 
	}
	public static Date getpreFirstDay(){
		Calendar   cale=Calendar.getInstance();//��ȡ��ǰ���� 
		cale.add(Calendar.MONTH, -1);
		cale.set(Calendar.DAY_OF_MONTH,1);//����Ϊ1��,��ǰ���ڼ�Ϊ���µ�һ�� 
		cale.set(Calendar.HOUR_OF_DAY, 0);
		cale.set(Calendar.SECOND,0);
		cale.set(Calendar.MINUTE,0);
		Date start = cale.getTime();
		return start;
	}
	public static Date getFirstDayOfMonth(){
		Calendar   cale=Calendar.getInstance();//��ȡ��ǰ���� 
		cale.set(Calendar.DAY_OF_MONTH,0);//����Ϊ1��,��ǰ���ڼ�Ϊ���µ�һ�� 
		cale.set(Calendar.HOUR_OF_DAY, 0);
		cale.set(Calendar.SECOND,0);
		cale.set(Calendar.MINUTE,0);
		Date end = cale.getTime();
		return end;
	}
	public static Date getpreDayBreak(){
		Calendar   cale=Calendar.getInstance();//��ȡ��ǰ���� 
		cale.set(Calendar.DATE, cale.get(Calendar.DATE) -1);
		cale.set(Calendar.HOUR_OF_DAY, 0);
		cale.set(Calendar.SECOND,0);
		cale.set(Calendar.MINUTE,0);
		Date start = cale.getTime();
		return start;
	}
	public static Date getNowDayBreak(){
		Calendar   cale=Calendar.getInstance();//��ȡ��ǰ���� 
		cale.set(Calendar.HOUR_OF_DAY, 0);
		cale.set(Calendar.SECOND,0);
		cale.set(Calendar.MINUTE,0);
		Date start = cale.getTime();
		return start;
	}
}
