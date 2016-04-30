package com.xust.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

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
 * Servlet implementation class DealBusinessPublishGymInfo
 */
@WebServlet("/DealBusinessPublishGymInfo")
@MultipartConfig
public class DealBusinessPublishGymInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DealBusinessPublishGymInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html");
		
		String gymName = request.getParameter("gymName");
		String gymAddr = request.getParameter("gymAddr");
		String gymPrice = request.getParameter("gymPrice");
		String gymTel = request.getParameter("gymTel");
		String gymIntroduce = request.getParameter("gymIntroduce");
		
		ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
		
		InputStream[] inputs = new InputStream[3];
		int i = 0;
		for(Iterator<Part> items = parts.iterator(); items.hasNext();) {
			Part part = items.next();
			String HeaderName = part.getHeader("content-disposition");
			if(HeaderName.split(";").length > 2) {
				inputs[i] = part.getInputStream();
				i++;
			}
		}
		
		String[] photoUrls = new String[3];//此为要存入数据库的图片的地址数组
		
		OutputStream[] outputs = new OutputStream[3];
		for(int j = 0; j < inputs.length; j++) {
			String fileurl = "G:\\Eclipse\\Project\\EclipseEEProject\\HealthyRoom1.0\\WebContent\\business_healthyroomUp\\" + gymTel + j + ".jpg";
			/*photoUrls[j] = "/HealthyRoom1.0/business_healthyroomUp/" + gymName + j + ".jpg";*/
			photoUrls[j] = gymTel + j + ".jpg";
			File f = new File(fileurl);
			outputs[j] = new FileOutputStream(f);
		}
//System.out.println(outputs.length + "output");		
//out.println(gymName + ","+gymAddr + "," + gymPrice + "," + gymTel + "," + gymIntroduce);
		
		byte[] b0 = new byte[1024];
		byte[] b1 = new byte[1024];
		byte[] b2 = new byte[1024];
		int cont0 = inputs[0].read(b0);
		int cont1 = inputs[1].read(b1);
		int cont2 = inputs[2].read(b2);
		while(cont0 != -1) {
			//out.print(cont0);
			outputs[0].write(b0);
			cont0 = inputs[0].read(b0);
		}
		//out.println("==1");
		while(cont1 != -1) {
			//out.print(cont1);
			outputs[1].write(b1);
			cont1 = inputs[1].read(b1);
		}
		//out.println("==2");
		while(cont2 != -1) {
			//out.print(cont2);
			outputs[2].write(b2);
			cont2 = inputs[2].read(b2);
		}
		//out.println("==3");
		
		for(int i1 = 0; i1 < 3; i1++) {
			inputs[i1].close();
			outputs[i1].flush();
			outputs[i1].close();
		}
		
		HttpSession session = request.getSession(true);
		User u = (User)session.getAttribute("userInfo");
		int businessId = u.getUserId();
		
		boolean insertResult = UserManager.getInstance().SaveBusinessPublishHealthyRoomInfo(businessId, gymName, gymAddr, gymPrice, gymTel, gymIntroduce, photoUrls[0], photoUrls[1], photoUrls[2]);
		//response.sendRedirect("/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp");
		
		if(insertResult) {
System.out.println("商家发布健身房信息成功！");
			response.sendRedirect("/HealthyRoom1.0/pages/public_visit/show_healthyroom_info.jsp");
			//response.sendRedirect("/HealthyRoom1.0/index.jsp");
			//this.getServletConfig().getServletContext().getRequestDispatcher("/HealthyRoom1.0/pages/healthyforum/show_healthyroom_info.jsp").forward(request, response);
			return;
		} else {
System.out.println("商家发布健身房信息失败！");
			response.sendRedirect("/HealthyRoom1.0/pages/business_authority/business_pulish_healthyroom_page.jsp");
			return;
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
