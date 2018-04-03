package com.study.board.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;



import com.study.board.dao.BoardDaoJDBC;
import com.study.board.dao.BoardDaoMyBatis;
import com.study.board.dao.IBoardDao;
import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.common.vo.PagingVO;


public class BoardServiceImpl extends PagingVO{
	
	private IBoardDao boardDao = new BoardDaoMyBatis();
	
	//BoardDaoJDBC boardDao = new BoardDaoJDBC();
	
	public int getBoardCount(BoardSearch boardSearch) {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = boardDao.getBoardCount(conn, boardSearch);
			return cnt;
		} catch (SQLException e) {
			throw new RuntimeException("게시물오류",e);
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}		
		
	}
	
	
	
	public List<Board> getBoardList(BoardSearch boardSearch) throws SQLException {
		
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			List<Board> list = boardDao.getBoardList(conn, boardSearch);
			return list;
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}		
	} 
	
	
	public Board getBoard(int bo_no) throws SQLException {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			Board board = boardDao.getBoard(conn, bo_no);
			return board;
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}	
	}
	
	public int modifyBoard(Board board) throws SQLException {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = boardDao.updateBoard(conn, board);
			return cnt;
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}	
	}

	public int deleteBoard(Board board) throws SQLException {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = boardDao.deleteBoard(conn, board);
			return cnt;
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}	
	}
	
	
	public int insertBoard(Board board) throws SQLException {
		Connection conn = null;		
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = boardDao.insertBoard(conn, board);
			return cnt;
		}  finally {
			if(conn != null) try{conn.close();}catch(Exception e){}
		}	
		
	}
	
	

}
