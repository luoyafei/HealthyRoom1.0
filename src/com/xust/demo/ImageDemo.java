package com.xust.demo;

import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ImageDemo {

	public static void main(String[] args) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date sd = (Date) sdf.parse("2013-12-25");
			Timestamp dd = Timestamp.valueOf("2013-12-25 00:00:00");
			
			System.out.println(new java.sql.Date(dd.getTime()));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*BufferedImage bi = new BufferedImage(200, 50, BufferedImage.TYPE_INT_RGB);
		
		Graphics g = bi.getGraphics();
		
		Color c = g.getColor();
		g.setColor(Color.white);
		
		String str = "";
		
		for(int i = 0; i < 10; i++) {
			Random r = new Random();
			str += String.valueOf(r.nextInt(9));
		}
		
		g.fillRect(200, 200, 200, 50);
		
		g.drawString(str, 0, 0);
		
		g.dispose();
		*/
		//System.out.println(str);
		
	}
}
