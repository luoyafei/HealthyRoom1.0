package com.xust.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BackPlanData
 */
@WebServlet("/BackPlanData")
public class BackPlanData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackPlanData() {
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
		
		String gendar = request.getParameter("gendar");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
/*		String BWH_B = request.getParameter("");
		String BWH_W = request.getParameter("BWH_W");
		String BWH_H = request.getParameter("BWH_H");
*/		
		int sex = -1;
		if(gendar.equals("��"))
			sex = 1;
		else
			sex = 0;
		
		if(!height.matches("\\d+") && weight.matches("\\d+")/* && BWH_B.matches("\\d+") && BWH_W.matches("\\d+") && BWH_H.matches("\\d+")*/)
			response.sendRedirect("/HealthyRoom1.0/pages/action.jsp");
//System.out.println(weight);
		double standWeight = (double) (Integer.parseInt(height ) - 100);
		double cha = Double.parseDouble(weight) - standWeight;//��ȡ����׼��������������֮��
		int appraise = 0;//�������ۣ�0��������1�����أ�2����ȷ��� ��3���жȷ��֣�4���ضȷ��֣�
		appraise = (int) ((cha / standWeight) * 100);
//System.out.println(standWeight + ":" + cha + ":" + appraise);
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
			else
				status = 999;
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
			else
				status = 999;
		}		
		
		/*
		 * 
		 * 
		 * ���Ӽƻ�
		 * 
		 * ���˽����ƻ�-�����׶�
����Ҫ�����漰��ȫ������λ���⣬��Ҫ����С��������ϰҲ���شﵽ���ޣ�Ӧ��ѭ�򽥽����Ը��ɵ���Ӧ����Ҫ����ߡ������׶ν����ƻ�����������󸺺ɵ�40%��60%��ÿ����4�Σ�ÿ�δ��1��Сʱ��ÿ������3��4�飬ÿ��6��8�Ρ�
��������һ������ͬ�����ݻ��и��ɵ���ϰ��������Ҫ�н���׼���������ƽ����(�ش�������ͷ��)������ǰƽ��(���Ǽ�)�����嵥�����(�Ŷ�ͷ��)���������(����ͷ��)����10���ӵ������� ���ڶ�������ͬ�����ݻ��и��ɵ���ϰ��������Ҫ�н���׼������������廮��(������)��ƽ�����Է���(�ش�)�����������ƾ�(���Ǽ�������ͷ��)����������(����)����10����������
���������׶εĽ������򲻷��ܲο������Գ����ɷ���ѭ����ϰ���򡢴�����Ѫ���򡢶�����䷨��
����
�������˽����ƻ�-�м��׶�
���������彡�������׶εĶ�����һ����Ҫ���6���£����м��׶εĶ���ͨ��ҲҪ�������6���¡��ڳ����׶εĻ����ϣ�������ϰһЩ���������⣬�м��׶λ�Ҫ�����Ӿֲ������һЩ��ϰ������ϰ������Լ�ǿ����ѡ��ֻ��һ�鼡������һЩ��������������Ҫ�����Է�����ϰ�ش󼡣��þ��������ר����ϰ����ͷ�������öԼ���Ĵ̼���ȼ�����⣬����һЩ��鼡�⣬���ش󼡡����Ǽ��ȣ�����������֮�⣬��Ҫ��Լ����ǰ���С��������ϲ����в����²���������ȡ���ȡ����ȵ���ר�Ŷ�������ϰ��������б����б�����ƣ������С�խ�յĸ��Գŵȡ�
�������ͬʱ���ڽ����м��׶Σ��ķι��ܵĶ�����Ҫ�ر�ע���ǿ�����Ŷ����������ӣ���������������ฺ���Ʊ�Ҫ���ӡ�����������������Ч���������ݻ����Ӷ�������Ĺ�������ȫ����ߡ�
�����м��׶ζ�����ҪĿ���Ƿ�չ����Χ��(Ҳ���ǿ�ͷ)����������һ�׶εĶ����У�ͨ��ʹ�ô󸺺���ϰ����󸺺ɵ�75%��95%��ÿ����3��(����һ��)��ÿ�δ��1.5Сʱ��8-12RMǿ�ȣ��ص������λ����(ͨ��3������)6��8�飬��ͨ������λ����(ͨ��3������)3��4�飬Ҫ��Լ���Ĵ̼��ﵽ���
�������磬�ص�����ز�������м������ƻ�������׼��������Է����������ơ����Գš������ƽ�١����帩������������׺�10���Ӽ������춯����
�����м��׶���ϰ�Թ�������Ϊ����ǿ������������ԣ�ĳһ�鼡��Ⱥ���з�չ�����켡������������һ�׶�Ҫ����ע��������������չ�ķι��ܣ�����ÿ�������ٰ���1������ѵ�����糤�ܻ���Ӿ��
�����м��������������ȶ������򡢽��������򡢸�����������򡢹����������򡢶�����Ϸ����һ�·���
����
�������˽����ƻ�-�߼��׶�
�����������˽����м��׶�ѵ��֮���Ѿ����Գ��ܽϴ�ĸ���ǿ�Ȼ��и�������������̬�õ��������ƣ����ҿ�������ʹ�ø������������������ϰ��Ŀ�ģ����γ����ʺ��Լ���һ��ѵ���������ʱ�򣬼��粻�����ڼ����������ϣ���Լ��ļ����������Ը����ԣ���ʱ���ܽ��뵽������ϰ�ĸ߼��׶��ˡ�
�����߼��׶ε���ϰʱ������Ҫ1�����ϣ�����һ�׶Σ�Ҫ�ﵽ����ҪĿ����3�㣺
����1.���м��׶λ����ϣ����屡����λ�������죬ͬʱ��������������Ҫ��ߡ�
����2.���ù�������ϰ�����Ӽ��⸺�����Ķ����������ѵ����
����3.����ע��ȫ���������������ķι�����ǿ��
����
�����߼��׶ζ��������С��յ㡱�������������򡢽����鷨����˥�߷��򡢽������巨�򡢳������ŷ��򡢶����������� �߼��׶εĸ���ǿ�ȵı仯��Χ�ܴ�ͨ��������ϰ��Ŀ�Ļ��з���������ͬ,��������ϰ���й�������Ϊ����Ϊ�˹��̻��н�һ����չ�м��׶ε�ѵ���ɹ�����ʹ�ô���������ǿ����ϰ���������Сǿ����������ϰ��ÿ���ڿɶ����ĴΣ�ÿ�δ��1.5��Сʱ����Ӫ���ϣ�Ҫ�������ָߵ�����ʳ������̼ˮ�������������� �߼��׶εĽ����ƻ�����֮ǰ׼���(10����)������ƽ����(6-8RM������)����б����(10-12RM������)�����������(8-12RM������)������������������(8-12RM������)��������������(10-12RM������)�����������˶�������ѵ��(��ʮ����)��
����
�����߼��׶ε�ѵ���У���ϰ���ϻ���Ŀ�Ķ�Ԫ���������ǵ�һ��������ϰ����������ϰ�����������֮������ǿ�Ȼ������仯�Ƚϴ�Ҳû�й̶���һ��ģʽ�����԰����Լ�����������������ϰ�̶�ѡ���ʺ��Լ��ĸ߼����彡���ƻ���
		 * 
		 * */
		
		
		/*
		 * 
		 * ��������
		 * 
		 * 
		 * ��һ���ز�������������أ����ƻ����ƣ���������������Ƶȣ�ѡ3��������ѡ�ʵ�������4�飬ÿ��12~15����
����ѵ����б���������������Ծ��ȣ����Ծ�������е�����ȣ�ѡ2��������ÿ�������������ߣ���3~4�顣(����Ƚ�ʹ�࣬Ҫ���)
�ܶ����첲����ͷ����������٣�������٣�����ͷ��(���徱������죬��е��ѹ���Ʊۻ�����)����������Ը����㽡���������ѡ�񣬶�ͷ��ͷ����ѡ2��������4��ÿ��12~15����
����ѵ��ͬ�ϣ������Ե�����ѵ��˳�����������ʹû�лָ������ʵ�������
�������ȣ���Ҫ����С�ȣ���С�������Ǹ������е����4�� ÿ��15��
���ģ����� ����е��������еƽ��(�������������е�Ļ�)����4�� ÿ��15��
����ѵ��ͬ��
���壺�粿�������ƾ٣������ƽ�٣�4��ÿ��12~15��
����ѵ��ͬ��
		 * 
		 * */
		
		
		
		
		/*
		 * 
		 * ���ʻ���
		 * ��һ���ܲ�+��е����
�������Ľ��������ʷ����ܲ���Ϊ����֬����������ȼ�գ��Ӹ����ﵽ���ʵ�Ŀ�ģ�һ��ÿ���ܲ�����45-60����֮��Ч����ѣ���е������Ϊ�����ĳһ��λ�����ʣ�����������ġ�
�ܶ���������+��е����
������Ҳ�������˶���һ�֣��˶�ǿ�Ⱥ�ȼ֬Ч��Ҳ��ѷ���ܲ�����ʱ��о��ܲ������ˣ�����ѡ��ѡ�ý����������档������һ��ָ���ǲ����١�����١������ٵȽ������Ĺ�����Ŀ�˶����ʺϸ���������Ⱥ����ϰ��
���������գ���Ϣ��
��ν����Ϣ������ȫ����Ϣ����ָ�����ڹ�԰֮��ĳ�����һЩǿ�Ƚ�С���˶�������ߡ�����֮����������ֻ������Ҳ�����ڼ�������ǽ�������һЩ�򵥵��٤��������ҪĿ�����ڷ�������ļ��⣬������õõ���Ϣ����
���ģ����е�������
���е����Ǽ������������������˶�֮һ������Ҫ���ص��������ջ�Ծ����϶��е������������ڽ���ʱ��֪�������˷����������֬����ȼ���ʣ��ڼ����˶���Ŀ��ʼ�ն������ܻ�ӭ���˶�֮һ����
���壺�������+���ܡ���
�������Ҳ�ǱȽ��ܹ��Ůʿ��ӭ���˶�֮һ�����Ǿ����ԱȽϴ��˶�ǿ��Ҳ���У�����һ�ڿεĸ������󣬻�������˶�����û�ﵽ���ʵ�Ч����������õ�ѡ�����ȥ�ܲ����Ͻ���һЩ������ϰ�����������ڵ�֬��ȼ���ٶȡ�
		 * 
		 * 
		 * */
		
		
 		
		/*{"gendar":"aa","height":"sdf","":"","":"","":"","":""}*/
		
		/*String backdata = "{\"gendar\":\"" + gendar + "\",\"height\":\"" + height + "\"," + "\"weight\":\"" + weight + "\",\"BWH_B\":\"" + BWH_B + "\","
				+ "\"BWH_W\":\"" + BWH_W+ "\",\"BWH_H\":\"" + BWH_H + "\"}";*/
		
		String data = "{\"status\":\"" + status + "\",\"sex\":\"" + sex + "\"}";
System.out.println(data);
		
		PrintWriter out = response.getWriter();
		out.print(data);
		
		
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}