package cp.pay.mj.service.account.impl;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cp.pay.mj.dao.ILogDao;
import cp.pay.mj.domain.DataGridModel;
import cp.pay.mj.domain.account.User;
import cp.pay.mj.domain.common.PropertyFilter;
import cp.pay.mj.domain.log.CountLog;
import cp.pay.mj.domain.log.RequestLog;
import cp.pay.mj.service.BaseService;
import cp.pay.mj.service.account.ILogService;
import cp.pay.mj.utils.DateTimeUtil;
import cp.pay.mj.utils.StringUtil;
@Service("logService")
public class LogServiceImpl extends BaseService implements ILogService {
	@Autowired
	private ILogDao logDao;

	@Override
	public void insertLog(RequestLog log) {
		try {
			logDao.save(log);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Object> findLogPageList(DataGridModel page) throws Exception {
		User user = getUser();
		if(StringUtil.isEmpty(page.getSort())){
			page.setOrder("desc");
			page.setSort("createDate");
		}
		
	    Map<String, Object> results = new HashMap<String, Object>();
	    List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(request);
	    if(request.getParameter("filter_GED_createDate").equals("")&&request.getParameter("filter_LTD_createDate").equals("")){
	    	PropertyFilter filterGD = new PropertyFilter("GED_createDate", StringUtil.dateToStringWithDate(new Date(new Date().getTime())));
	    	filters.add(filterGD);
	    }
	    
	    if(user.getProperty()==1){
	    	String token = user.getToken()+"";
	    	PropertyFilter filterToken = new PropertyFilter("EQS_token", token);
	    	filters.add(filterToken);
	    }
	    results.put("total", logDao.getTotalCount(filters));
	    List<RequestLog> logs = logDao.findByConditionWithPage(filters, page);
		
	    results.put("rows", logs);
	    return results;
	}

	@Override
	public List<CountLog> countLogByDay() throws Exception {
		List<CountLog> list = logDao.findByHqlNoDistinct("select new cp.pay.mj.domain.log.CountLog(w.token,"
				+ "count(*),sum(CASE WHEN w.status=0 THEN 1 ELSE 0 END),"
				+ "sum(CASE WHEN w.code=0 and w.status=0 THEN 1 ELSE 0 END),"
				+ "sum(CASE WHEN  w.status=105 THEN 1 ELSE 0 END)"
				+ ") from RequestLog w where w.createDate>=? and w.createDate<?"
				+ "group by w.token", DateTimeUtil.getpreDayBreak(),DateTimeUtil.getNowDayBreak());
		Date date = DateTimeUtil.getpreDayBreak();
		for(CountLog c:list){
			c.setCreateDate(date);
		}
		return list;
	}
}
