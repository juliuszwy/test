package cp.pay.mj.service.account.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cp.pay.mj.dao.ICountLogDao;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.domain.common.PropertyFilter;
import cp.pay.mj.domain.log.CountLog;
import cp.pay.mj.service.BaseService;
import cp.pay.mj.service.account.ICountLogService;
import cp.pay.mj.utils.StringUtil;
@Service("countLogService")
public class CountLogServiceImpl extends BaseService implements ICountLogService {
	@Autowired
	private ICountLogDao countLogDao;

	@Override
	public Map<String, Object> findLogPageList(DataGridModel page) throws Exception {
		User user = getUser();
		if(StringUtil.isEmpty(page.getSort())){
			page.setOrder("desc");
			page.setSort("createDate");
		}
	    Map<String, Object> results = new HashMap<String, Object>();
	    List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
	    if(user.getProperty()==1){
	    	String token = user.getToken()+"";
	    	PropertyFilter filterToken = new PropertyFilter("EQS_token", token);
	    	filters.add(filterToken);
	    }
	    results.put("total", countLogDao.getTotalCount(filters));
	    List<CountLog> logs = countLogDao.findByConditionWithPage(filters, page);
		
	    results.put("rows", logs);
	    return results;
	}

	@Override
	public void saveAll(List<CountLog> logs) {
		countLogDao.save(logs);
	}
}
