package cp.pay.mj.service;
import java.util.Map;
import cp.pay.mj.domain.DataGridModel;

public interface AgentCountService {
	public void statisticsDay();
	public void statisticsMonth();
	Map<String, Object> findAgentCountPageList(DataGridModel page) throws Exception;
}
