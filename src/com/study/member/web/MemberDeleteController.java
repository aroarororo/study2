package com.study.member.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class MemberDeleteController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		String mem_id = request.getParameter("mem_id");
		System.out.println(mem_id);

		MemberServiceImpl memberService = new MemberServiceImpl();
		Member member =  new Member();
		member.setMem_id(mem_id);
		
		int cnt = memberService.deleteMember(member);
		request.setAttribute("cnt", cnt);
		if(cnt>0){
			request.setAttribute("msg", "회원삭제 완료뿌뿌");
		}else {
			request.setAttribute("msg", "회원삭제 실패.. 띠로리");
			
		}
		String viewPage = "/WEB-INF/view/member/memberDelete.jsp";
		return viewPage;
	}
}
