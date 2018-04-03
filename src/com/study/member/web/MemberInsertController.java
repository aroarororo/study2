package com.study.member.web;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.servlet.IController;

public class MemberInsertController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		MemberServiceImpl memberService = new MemberServiceImpl();
		String viewPage = "/WEB-INF/view/member/memberInsert.jsp";
		
		String mem_id = request.getParameter("mem_id");
		if(mem_id == null|| mem_id.trim().equals("")) {
			return"redirect:/member/memberList.do";
		}
		Member member = new Member();
		member.setMem_id(request.getParameter("mem_id"));
		member.setMem_pwd(request.getParameter("mem_pwd"));
		member.setMem_name(request.getParameter("mem_name"));
		member.setMem_phone(request.getParameter("mem_phone"));
		member.setMem_email(request.getParameter("mem_email"));
		
		request.setAttribute("member", member);
		
		int cnt = memberService.insertMember(member);
		request.setAttribute("cnt", cnt);
		if(cnt>0){
			request.setAttribute("msg", "회원추가 완료뿌뿌");
		}else {
			request.setAttribute("msg", "회원추가 실패..  DB에 안들어갓옹");
			
		}
		return viewPage;
	}

	
	
}
