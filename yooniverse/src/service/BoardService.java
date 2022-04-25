package service;

import java.util.List;

import vo.Attach;
import vo.Board;
import vo.Criteria;

public interface BoardService {
	//CRUD
	//글쓰기
	Long write(Board board);
	//글조회
	Board read(Long bno);
	//목록조회
	List<Board> list();
	//페이지
	List<Board> list(Criteria cri);
	//카테고리로 게시판 리스트
	List<Board> list(int category);
	//글수정
	void modify(Board board);
	//글삭제
	void remove(Long bno);
	
	//글 작성자 찾아오기
	String findIdBy(Long bno);
	
	//첨부파일 uuid>> origin
	String findOriginBy(String uuid);
	
	List<Attach> readAttachByPath(String path);
	
	//첨부파일 삭제
	void deleteAttach(Long bno);
	
	//페이지 총 갯수 가져오기
	int getCount(Criteria cri);
	
	//탈퇴 시 게시글 작성자 NULL로
	void withdraw(String id); 
	
	//조회수 증가
	void hit(Long bno);
	
	//좋아요 누르기
	void plusHeart(String id,Long bno);
	
	//좋아요 해제하기
	void minusHeart(String id,Long bno);
	
	//좋아요 수 가져오기
	int getHeartCount(Long bno);
	
	//글 좋아요 여부 확인
	int checkHeart(String id,Long bno);
	
	//글 좋아요 토글
	int heart(String id,Long bno);
	
}
