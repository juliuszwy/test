package cp.pay.mj.utils;

import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.dozer.DozerBeanMapper;

import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

/**
 * 简单封装Dozer, 实现深度转换Bean<->Bean的Mapper.实现:
 *  
 * 1. 持有Mapper的单例. 
 * 2. 返回值类型转换.
 * 3. 批量转换Collection中的所有对象.
 * 4. 区分创建新的B对象与将对象A值复制到已存在的B对象两种函数.
 * 
 */
public class BeanMapper {

	/**
	 * 持有Dozer单例, 避免重复创建DozerMapper消耗资源.
	 */
	private static DozerBeanMapper dozer = new DozerBeanMapper();

	/**
	 * 基于Dozer转换对象的类型.
	 */
	public static <T> T map(Object source, Class<T> destinationClass) {
		return dozer.map(source, destinationClass);
	}

	/**
	 * 基于Dozer转换Collection中对象的类型.
	 */
	public static <T> List<T> mapList(Collection sourceList, Class<T> destinationClass) {
		if(sourceList == null){
			return null;
		}
		List<T> destinationList = Lists.newArrayListWithCapacity(sourceList.size());
		for (Object sourceObject : sourceList) {
			T destinationObject = dozer.map(sourceObject, destinationClass);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	
	/**
	 * 基于Dozer转换Collection中对象的类型.
	 */
	public static <T> Set<T> mapSet(Collection sourceList, Class<T> destinationClass) {
		if(sourceList == null){
			return null;
		}
		Set<T> destinationList = Sets.newHashSetWithExpectedSize(sourceList.size());
		for (Object sourceObject : sourceList) {
			T destinationObject = dozer.map(sourceObject, destinationClass);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	
	/**
	 * 自定义 转换Collection中对象的类型.
	 */
	public static <T> List<T> mapList(Collection sourceList, cp.pay.mj.utils.Convert<T> convert) {
		List<T> destinationList = Lists.newArrayList();
		for (Object sourceObject : sourceList) {
			T destinationObject = map(sourceObject, convert.getClazz());
			convert.convert(sourceObject, destinationObject);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	
	public static <T> Set<T> mapSet(Collection sourceList, cp.pay.mj.utils.Convert<T> convert) {
		Set<T> destinationList = Sets.newHashSet();
		for (Object sourceObject : sourceList) {
			T destinationObject = map(sourceObject, convert.getClazz());
			convert.convert(sourceObject, destinationObject);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}
	


	/**
	 * 基于Dozer将对象A的值拷贝到对象B中.
	 */
	public static void copy(Object source, Object destinationObject) {
		dozer.map(source, destinationObject);
	}
}