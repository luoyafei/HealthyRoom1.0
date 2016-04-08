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
		if(gendar.equals("男"))
			sex = 1;
		else
			sex = 0;
		
		if(!height.matches("\\d+") && weight.matches("\\d+")/* && BWH_B.matches("\\d+") && BWH_W.matches("\\d+") && BWH_H.matches("\\d+")*/)
			response.sendRedirect("/HealthyRoom1.0/pages/action.jsp");
//System.out.println(weight);
		double standWeight = (double) (Integer.parseInt(height ) - 100);
		double cha = Double.parseDouble(weight) - standWeight;//获取到标准体重与自身体重之差
		int appraise = 0;//进行评价（0，正常；1，超重；2，轻度肥胖 ；3，中度肥胖；4，重度肥胖）
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
		 * 瘦子计划
		 * 
		 * 瘦人健身计划-初级阶段
　　要可以涉及到全身各部位肌肉，主要是中小重量，练习也不必达到极限，应该循序渐进，对负荷的适应能力要逐步提高。初级阶段健身计划不妨采用最大负荷的40%到60%、每星期4次，每次大概1个小时，每个动作3到4组，每组6到8次。
　　星期一、四做同样内容还有负荷的练习。动作主要有健身准备活动，哑铃平卧推(胸大肌与肱三头肌)、哑铃前平举(三角肌)、哑铃单臂弯举(肱二头肌)、哑铃深蹲(股四头肌)还有10分钟的拉伸活动。 星期二、五做同样内容还有负荷的练习。动作主要有健身准备活动，俯身哑铃划船(背阔肌)、平卧仰卧飞鸟(胸大肌)、坐姿哑铃推举(三角肌与肱三头肌)、仰卧起坐(腹肌)还有10分钟拉伸活动。
　　初级阶段的健身法则不妨能参考渐进性超负荷法则、循环练习法则、大量充血法则、动作多变法则。
　　
　　瘦人健身计划-中级阶段
　　在哑铃健身初级阶段的锻炼，一般人要大概6个月，在中级阶段的锻炼通常也要持续大概6个月。在初级阶段的基础上，除了练习一些基本动作外，中级阶段还要逐步增加局部肌肉的一些练习，让练习的针对性加强，多选择只有一块肌肉参与的一些孤立动作，如主要用仰卧飞鸟练习胸大肌，用颈后臂屈伸专门练习肱三头肌等来让对肌肉的刺激深度加深。另外，对于一些大块肌肉，如胸大肌、三角肌等，除基本动作之外，还要针对肌肉的前、中、后束，上部、中部、下部，肌肉深度、厚度、宽度等做专门动作的练习。如用上斜、下斜的卧推，宽、中、窄握的俯卧撑等。
　　与此同时，在健身中级阶段，心肺功能的锻炼还要特别注意加强。随着锻炼负荷增加，肌肉体积增大，心脏负担势必要增加。而耐力锻炼可以有效增加心脏容积，从而让心脏的工作能力全面提高。
　　中级阶段锻炼主要目的是发展肌肉围度(也就是块头)，所以在这一阶段的锻炼中，通常使用大负荷练习，最大负荷的75%到95%，每星期3次(隔天一次)，每次大概1.5小时，8-12RM强度，重点锻炼部位动作(通常3个动作)6到8组，普通锻炼部位动作(通常3个动作)3到4组，要求对肌肉的刺激达到最大。
　　例如，重点锻炼胸部肌肉的中级健身计划：健身准备活动，仰卧飞鸟、哑铃卧推、俯卧撑、哑铃侧平举、哑铃俯身飞鸟、哑铃深蹲和10分钟肌肉拉伸动作。
　　中级阶段练习以孤立动作为主，强调锻炼的针对性，某一块肌肉群集中发展，塑造肌肉轮廓。在这一阶段要尤其注意耐力锻炼，发展心肺功能，所以每星期至少安排1次耐力训练，如长跑或游泳。
　　中级锻炼法则有优先锻炼法则、金字塔法则、复合组锻炼法则、孤立锻炼法则、动静结合法则、念动一致法则。
　　
　　瘦人健身计划-高级阶段
　　经过瘦人健身中级阶段训练之后，已经可以承受较大的负荷强度还有负荷量，身体形态得到显著改善，并且可以熟练使用各种哑铃锻炼方法起到练习的目的，并形成了适合自己的一套训练程序。这个时候，假如不满足于肌肉的轮廓，希望自己的肌肉线条可以更明显，这时就能进入到哑铃练习的高级阶段了。
　　高级阶段的练习时间最少要1年以上，在这一阶段，要达到的主要目的有3点：
　　1.在中级阶段基础上，身体薄弱部位继续塑造，同时肌肉线条清晰度要提高。
　　2.采用孤立性练习，增加肌肉负荷量的多次数力竭性训练。
　　3.更加注意全身耐力锻炼，让心肺功能增强。
　　
　　高级阶段锻炼法则有“烧点”法则、最后借力法则、渐降组法则、先衰竭法则、交错穿插法则、持续紧张法则、顶峰收缩法则。 高级阶段的负荷强度的变化范围很大，通常按照练习的目的还有法则有所不同,以力竭练习还有孤立动作为主。为了巩固还有进一步发展中级阶段的训练成果，先使用大重量、大强度练习，而后采用小强度力竭性练习。每星期可锻炼四次，每次大概1.5个小时。在营养上，要继续保持高蛋白膳食，还有碳水化合物摄入量。 高级阶段的健身计划健身之前准备活动(10分钟)、哑铃平卧推(6-8RM、四组)、上斜飞鸟(10-12RM、四组)、颈后臂屈伸(8-12RM、四组)、哑铃仰卧屈臂上提(8-12RM、三组)、俯身单臂屈伸(10-12RM、二组)、肌肉拉伸运动、耐力训练(二十分钟)。
　　
　　高级阶段的训练中，练习复合化、目的多元化，而并非单一的消耗练习，或增粗练习，往往兼而有之。负荷强度还有量变化比较大，也没有固定的一个模式，所以按照自己的身体条件还有练习程度选择适合自己的高级哑铃健身计划。
		 * 
		 * */
		
		
		/*
		 * 
		 * 身体正常
		 * 
		 * 
		 * 周一：胸部，如蝴蝶机夹胸，卧推机卧推，哑铃飞鸟，哑铃卧推等，选3个动作，选适当重量做4组，每组12~15个。
腹部训练，斜板仰卧起坐，仰卧举腿，仰卧卷腹，器械卷腹等，选2个动作，每个动作做到力竭，做3~4组。(这个比较痛苦，要坚持)
周二：胳膊，二头肌（杠铃弯举，哑铃弯举），三头肌(哑铃颈后臂屈伸，器械下压，推臂机推伸)，具体你可以根据你健身房的情况选择，二头三头肌各选2个动作，4组每组12~15个。
腹部训练同上，但可以调换下训练顺序。如果腹部酸痛没有恢复，可适当减量。
周三：腿，主要练练小腿，用小腿屈伸那个组合器械，做4组 每组15个
周四：背部 ，器械下拉，器械平拉(如果有这个组合器械的话)，做4组 每组15个
腹部训练同上
周五：肩部，哑铃推举，哑铃侧平举，4组每组12~15个
腹部训练同上
		 * 
		 * */
		
		
		
		
		/*
		 * 
		 * 减肥患者
		 * 周一：跑步+器械锻炼
这是最常规的健身房减肥法。跑步是为了让脂肪在身体内燃烧，从根本达到减肥的目的，一般每次跑步都在45-60分钟之间效果最佳；器械锻炼是为了针对某一部位而减肥，如减掉背部的。
周二：健美操+器械锻炼
健美操也是有氧运动的一种，运动强度和燃脂效果也不逊于跑步，有时候感觉跑步枯燥了，可以选择选用健美操来代替。健美操一般指的是搏击操、杠铃操、健康操等健身房的公共课目运动，适合各个年龄层的群体练习。
周三、周日：休息　
所谓的休息不是完全的休息，是指可以在公园之类的场所做一些强度较小的运动，如快走、竞走之类的休闲娱乐活动。或者也可以在家里或者是健身房做一些简单的瑜伽动作，主要目的在于放松身体的肌肉，让身体得得到休息。　
周四：动感单车　　
动感单车是急剧消耗能量的有氧运动之一，其主要的特点在于气氛活跃，配合动感的音乐能让人在健身时不知不觉的兴奋起来，提高脂肪的燃烧率，在减肥运动项目中始终都是最受欢迎的运动之一。　
周五：高温瑜珈+慢跑　　
高温瑜珈也是比较受广大女士欢迎的运动之一，但是局限性比较大，运动强度也适中；做了一节课的高温瑜珈后，或许你的运动量还没达到减肥的效果，这是最好的选择就是去跑步机上进行一些慢跑练习，加速身体内的脂肪燃烧速度。
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
