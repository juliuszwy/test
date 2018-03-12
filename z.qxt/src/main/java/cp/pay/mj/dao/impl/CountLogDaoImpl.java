package cp.pay.mj.dao.impl;
import org.springframework.stereotype.Repository;

import cp.pay.mj.dao.ICountLogDao;
import cp.pay.mj.domain.log.CountLog;
@Repository("countLogDao")
public class CountLogDaoImpl extends BaseHibernateDaoImpl<CountLog, String> implements ICountLogDao{
	
}
