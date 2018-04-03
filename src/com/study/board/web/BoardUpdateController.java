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

public class BoardUpdateController implements IController{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		BoardServiceImpl boardService = new BoardServiceImpl();
		BoardSearch boardSearch = new BoardSearch();
		
		boardSearch.setting(boardService.getBoardCount(boardSearch));

		
		request.setAttribute("search", boardSearch);
		
		Board board = new Board();

			String temp = request.getParameter("bo_no");
			int bo_no = Integer.parseInt(temp);
			board.setBo_title(request.getParameter("bo_title"));
			board.setBo_email(request.getParameter("bo_email"));
			board.setBo_content(request.getParameter("bo_content"));
			board.setBo_no(bo_no);
			request.setAttribute("board", board);
			
			int cnt;
			try {
				cnt = boardService.modifyBoard(board);
				request.setAttribute("cnt", cnt);
				if(cnt>0){
					request.setAttribute("msg", "게시글 수정 완료뿌뿌");
				}else {
					request.setAttribute("msg", "게시글 수정 실패..  DB에 안들어갓옹");
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		
		
		
		
		
		String viewPage = "/WEB-INF/view/board/boardUpdate.jsp";
		return viewPage;

	}
	


}
