package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Member;

public class MemberDao {

	public List<Member> getMembers() {
		Connection conn=DBConn.getConnection();
		List<Member> list=new ArrayList<Member>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER");
			while(rs.next()) {
				int idx=1;
				String id=rs.getString(idx++);
				String pwd=rs.getString(idx++);
				String email=rs.getString(idx++);
				String name=rs.getString(idx++);
				
				Member member=new Member(id,pwd,email,name);
				list.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public boolean login(String id, String pwd) {
		Connection conn=DBConn.getConnection();
		boolean success=false;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER "
					+"WHERE ID=? AND PWD=? AND STATUS=1");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs=pstmt.executeQuery();
			success=rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return success;
	}
	
	public Member findBy(String id) {
		Connection conn=DBConn.getConnection();
		Member member=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER "
					+"WHERE ID=?");
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int idx=1;
				
				member=new Member(rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public void join(Member member) {
		Connection conn=DBConn.getConnection();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO TBL_MEMBER VALUES(?,?,?,?,1)");
			int idx=1;
			pstmt.setString(idx++, member.getId());
			pstmt.setString(idx++, member.getPwd());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getName());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void withdraw(String id) {
		Connection conn=DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_MEMBER SET STATUS=0,NAME='탈퇴회원' WHERE ID=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public Member findEmailBy(String email) {
		Connection conn=DBConn.getConnection();
		Member member=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER "
					+"WHERE EMAIL=? AND STATUS=1");
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int idx=1;
				
				member=new Member(rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public Member findEmailBy(String email, String name) {
		Connection conn=DBConn.getConnection();
		Member member=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID,PWD,EMAIL,NAME FROM TBL_MEMBER "
					+"WHERE EMAIL=? AND NAME= ? AND STATUS=1");
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int idx=1;
				
				member=new Member(rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public void update(Member member) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_MEMBER SET\r\n" + 
					"	PWD=?,\r\n" + 
					"	EMAIL=?,\r\n" + 
					"	NAME=?\r\n" + 
					"WHERE ID=?");
			pstmt.setString(1,member.getPwd());
			pstmt.setString(2,member.getEmail());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getId());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void pwdUpdate(String id,String pwd) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_MEMBER SET\r\n" + 
					"	PWD=?\r\n" + 
					"WHERE ID=?");
			pstmt.setString(1,pwd);
			pstmt.setString(2,id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
