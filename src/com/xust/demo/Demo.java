package com.xust.demo;

import java.util.Calendar;
import java.util.Date;

public class Demo {

	public static void main(String[] args) {

		Calendar c = Calendar.getInstance();
		c.set(2015, 1, 1, 1, 1, 1);
		Date d = c.getTime();
		//System.out.println(d);
	}
}
