package cp.pay.mj.service.account;

import net.rubyeye.xmemcached.MemcachedClient;

public interface ILibraryService {
	public void init(MemcachedClient memcachedClient);
	public String getTelByImsi(String imsi);
	public void inserData(String imsi,String tel,Integer pro);
}
