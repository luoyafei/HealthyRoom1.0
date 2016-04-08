package com.xust.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.xust.DAO.UserManager;
import com.xust.bean.User;

/**
 * Servlet implementation class DealUploadPicture
 */
@WebServlet("/DealUploadPicture")
@MultipartConfig
public class DealUploadPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealUploadPicture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*String file = request.getParameter("file");*/
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
/*		ServletContext context = this.getServletContext();
		String real = context.getRealPath("/DealUploadPicture");*/
		
		if(session == null || session.getAttribute("userInfo")==null) {
			response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
			//return;
		}
		User u = (User) session.getAttribute("userInfo");
		String userId = String.valueOf(u.getUserId());
		String userPhotoName = u.getUsername();
		
		//String fileUrl = "G:\\Eclipse\\Project\\EclipseEEProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\HealthyRoom1.0\\userassets\\userPhoto\\";
		String fileUrl = "G:\\Eclipse\\Project\\EclipseEEProject\\HealthyRoom1.0\\WebContent\\userassets\\userPhoto\\" + userPhotoName + ".jpg";
		File f = new File(fileUrl);
		OutputStream os = new FileOutputStream(f);
		
		final Part filePart = request.getPart("file");
		
		InputStream is = filePart.getInputStream();
		byte[] b = new byte[1024];
		while(is.read(b) != -1) {
			os.write(b);
		}
		
		/*String photourl = "/HealthyRoom1.0/userassets/userPhoto/" + userPhotoName + ".jpg";*/
		String photourl = userPhotoName + ".jpg";
		os.flush();
		os.close();
		is.close();
		
		//将此图片插入用户的表里
		boolean insertResult = UserManager.getInstance().insertUserPhoto(userId, photourl);
		if(insertResult)
			System.out.println("图片上传成功");
		else
			System.out.println("图片上传失败");
		
		response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/healthyforum.jsp");
		//return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
