package cp.pay.mj.utils;

import java.util.Map;

public class MapUtil {
	public static boolean isBlank(Map map	){
		if(map == null || map.isEmpty()){
			return true;
		}else {
			return false;
		}
	}
	
	public static boolean isNotBlank(Map map){
		return !isBlank(map);
	}
	
}
