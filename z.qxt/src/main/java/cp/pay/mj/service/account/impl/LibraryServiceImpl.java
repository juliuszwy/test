package cp.pay.mj.service.account.impl;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.TimeoutException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cp.pay.mj.dao.ILibraryDao;
import cp.pay.mj.domain.Library;
import cp.pay.mj.service.account.ILibraryService;
import cp.pay.mj.utils.CollectionUtil;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
@Service("libraryService")
public class LibraryServiceImpl implements ILibraryService {
	@Autowired
	private ILibraryDao libraryDao;
	
	public void init(MemcachedClient memcachedClient){
		System.out.println("111");
		List<Library> list = libraryDao.findAll();
		System.out.println("222");
		for(Library l:list){
			try {
				memcachedClient.set(l.getImsi(), 0, l.getPhone());
			} catch (TimeoutException | InterruptedException | MemcachedException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public String getTelByImsi(String imsi) {
		List<String> list = libraryDao.findByHql("select phone from Library where imsi=?", imsi);
		if(CollectionUtil.isBlank(list))
			return null;
		return list.get(0);
	}

	@Override
	public void inserData(String imsi, String tel, Integer pro) {
		Library library = new Library();
		library.setImsi(imsi);
		library.setPhone(tel);
		library.setPro(0);
		libraryDao.save(library);
	}
	
}
