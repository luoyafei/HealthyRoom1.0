package com.xust.demo;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageDemo {

	public static void main(String[] args) {
		
		BufferedImage bi = new BufferedImage(200, 50, BufferedImage.TYPE_INT_RGB);
		
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
		
		//System.out.println(str);
		
	}
}
