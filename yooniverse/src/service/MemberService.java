package service;

import java.util.List;

import vo.Member;

public interface MemberService {
	//회원가입
	void join(Member member);
	//로그인
	boolean login(String id,String pwd);
	//회원탈퇴
	void withdraw(String id);
	//정보수정
	void modify(Member member);
	//임시비밀번호 업데이트
	void pwdUpdate(String id,String pwd);
	//아이디,비밀번호찾기
	//단일회원조회
	Member findBy(String id);
	//회원목록조회
	List<Member> getMembers();
	//email
	Member findByEmail(String Email);
	//이름이랑 이메일로 찾기
	Member findByEmail(String Email,String name);
	//유효성 검증
	Integer memberValid(String email,String id);
	}
