package service;

import java.util.List;

import vo.Reply;

public interface ReplyService {
	//댓글 쓰기
	void write(Reply reply);
	//댓글 목록
	List<Reply> list(Long bno);
	//댓글 단일 조회
	Reply get(Long rno);
	//댓글 삭제
	void remove(Long rno);
	//글 삭제 시 댓글 삭제
	void delete(Long bno);
	//회원탈퇴 시 작성자 null로 만들기
	void withdraw(String id);
	//댓글 수정
	void modify(Reply reply);
	//댓글번호로 작성자조회
	String findIdBy(Long rno);
}
