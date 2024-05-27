package controller;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import model.Account;
import service.IAccountService;
import service.impl.AccountService;

@WebServlet("/SaveProfileServlet")
public class SaveProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAccountService service;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.service = new AccountService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/WEB-INF/web/profile.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String fileName = null;
		try {
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Configure a repository (to ensure a secure temp location is used)
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Parse the request
			List<FileItem> items = upload.parseRequest(request);
			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			HashMap<String, String> fields = new HashMap<>();
			while (iter.hasNext()) {
				FileItem item = iter.next();
				if (item.isFormField()) {
					fields.put(item.getFieldName(), item.getString());
					String key = item.getFieldName();
					String value = item.getString();
					System.out.println("key: " + key);
					System.out.println("value: " + value);
				} else {
					fileName = item.getName();
					System.out.println("fileName: " + fileName);
					if (fileName == null || fileName.equals("")) {
						
					} else {
						Path path = Paths.get(fileName);
						String storePath = servletContext.getRealPath("/uploads");
						File uploadFile = new File(storePath + "/" + path.getFileName());

						// Kiểm tra nếu file chưa tồn tại, thì mới ghi file
						if (!uploadFile.exists()) {
							item.write(uploadFile);
							System.out.println("File mới đã được lưu tại: " + storePath + "/" + path.getFileName());
						} else {
							System.out.println(
									"File đã tồn tại, sử dụng file hiện có: " + storePath + "/" + path.getFileName());
							
						}
					}
				}
			}
			String email = request.getParameter("email");
			String name = fields.get("name");
			String address = fields.get("address");
			String phone = fields.get("phone");
			String action = fields.get("action");
			HttpSession session = request.getSession(true);
			if (action != null && !action.equals("")) {
					if (this.service.updateAccount(email, name, address, phone, fileName) > 0) {
						session.setAttribute("success", "Update success!");
						Account account = this.service.getAccountByEmail(email);
						session.setAttribute("account", account);
					} else {
						session.setAttribute("error", "Update fail!");
					}
					request.getRequestDispatcher("/WEB-INF/web/profile.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}