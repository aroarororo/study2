package com.study.board.web;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.study.board.service.BoardServiceImpl;
import com.study.board.vo.Board;
import com.study.servlet.IController;

public class BoardEditController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
/*
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setting(boardService.getBoardCount(boardSearch));
		request.setAttribute("search", boardSearch);

*/		
		
		try {
			String temp = request.getParameter("bo_no");
			System.out.println(temp);
			int bo_no = Integer.parseInt(temp);
			Board board = null;
			board = boardService.getBoard(bo_no);
			request.setAttribute("board", board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		String viewPage = "/WEB-INF/view/board/boardEdit.jsp";
		
		return viewPage;

	}
	


}
