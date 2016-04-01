package com.xust.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xust.DBPool.MyDataSource;

@WebServlet("/demo")
public class demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public demo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		BufferedImage bi = new BufferedImage(120, 30, BufferedImage.TYPE_INT_RGB);
		Graphics g = bi.getGraphics();
		Color c = g.getColor();
		String[] arr = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
		String str = "";
		for(int i = 0; i < 6; i++) {
			Random r = new Random();
			str += arr[r.nextInt(61)];
		}
		g.setColor(Color.white);
		g.setFont(new Font(str, Font.BOLD, 24));
		g.drawString(str, 0, 20);
		g.setColor(Color.yellow);
		
		for(int i = 1; i <= 2; i++) {
			g.drawLine(0, 10*i, 120, 10*i);
		}
		 response.setContentType("image/jpeg");//等同于response.setHeader("Content-Type", "image/jpeg");
		 //设置响应头控制浏览器不要缓存
		 response.setDateHeader("expries", -1);
		 response.setHeader("Cache-Control", "no-cache");
		 response.setHeader("Pragma", "no-cache");
		g.setColor(c);
		
		HttpSession identifyCode = request.getSession(true);
		identifyCode.setAttribute("code", str);
		//g.dispose();
		OutputStream os = response.getOutputStream();
		ImageIO.write(bi, "JPEG", os);
//		System.out.println(str);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
