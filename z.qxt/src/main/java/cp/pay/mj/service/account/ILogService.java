package cp.pay.mj.service.account;

import java.util.List;
import java.util.Map;

import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.log.CountLog;
import cp.pay.mj.domain.log.RequestLog;

public interface ILogService {
	public void insertLog(RequestLog log);
	Map<String, Object> findLogPageList(DataGridModel page) throws Exception;
	List<CountLog> countLogByDay()throws Exception;
}
