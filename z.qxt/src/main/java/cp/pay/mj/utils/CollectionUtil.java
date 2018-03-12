package cp.pay.mj.utils;

import java.util.Collection;

public class CollectionUtil {
	public static final boolean isBlank(Collection collections){
		if(collections == null || collections.size() == 0) {
			return true;
		}else {
			return false;
		}
	}
	
	
	public static final boolean isNotBlank(Collection collections){
		if(collections == null || collections.size() == 0) {
			return false;
		}else {
			return true;
		}
	}
}
