package cp.pay.mj.utils;

import java.lang.reflect.ParameterizedType;

public abstract class Convert<T> {
	public abstract void convert(Object source, T destinationObject);
	
	@SuppressWarnings("unchecked")
	public Class<T> getClazz(){
		return (Class<T>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}
}
