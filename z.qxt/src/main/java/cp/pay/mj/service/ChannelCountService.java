package cp.pay.mj.service;

import java.util.List;
import java.util.Map;

import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.vo.ChannlePieVo;
import cp.pay.mj.vo.export.ChannelExportVo;

public interface ChannelCountService {
	public void statistics();
	Map<String, Object> findChannelCountPageList(DataGridModel page) throws Exception;
	List<ChannlePieVo> pieDataQuery(int day);
	List<ChannelExportVo> getExportData(DataGridModel page);
}
