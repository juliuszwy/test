package cp.pay.mj.utils;

import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.convert.converter.Converter;

import cp.pay.mj.utils.CollectionUtil;

public class StringUtil extends org.springframework.util.StringUtils
{
  private static final Pattern DIGIT_PATTERN = Pattern.compile("([0-9]+(\\.[0-9]+)?)+");
  public static final char[] NUMBERS;
  public static final char[] LOWER_CASE_LETTERS;
  public static final char[] UPPER_CASE_LETTERS;
  public static final char[] NUMBERS_LETTERS;
  private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

	private static SimpleDateFormat sdf3 = new SimpleDateFormat("yyyyMMdd");
	
	private static SimpleDateFormat sdf4 = new SimpleDateFormat("yyyyMMddHHmmss");
	
	private static SimpleDateFormat sdf5 = new SimpleDateFormat("yyyy-MM-dd HH");

  static
  {
    int index = 0;
    NUMBERS = new char[10];
    for (char i = '0'; i <= '9'; i = (char)(i + '\001')) {
      NUMBERS[(index++)] = i;
    }
    index = 0;
    LOWER_CASE_LETTERS = new char[26];
    for (char i = 'a'; i <= 'z'; i = (char)(i + '\001')) {
      LOWER_CASE_LETTERS[(index++)] = i;
    }
    index = 0;
    UPPER_CASE_LETTERS = new char[26];
    for (char i = 'A'; i <= 'Z'; i = (char)(i + '\001')) {
      UPPER_CASE_LETTERS[(index++)] = i;
    }
    NUMBERS_LETTERS = new char[NUMBERS.length + LOWER_CASE_LETTERS.length + UPPER_CASE_LETTERS.length];
    System.arraycopy(NUMBERS, 0, NUMBERS_LETTERS, 0, NUMBERS.length);
    System.arraycopy(LOWER_CASE_LETTERS, 0, NUMBERS_LETTERS, NUMBERS.length, LOWER_CASE_LETTERS.length);
    System.arraycopy(UPPER_CASE_LETTERS, 0, NUMBERS_LETTERS, NUMBERS.length + LOWER_CASE_LETTERS.length, UPPER_CASE_LETTERS.length);
  }
  public static String valueOf(Object obj) {
		String str = (obj == null || "null".equalsIgnoreCase(obj.toString().trim())) ? "" : obj.toString();
		return str;
	}
  public static boolean isDigit(String value, boolean ignoreSign)
  {
    String use = value;
    if (isEmpty(use)) {
      return false;
    }
    if ((ignoreSign) && ((use.startsWith("+")) || (use.startsWith("-")))) {
      use = use.substring(1);
    }
    return DIGIT_PATTERN.matcher(use).matches();
  }

  public static boolean isDigit(String value) {
    return isDigit(value, false);
  }

  public static String replaceNullString(String value, String replaceString)
  {
    return value == null ? replaceString : value;
  }

  public static String replaceNullString(String value)
  {
    return replaceNullString(value, "");
  }

  public static String safeToTrim(String str) {
    return str == null ? null : str.trim();
  }

  public static String generateRandomSequence(char[] sequenceArr, int length)
  {
    SecureRandom rnd = new SecureRandom(UUID.randomUUID().toString().getBytes());
    StringBuilder sequence = new StringBuilder(length);
    for (int i = 0; i < length; i++) {
      sequence.append(sequenceArr[rnd.nextInt(sequenceArr.length)]);
    }
    return sequence.toString();
  }

  public static String generateNumberLetterSequence(int length) {
    return generateRandomSequence(NUMBERS_LETTERS, length);
  }

  public static List<String> getLocalHostIps() {
    return getLocalHostIps(false);
  }
  public static List<String> getLocalHostIps(boolean needIpV6) {
    Enumeration allNetInterfaces = null;
    try {
      allNetInterfaces = NetworkInterface.getNetworkInterfaces();
    } catch (SocketException e) {
      return Collections.emptyList();
    }

    List ips = new LinkedList();
    while (allNetInterfaces.hasMoreElements()) {
      NetworkInterface netInterface = (NetworkInterface)allNetInterfaces.nextElement();
      Enumeration addresses = netInterface.getInetAddresses();
      while (addresses.hasMoreElements()) {
        InetAddress ip = (InetAddress)addresses.nextElement();
        if ((ip == null) || (
          (!needIpV6) && ((ip instanceof Inet6Address)))) continue;
        ips.add(ip.getHostAddress());
      }

    }

    return Collections.unmodifiableList(ips);
  }

  public static String collectionToString(Collection<?> collection, String delimiter) {
    return collectionToString(collection, delimiter, "", "");
  }

  public static <E> String collectionToString(Collection<E> collection, String delimiter, String prefix, String suffix)
  {
    return collectionToString(collection, delimiter, prefix, suffix, (Converter<E, String>)NoStringTargetConverter.getNoStringTargetConverter());
  }

  public static <E> String collectionToString(Collection<E> collection, String delimiter, String prefix, String suffix, Converter<E, String> converter) {
    if (CollectionUtil.isBlank(collection)) {
      return null;
    }
    StringBuilder result = new StringBuilder();
    Iterator it = collection.iterator();
    while (it.hasNext()) {
      result.append(prefix).append((String)converter.convert((E) it.next())).append(suffix);
      if (it.hasNext()) {
        result.append(delimiter);
      }
    }
    return result.toString();
  }

  public static boolean safeEqualsIgnoreCase(CharSequence str1, CharSequence str2) {
    if ((str1 == null) && (str2 == null)) {
      return true;
    }
    if ((str1 == null) || (str2 == null)) {
      return false;
    }
    return str1.toString().equalsIgnoreCase(str2.toString());
  }

  public static int length(String str) {
    return str == null ? 0 : str.length();
  }

  public static String safeToLowerCase(String str) {
    return safeToLowerCase(str, null);
  }

  public static String safeToLowerCase(String str, String ifNullDefaultValue) {
    return str == null ? ifNullDefaultValue : str.toLowerCase();
  }

  public static boolean safeStartWith(String originalString, String startWithString) {
    return safeStartWith(originalString, startWithString, true);
  }

  public static boolean safeStartWith(String originalString, String startWithString, boolean ignoreCase) {
    if ((originalString == null) || (startWithString == null)) {
      return false;
    }
    if (ignoreCase) {
      return safeToLowerCase(originalString).startsWith(safeToLowerCase(startWithString));
    }
    return originalString.startsWith(startWithString);
  }

  public static boolean safeEndWith(String originalString, String endWithString)
  {
    return safeEndWith(originalString, endWithString, true);
  }

  public static boolean safeEndWith(String originalString, String endWithString, boolean ignoreCase) {
    if ((originalString == null) || (endWithString == null)) {
      return false;
    }
    if (ignoreCase) {
      return safeToLowerCase(originalString).endsWith(safeToLowerCase(endWithString));
    }
    return originalString.endsWith(endWithString);
  }

  public static String getPackagePath(Class<?> cls)
  {
    return getPackagePath(cls, false);
  }

  public static String getPackagePath(Class<?> cls, boolean includeClassName)
  {
    if (cls == null) {
      return null;
    }
    String path = cls.getName().replaceAll("\\.", "/");
    if (includeClassName) {
      return path;
    }
    int lastStart = path.lastIndexOf("/");
    return lastStart > -1 ? path.substring(0, lastStart) : path;
  }

  public static boolean isEmpty(Object str) {
    return (str == null) || ("".equals(str));
  }

  public static Locale parseLocaleString(String localeString) {
    if (isEmpty(localeString)) {
      return null;
    }
    String[] parts = tokenizeToStringArray(localeString, "_ ", false, false);
    String language = parts.length > 0 ? parts[0] : "";
    String country = parts.length > 1 ? parts[1] : "";
    String variant = "";
    if (parts.length >= 2) {
      int endIndexOfCountryCode = localeString.indexOf(country) + country.length();
      variant = safeToTrim(localeString.substring(endIndexOfCountryCode));
      if (variant.startsWith("_")) {
        variant = trimLeadingCharacter(variant, '_');
      }
    }
    return language.length() > 0 ? new Locale(language, country, variant) : null;
  }
	public static Date stringToDate(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}
		Date d = null;
		try {
			d = sdf.parse(str);
		} catch (ParseException e) {
//			e.printStackTrace();
			throw new RuntimeException("日期格式转换错误:" + str);
		}
		return d;
	}

	public static String dateToString(Date date) {
		// System.out.println("here");
		if (date == null) {
			return " ";
		}
		return sdf.format(date);
	}
	
	
	public static Date stringToDateFullNumber(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}
		Date d = null;
		try {
			d = sdf4.parse(str);
		} catch (ParseException e) {
//			e.printStackTrace();
			throw new RuntimeException("日期格式转换错误:" + str);
		}
		return d;
	}

	public static String dateToStringWithFullNumber(Date date) {
		// System.out.println("here");
		if (date == null) {
			return " ";
		}
		return sdf4.format(date);
	}
	

	public static Date stringToDateHour(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}
		Date d = null;
		try {
			d = sdf5.parse(str);
		} catch (ParseException e) {
//			e.printStackTrace();
			throw new RuntimeException("日期格式转换错误:" + str);
		}
		return d;
	}

	public static String dateToStringWithHour(Date date) {
		// System.out.println("here");
		if (date == null) {
			return " ";
		}
		return sdf5.format(date);
	}

	public static String dateToStringWithDate(Date date) {
		if (date == null) {
			return null;
		}
		return sdf2.format(date);
	}

	public static String dateToStringWithNumber(Date date) {
		if (date == null) {
			return " ";
		}
		return sdf3.format(date);
	}

	public static Date stringToDateWithDate(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}
		Date d = null;
		try {
			d = sdf2.parse(str);
		} catch (ParseException e) {
//			e.printStackTrace();
			throw new RuntimeException("日期格式转换错误");
		}
		return d;
	}

	public static Date stringToDateWithNumber(String str) {
		if (StringUtils.isBlank(str)) {
			return null;
		}
		Date d = null;
		try {
			d = sdf3.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
			throw new RuntimeException("日期格式转换错误");
		}
		return d;
	}

}