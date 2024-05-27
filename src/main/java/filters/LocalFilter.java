package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter("/*")
public class LocalFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String lang = request.getParameter("lang");
		if (lang != null) {
			req.getSession().setAttribute("LANG", lang);
		} else {
			// lang là null, kiểm tra giá trị của LANG trong session
			lang = (String) req.getSession().getAttribute("LANG");
			if (lang == null) {
				// Nếu LANG cũng là null, set LANG mặc định là 'vi_VN'
				req.getSession().setAttribute("LANG", "vi_VN");
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Khởi tạo cho Filter nếu cần thiết
	}

	@Override
	public void destroy() {
		// Dọn dẹp tài nguyên khi Filter không còn được sử dụng
	}
}