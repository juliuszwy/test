package cp.pay.mj.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cp.pay.mj.utils.Constants;
public class BrowserCheckFilter implements Filter {
	private List<String> whiteExploreList = new ArrayList<String>();
	
	@Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String explore = request.getHeader("User-Agent").trim();
//		String requestStr = request.getServletPath().trim();
	/*	for (String str : whiteExploreList) {
			if (!explore.contains(str)) {
				response.sendRedirect(request.getContextPath() + "/error/explore");
				return;
			}
		}*/

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		String explores[] = Constants.ADMIN_EXPLORER.split("@");
		whiteExploreList.addAll(Arrays.asList(explores));
	}
}
