package com.study.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;

public interface IBoardDao {

	int getBoardCount(Connection conn, BoardSearch boardSearch) throws SQLException;

	//회원 목록
	List<Board> getBoardList(Connection conn, BoardSearch boardSearch) throws SQLException;

	//회원 상세정보 조회
	Board getBoard(Connection conn, int bo_no) throws SQLException;

	//회원 등록
	int insertBoard(Connection conn, Board board) throws SQLException;

	int updateBoard(Connection conn, Board board) throws SQLException;

	int deleteBoard(Connection conn, Board board) throws SQLException;

}