package com.study.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.board.vo.BoardSearch;
import com.study.member.vo.Member;
import com.study.member.vo.MemberSearch;

public class MemberDaoJDBC implements IMemberDao {

	//인터페이스
	//-객체의 사용 방법을 정의한 타입
	


	@Override
	public int getMemberCount(Connection conn, MemberSearch memberSearch) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;				
		StringBuilder sb = new StringBuilder();
		
		sb.append(" SELECT count(*) FROM tb_member1 ");		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			rs.next();			
			return rs.getInt(1);
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e){}
			if(pstmt != null) try{pstmt.close();}catch(Exception e){}			
		}
	}
	//회원 목록
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMember#getMemberList(java.sql.Connection, com.study.member.vo.MemberSearch)
	 */
	@Override
	public List<Member> getMemberList(Connection conn, MemberSearch memberSearch) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Member> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		
		sb.append(" SELECT *            ");
		sb.append("  FROM ( SELECT rownum rn, a.*   ");
		sb.append("        FROM (       ");		
		
		sb.append("  SELECT  ");
		sb.append(" 				mem_id 	");
		sb.append(" 			, 	mem_name	");
		sb.append(" 			, 	mem_pwd	");
		sb.append(" 			, 	mem_phone 	");
		sb.append(" 			, 	mem_email 	");
		sb.append(" 			, 	TO_CHAR(reg_date, 'YYYY/MM/DD') AS reg_date 	");
		sb.append(" from tb_member1 		");
		sb.append(" order by reg_date asc 	");
		
		sb.append("           ) a      ");
		sb.append("      ) b           ");
		sb.append(" WHERE rn between ? and ?  ");		
		
		try {
			pstmt = conn.prepareStatement(sb.toString()); //안에 공백으로 두지말것. 쿼리문 들어가는 자리 
			pstmt.setInt(1, memberSearch.getStartRow());			
			pstmt.setInt(2, memberSearch.getEndRow());	
			rs = pstmt.executeQuery(); //여기서 오류나면 쿼리문 잘못된거
//			Member member = new Member(); 이렇게 두면 한 주소를 계속 내보내서 개똥이만 100번찍힘
			while (rs.next()) {
				Member member = new Member(); //이렇게해야 매번 새로운 번지로 넘겨준대 
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_phone(rs.getString("mem_phone"));
				member.setMem_email(rs.getString("mem_email"));
				member.setReg_date(rs.getString("reg_date"));
				list.add(member); //1.

			}
			return list; //2. 1번 2번 체크 안하면 널포인트익셉션!
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}

		}
	}
	
	//회원 상세정보 조회
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMember#getMember(java.sql.Connection, java.lang.String)
	 */
	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("  SELECT  ");
		sb.append(" 				mem_id 	");
		sb.append(" 			, 	mem_name	");
		sb.append(" 			, 	mem_pwd	");
		sb.append(" 			, 	mem_phone 	");
		sb.append(" 			, 	mem_email 	");
		sb.append(" 			, 	TO_CHAR(reg_date, 'YYYY/MM/DD HH24:MI') AS reg_date 	");
		// ?
		sb.append(" from tb_member1 		");
		sb.append(" where mem_id = ? 		");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString()); //안에 공백으로 두지말것. 쿼리문 들어가는 자리 
			pstmt.setString(1,mem_id);
			//수정 
			rs = pstmt.executeQuery(); //여기서 오류나면 쿼리문 잘못된거
			Member member = null; //이렇게해야 매번 새로운 번지로 넘겨준대 
			if (rs.next()) {
				member = new Member(); //이렇게해야 매번 새로운 번지로 넘겨준대 
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_phone(rs.getString("mem_phone"));
				member.setMem_email(rs.getString("mem_email"));
				member.setReg_date(rs.getString("reg_date"));
			}
			return member; //2. 1번 2번 체크 안하면 널포인트익셉션!
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
		
	
	}
	
	//회원 등록
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMember#insertMember(java.sql.Connection, com.study.member.vo.Member)
	 */
	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("  insert into		tb_member1  		");
		sb.append("  ( mem_id, mem_pwd, mem_name, mem_phone, mem_email, reg_date  )		");
		sb.append(" 	values  (	? ,  ? , ? , ? , ? , sysdate	) ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString()); //안에 공백으로 두지말것. 쿼리문 들어가는 자리 
			pstmt.setString(1,  member.getMem_id());
			pstmt.setString(2,  member.getMem_pwd());
			pstmt.setString(3,  member.getMem_name());
			pstmt.setString(4,  member.getMem_phone());
			pstmt.setString(5,  member.getMem_email());
			
			int cnt = pstmt.executeUpdate();
			return cnt;
			
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}

	//회원 수정 
	//	public int updateMember(Connection conn, String mem_id, String mem_name, String mem_phone, String mem_email) throws SQLException {
	//이걸 한번에 담을 수 있는 양동이를 만드는게 Member member!

	/* (non-Javadoc)
	 * @see com.study.member.dao.IMember#updateMember(java.sql.Connection, com.study.member.vo.Member)
	 */
	@Override
	public int updateMember(Connection conn, Member member) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("  update		tb_member1  			");
		sb.append(" 	set		 	mem_name 		= ?		");
		sb.append(" 			, 	mem_pwd 		= ?		");
		sb.append(" 			, 	mem_phone 		= ?		");
		sb.append(" 			, 	mem_email 		= ?		");
		sb.append("	 where		mem_id 		= ? 	");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString()); //안에 공백으로 두지말것. 쿼리문 들어가는 자리 
			pstmt.setString(1,  member.getMem_name());
			pstmt.setString(2,  member.getMem_pwd());
			pstmt.setString(3,  member.getMem_phone());
			pstmt.setString(4,  member.getMem_email());
			pstmt.setString(5,  member.getMem_id());
			
			int cnt = pstmt.executeUpdate();
			return cnt;
			
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
			
	}
	
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMember#deleteMember(java.sql.Connection, com.study.member.vo.Member)
	 */
	@Override
	public int deleteMember(Connection conn, Member member) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("  delete	from tb_member1  			");
		sb.append("	 where		mem_id 		= ? 	");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString()); //안에 공백으로 두지말것. 쿼리문 들어가는 자리 
			pstmt.setString(1,  member.getMem_id());
			
			int cnt = pstmt.executeUpdate();
			return cnt;
			
		} finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
		
	}

	
}
