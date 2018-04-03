package com.study.member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;

public interface IMemberDao {

	int getMemberCount(Connection conn, MemberSearch memberSearch) throws SQLException;

	//회원 목록
	List<Member> getMemberList(Connection conn, MemberSearch memberSearch) throws SQLException;

	//회원 상세정보 조회
	Member getMember(Connection conn, String mem_id) throws SQLException;

	//회원 등록
	int insertMember(Connection conn, Member member) throws SQLException;

	int updateMember(Connection conn, Member member) throws SQLException;

	int deleteMember(Connection conn, Member member) throws SQLException;

}