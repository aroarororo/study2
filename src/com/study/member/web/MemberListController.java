package com.study.member.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.member.service.MemberServiceImpl;
import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;
import com.study.servlet.IController;

public class MemberListController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {

		MemberServiceImpl memberService = new MemberServiceImpl();
		MemberSearch memberSearch = new MemberSearch();
/*
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null && !currentPage.trim().equals("")) {
			memberSearch.setCurrentPage(Integer.parseInt(currentPage));
		}
		*/
		
		int cp=1;
		if(request.getParameter("currentPage") != null) {
			cp=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		memberSearch.setCurrentPage(cp);
		
		
		memberSearch.setting(memberService.getMemberCount(memberSearch));

		
		List<Member> list=null;
			list = memberService.getMemberList(memberSearch);
			request.setAttribute("member", list);
			request.setAttribute("search", memberSearch);
		String viewPage = "/WEB-INF/view/member/memberList.jsp";
		
		return viewPage;
	}

	
	
}
