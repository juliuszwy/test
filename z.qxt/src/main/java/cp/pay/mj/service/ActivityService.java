package cp.pay.mj.service;
import java.util.Map;
import cp.pay.mj.domain.DataGridModel;

public interface  ActivityService<E>{
	int saveResult(E e)throws Exception;
	E save(E e)throws Exception;
	Map<String, Object> findPageList(DataGridModel page);
	E getByActivityId(String id);
	E findCurrentActivity();
}
