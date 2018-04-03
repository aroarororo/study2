package com.study.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.servlet.IController;

public class BoardViewController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();

		//BoardSearch boardSearch = new BoardSearch();
		//boardSearch.setting(boardService.getBoardCount(boardSearch));
		//request.setAttribute("search", boardSearch);
		
		String temp = request.getParameter("bo_no");
		int bo_no = Integer.parseInt(temp);
		Board board;
		try {
			board = boardService.getBoard(bo_no);
			request.setAttribute("board", board);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		String viewPage = "/WEB-INF/view/board/boardView.jsp";
		
		return viewPage;

	}
	


}
