package cp.pay.mj.service;

import java.util.Map;

import cp.pay.mj.domain.DataGridModel;

public interface UserCountService {
	public void statistics();
	Map<String, Object> findUserCountPageList(DataGridModel page) throws Exception;
}
