package cp.pay.mj.utils;

import java.util.Locale;

public class LocaleHolder
{
  private static ThreadLocal<Locale> LOCALE_CONTEXT = new ThreadLocal();

  public static Locale getLocale() {
    return (Locale)LOCALE_CONTEXT.get();
  }

  public static void setLocale(Locale locale) {
    if (locale != null)
      LOCALE_CONTEXT.set(locale);
  }

  public static void removeLocale()
  {
    LOCALE_CONTEXT.remove();
  }
}