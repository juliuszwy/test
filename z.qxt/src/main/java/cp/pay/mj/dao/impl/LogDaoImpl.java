package cp.pay.mj.dao.impl;
import org.springframework.stereotype.Repository;
import cp.pay.mj.dao.ILogDao;
import cp.pay.mj.domain.log.RequestLog;
@Repository("logDao")
public class LogDaoImpl extends BaseHibernateDaoImpl<RequestLog, String> implements ILogDao{
	
}
