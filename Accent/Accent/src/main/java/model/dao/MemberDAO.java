package accent;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.CallableStatement;
import java.util.List;
import java.util.ArrayList;

import accent.Member;

public class MemberDAO {
	private JDBCUtil jdbcUtil = null;
	
	public MemberDAO() {			
		jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
	}
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public int create(Member member) throws SQLException {
		String sql = "INSERT INTO MEMBERINFO VALUES (?, ?, ?, ?, ?, ?, ?)";		
		Object[] param = new Object[] {member.getMember_id(), member.getName(), 
						member.getPwd(), member.getResidentNum(), member.getEmail(), member.getAddr(), member.getTel()};				
		jdbcUtil.setSqlAndParameters(sql, param);
						
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		} finally {		
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;			
	}


	public int update(Member member) throws SQLException {//사용자 이름, 비밀번호, 이메일, 주소, 전화번호만 수정 가능
		String sql = "UPDATE MEMBERINFO "
					+ "SET name=?, pwd=?, email=?, addr=?, tel=? "
					+ "WHERE member_id=?";
		Object[] param = new Object[] {member.getName(), member.getPwd(), 
					member.getEmail(), member.getAddr(), member.getTel(), member.getMember_id()};				
		jdbcUtil.setSqlAndParameters(sql, param);
			
		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
	}

	public int remove(int member_id) throws SQLException {
		String sql = "DELETE FROM MEMBERINFO WHERE member_id=?";		
		jdbcUtil.setSqlAndParameters(sql, new Object[] {member_id});	

		try {				
			int result = jdbcUtil.executeUpdate();
			return result;
		} catch (Exception ex) {
			jdbcUtil.rollback();
			ex.printStackTrace();
		}
		finally {
			jdbcUtil.commit();
			jdbcUtil.close();
		}		
		return 0;
	}

	public Member findMember(int member_id) throws SQLException {
        String sql = "SELECT pwd, name, residentNum, email, addr, tel"
        			+ "WHERE member_id=? ";              
		jdbcUtil.setSqlAndParameters(sql, new Object[] {member_id});

		try {
			ResultSet rs = jdbcUtil.executeQuery();		
			if (rs.next()) {					
				Member member = new Member(
					member_id,
					rs.getString("name"),
					rs.getString("pwd"),
					rs.getString("residentNum"),
					rs.getString("email"),
					rs.getString("addr"),					
					rs.getString("tel"));
				return member;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public List<Member> findMemberList() throws SQLException {
        String sql = "SELECT member_id, name, email"
        		   + "ORDER BY member_id";
		jdbcUtil.setSqlAndParameters(sql, null);		
					
		try {
			ResultSet rs = jdbcUtil.executeQuery();					
			List<Member> memberList = new ArrayList<Member>();	
			while (rs.next()) {
				Member member = new Member(		
					rs.getInt("member_Id"),
					rs.getString("name"),
					null,
					null,
					rs.getString("email"),
					null,
					null);
				memberList.add(member);				
			}		
			return memberList;					
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return null;
	}

	public boolean existingMember (int member_id) throws SQLException {
		String sql = "SELECT count(*) FROM MEMBERINFO WHERE member_id=?";      
		jdbcUtil.setSqlAndParameters(sql, new Object[] {member_id});	

		try {
			ResultSet rs = jdbcUtil.executeQuery();	
			if (rs.next()) {
				int count = rs.getInt(1);
				return (count == 1 ? true : false);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			jdbcUtil.close();		
		}
		return false;
	}

}
