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
		double cha = Double.parseDouble(weight) - standWeight;//��ȡ����׼��������������֮��
		int appraise = 0;//�������ۣ�0��������1�����أ�2����ȷ��� ��3���жȷ��֣�4���ضȷ��֣�
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
		 * ʵ������ռ��׼���صİٷ�������10%Ϊ������Χ������10%--20%Ϊ���أ�����20%Ϊ���֣�С��10%--20%Ϊ���ݣ�С��20%Ϊ�������ݡ�
		 * 
		 * */
		
/*		switch(status) {
			case  -4:
				System.out.println("��������");
				break;
			case -3:
				System.out.println("�ж�����");
				break;
			case -2:
				System.out.println("�������");
				break;
			case -1:
				System.out.println("����");
				break;
			case  0:
				System.out.println("����");
				break;
			case 1:
				System.out.println("����");
				break;
			case 2:
				System.out.println("��ȷ���");
				break;
			case 3:
				System.out.println("�жȷ���");
				break;
			case 4:
				System.out.println("�ضȷ���");
				break;
				default:
					break;
		}*/
	}
}
