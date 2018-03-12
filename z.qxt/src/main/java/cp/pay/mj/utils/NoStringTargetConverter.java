package cp.pay.mj.utils;

import org.springframework.core.convert.converter.Converter;

public class NoStringTargetConverter<S>
  implements Converter<S, String>
{
  public static final NoStringTargetConverter INSTANCE = new NoStringTargetConverter();

  public String convert(Object s) {
    if (s == null) {
      return "";
    }
    return s.toString();
  }

  public static <S> NoStringTargetConverter<S> getNoStringTargetConverter()
  {
    return INSTANCE;
  }
}