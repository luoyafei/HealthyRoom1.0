package com.xust.demo;

import java.util.Calendar;
import java.util.Date;

public class Demo {

	public static void main(String[] args) {

		/*Calendar c = Calendar.getInstance();
		c.set(2015, 1, 1, 1, 1, 1);
		Date d = c.getTime();
		//System.out.println(d);
		 * 
*/		
		String height = "175";
		String weight = "55";
		double standWeight = (double) (Integer.parseInt(height ) - 100);
		double cha = Double.parseDouble(weight) - standWeight;//获取到标准体重与自身体重之差
		int appraise = 0;//进行评价（0，正常；1，超重；2，轻度肥胖 ；3，中度肥胖；4，重度肥胖）
		appraise = (int) ((cha / standWeight) * 100);
		
		int status = 0;
		if(appraise >= 0) {
			if(appraise <= 10)
				status = 0;
			else if(appraise > 10 && appraise <= 20)
				status = 1;
			else if(appraise > 20 && appraise <= 30)
				status = 2;
			else if(appraise > 30 && appraise <= 50)
				status = 3;
			else if(appraise > 50)
				status = 4;
		} else {
			if(appraise >= -10)
				status = 0;
			else if(appraise < -10 && appraise >= -20)
				status = -1;
			else if(appraise < -20 && appraise >= -30)
				status = -2;
			else if(appraise < -30 && appraise >= -50)
				status = -3;
			else if(appraise < -50)
				status = -4;
		}
		
//System.out.println(status);
		/*
		 * 实测体重占标准体重的百分数上下10%为正常范围，大于10%--20%为过重；大于20%为肥胖；小于10%--20%为消瘦；小于20%为明显消瘦。
		 * 
		 * */
		
/*		switch(status) {
			case  -4:
				System.out.println("严重瘦弱");
				break;
			case -3:
				System.out.println("中度瘦弱");
				break;
			case -2:
				System.out.println("轻度瘦弱");
				break;
			case -1:
				System.out.println("瘦弱");
				break;
			case  0:
				System.out.println("正常");
				break;
			case 1:
				System.out.println("超重");
				break;
			case 2:
				System.out.println("轻度肥胖");
				break;
			case 3:
				System.out.println("中度肥胖");
				break;
			case 4:
				System.out.println("重度肥胖");
				break;
				default:
					break;
		}*/
	}
}
