package cp.pay.mj.dao.impl;
import org.springframework.stereotype.Repository;

import cp.pay.mj.dao.ILibraryDao;
import cp.pay.mj.domain.Library;
@Repository("libraryDao")
public class LibraryDaoImpl extends BaseHibernateDaoImpl<Library, String> implements ILibraryDao{
	
}
