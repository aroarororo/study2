package com.study.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.servlet.IController;

public class BoardListController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {


		//<jsp:useBean id="boardSearch" class="com.study.board.vo.BoardSearch">
		BoardSearch boardSearch = new BoardSearch();
		//<jsp:setProperty property="*" name="boardSearch">
		//BeanUtil 활용 

		try {
			BeanUtils.populate(boardSearch, request.getParameterMap());
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		/*
 * 		String currentPage = request.getParameter("currentPage");
		
		if(currentPage != null && !currentPage.trim().equals("")) {
			boardSearch.setCurrentPage(Integer.parseInt(currentPage));
		}
*/		
		BoardServiceImpl boardService = new BoardServiceImpl();
		boardSearch.setting(boardService.getBoardCount(boardSearch));

		List<Board> list = null;
		try {
			list = boardService.getBoardList(boardSearch);
			request.setAttribute("list",list);
			request.setAttribute("search", boardSearch);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String viewPage = "/WEB-INF/view/board/boardList.jsp";
		
		return viewPage;
	}
	


}
