package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Attach;
import vo.Board;
import vo.Criteria;
import vo.Member;

public class BoardDao {
	//CRUD
	public Long insert(Board board) {
		Connection conn=DBConn.getConnection();
		Long bno=null;
		try {
			conn.setAutoCommit(false);
			ResultSet rs=conn.prepareStatement("SELECT SEQ_BOARD.NEXTVAL FROM DUAL").executeQuery();
			rs.next();
			bno=rs.getLong(1);
			
			//글작성
			PreparedStatement pstmt=conn.prepareStatement(
					"INSERT INTO TBL_BOARD(BNO,TITLE,CONTENT,ID,CATEGORY) VALUES (?,?,?,?,?)");
			int idx=1;
			pstmt.setLong(idx++,bno);
			pstmt.setString(idx++,board.getTitle());
			pstmt.setString(idx++,board.getContent());
			pstmt.setString(idx++,board.getId());
			pstmt.setInt(idx++,board.getCategory());
			
			//select:executeQuery,insert,update,delete:executeUpdate
			pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
		}catch(Exception e){
			
		}
		return bno;
	}

	//글조회
	public Board read(Long bno) {
		Connection conn = DBConn.getConnection();
		Board board=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT BNO,TITLE,CONTENT,REGDATE,ID,CATEGORY" + 
					",HITCOUNT,(SELECT COUNT(*) FROM TBL_HEART WHERE BNO=?) LIKECOUNT FROM TBL_BOARD " + 
					"WHERE BNO=?");
			pstmt.setLong(1,bno);
			pstmt.setLong(2,bno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				int idx=1;
				board=new Board(
						rs.getLong(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++),
						rs.getString(idx++),
						rs.getInt(idx++),
						rs.getLong(idx++),
						rs.getLong(idx++),
						null,
						null
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public List<Board> list() {
		// TODO Auto-generated method stub
		Connection conn=DBConn.getConnection();
		List<Board> list=new ArrayList<Board>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs= stmt.executeQuery("SELECT BNO,TITLE,REGDATE,ID,CATEGORY,HITCOUNT" + 
					"FROM TBL_BOARD " + 
					"WHERE BNO>0 " + 
					"ORDER BY 1 DESC");
			while(rs.next()) {
				Long bno=rs.getLong("bno");
				String title=rs.getString("title");
				Date regdate=rs.getDate("regdate");
				String id=rs.getString("id");
				Integer category=rs.getInt("category");
				Long hitCount=rs.getLong("hitcount");
				
				Board board=new Board(bno,title,regdate,id,category,hitCount);
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Board> list(Criteria cri) {
		// TODO Auto-generated method stub
		Connection conn=DBConn.getConnection();
		List<Board> list=new ArrayList<Board>();
		try {
			StringBuilder sql=new StringBuilder();
			sql.append("WITH B AS( \n");
			sql.append("SELECT ROWNUM RN,T.* ");
			sql.append("FROM TBL_BOARD T ");
			sql.append("WHERE BNO>0 ");
			sql.append("AND CATEGORY=? AND ROWNUM<=? * ? ");
			sql.append("ORDER BY BNO DESC ");
			sql.append(") \n");
			sql.append("SELECT BNO,TITLE,REGDATE,ID,CATEGORY,HITCOUNT,(SELECT COUNT(*) FROM TBL_REPLY R WHERE R.BNO=B.BNO) REPLYCNT,CONTENT ");
			sql.append("FROM B ");
			sql.append("WHERE RN>(? - 1) * ? ");
			PreparedStatement pstmt= conn.prepareStatement(sql.toString());
			int idx=1;
			pstmt.setInt(idx++,cri.getCategory());
			pstmt.setInt(idx++,cri.getPageNum());
			pstmt.setInt(idx++,cri.getAmount());
			pstmt.setInt(idx++,cri.getPageNum());
			pstmt.setInt(idx++,cri.getAmount());

			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				idx=1;
				Long bno=rs.getLong(idx++);
				String title=rs.getString(idx++);
				Date regdate=rs.getDate(idx++);
				String id=rs.getString(idx++);
				Integer category=rs.getInt(idx++);
				Long hitCount=rs.getLong(idx++);
				
				
				Board board=new Board(bno,title,regdate,id,category,hitCount);
				board.setReplyCnt(rs.getInt(idx++));
				board.setContent(rs.getString(idx++));
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Board> list(int category) {
		// TODO Auto-generated method stub
		Connection conn=DBConn.getConnection();
		List<Board> list=new ArrayList<Board>();
		try {
			StringBuilder sql=new StringBuilder();
			sql.append("SELECT BNO,TITLE,CONTENT ");
			sql.append("FROM TBL_BOARD ");
			sql.append("WHERE BNO>0 ");
			sql.append("AND CATEGORY=? ");
			sql.append("ORDER BY BNO DESC");
			PreparedStatement pstmt= conn.prepareStatement(sql.toString());
			pstmt.setInt(1, category);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int idx=1;
				Long bno=rs.getLong(idx++);
				String title=rs.getString(idx++);
				String content=rs.getString(idx++);	
				
				Board board=new Board(bno,title,content);
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//글수정
	public void update(Board board) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_BOARD SET\r\n" + 
					"	TITLE=?,\r\n" + 
					"	CONTENT=?\r\n" + 
					"WHERE BNO=?");
			pstmt.setString(1,board.getTitle());
			pstmt.setString(2,board.getContent());
			pstmt.setLong(3,board.getBno());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	//글삭제
	public void delete(Long bno) {
		Connection conn = DBConn.getConnection();
		//딸린 첨부파일 삭제
		//딸린 댓글삭제
		//마지막으로 글 삭제
		try {
			PreparedStatement pstmt=conn.prepareStatement("DELETE TBL_BOARD WHERE BNO=?");
			pstmt.setLong(1,bno);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//첨부 파일 
	public void writeAttach(Attach attach) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("INSERT INTO TBL_ATTACH VALUES(?,?,?,?)");
			int idx=1;
			pstmt.setString(idx++,attach.getUuid());
			pstmt.setString(idx++,attach.getOrigin());
			pstmt.setLong(idx++,attach.getBno());
			pstmt.setString(idx++,attach.getPath());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Attach> readAttach(Long bno){
		Connection conn=DBConn.getConnection();
		List<Attach> list=new ArrayList<Attach>();
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT UUID,ORIGIN,PATH FROM TBL_ATTACH WHERE BNO=?");
			pstmt.setLong(1, bno);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int idx=1;
				String uuid=rs.getString(idx++);
				String origin=rs.getString(idx++);
				String path=rs.getString(idx++);
				
				Attach attach=new Attach(uuid,origin,bno,path);
				list.add(attach);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		}
	
	public List<Attach> readAttachByPath(String path){
		Connection conn=DBConn.getConnection();
		List<Attach> list=new ArrayList<Attach>();
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT UUID,ORIGIN,PATH FROM TBL_ATTACH WHERE PATH=?");
			pstmt.setString(1, path);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				int idx=1;
				String uuid=rs.getString(idx++);
				String origin=rs.getString(idx++);
				
				Attach attach=new Attach(uuid,origin,null,path);
				list.add(attach);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		}
	
	//글삭제
	public void deleteAttach(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("DELETE TBL_ATTACH WHERE BNO=?");
			pstmt.setLong(1,bno);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String findIdBy(Long bno) {
		Connection conn=DBConn.getConnection();
		String id=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID FROM TBL_BOARD WHERE BNO=?");
			pstmt.setLong(1,bno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				id=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}



	public String findOriginBy(String uuid) {
		Connection conn=DBConn.getConnection();
		String OriginFileName=null;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ORIGIN FROM TBL_ATTACH WHERE UUID=?");
			pstmt.setString(1, uuid);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				OriginFileName=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return OriginFileName;
	}

	public int getCount(Criteria cri) {
		Connection conn = DBConn.getConnection();
		int count=0;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT COUNT(*) FROM TBL_BOARD WHERE CATEGORY=?");
			pstmt.setInt(1,cri.getCategory());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public void withdraw(String id) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_BOARD SET\r\n" + 
					"	ID=NULL\r\n" + 
					"WHERE ID=?");
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void hit(Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("UPDATE TBL_BOARD SET\r\n" + 
					"	HITCOUNT=HITCOUNT+1\r\n" + 
					"WHERE BNO=?");
			pstmt.setLong(1,bno);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertHeart(String id, Long bno) {
		Connection conn=DBConn.getConnection();
		try {
			//글작성
			PreparedStatement pstmt=conn.prepareStatement(
					"INSERT INTO TBL_HEART(ID,BNO) VALUES (?,?)");
			pstmt.setString(1,id);
			pstmt.setLong(2,bno);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	public void deleteHeart(String id, Long bno) {
		Connection conn = DBConn.getConnection();
		try {
			PreparedStatement pstmt=conn.prepareStatement("DELETE TBL_HEART WHERE ID=? AND BNO=?");
			pstmt.setString(1,id);
			pstmt.setLong(2,bno);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public int getHeartCount(Long bno) {
		Connection conn = DBConn.getConnection();
		int count=0;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT COUNT(*) FROM TBL_HEART WHERE BNO=?");
			pstmt.setLong(1,bno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	
	public int findHeartBy(String id,Long bno) {
		Connection conn = DBConn.getConnection();
		int count=0;
		try {
			PreparedStatement pstmt=conn.prepareStatement("SELECT ID,BNO FROM TBL_HEART WHERE ID=? AND BNO=?");
			pstmt.setString(1,id);
			pstmt.setLong(2,bno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				count=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
		
	}
}