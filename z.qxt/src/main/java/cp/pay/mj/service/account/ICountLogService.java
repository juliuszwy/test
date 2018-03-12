package cp.pay.mj.service.account;
import java.util.List;
import java.util.Map;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.log.CountLog;
public interface ICountLogService {
	void saveAll(List<CountLog> logs);
	Map<String, Object> findLogPageList(DataGridModel page) throws Exception;
}
