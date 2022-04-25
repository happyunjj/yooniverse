package service;

import java.util.List;

import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService{
	private MemberDao dao=new MemberDao();
	@Override
	public Integer memberValid(String email, String id) {
		Integer result=null;
		Member idExist=dao.findBy(id);
		Member emailExist=dao.findEmailBy(email);
		if(idExist!=null && emailExist!=null) {
			result=3;
		}
		else if(emailExist!=null) {
			result=2;
		} 
		else if(idExist!=null) {
			result=1;
		} else result=0;
		
		return result;
	}
	@Override
	public List<Member> getMembers() {
		// TODO Auto-generated method stub
		return dao.getMembers();
	}
	@Override
	public boolean login(String id, String pwd) {
		// TODO Auto-generated method stub
		return dao.login(id,pwd);
	}
	@Override
	public Member findBy(String id) {
		// TODO Auto-generated method stub
		return dao.findBy(id);
	}
	@Override
	public void join(Member member) {
		dao.join(member);
	}
	@Override
	public void withdraw(String id) {
		BoardService service=new BoardServiceImpl();
		ReplyService service2=new ReplyServiceImpl();
		service2.withdraw(id);
		service.withdraw(id);
		dao.withdraw(id);
	}
	@Override
	public Member findByEmail(String Email) {
		return dao.findEmailBy(Email);
	}
	@Override
	public Member findByEmail(String Email, String name) {
		// TODO Auto-generated method stub
		return dao.findEmailBy(Email,name);
	}
	@Override
	public void modify(Member member) {
		dao.update(member);
		
	}
	@Override
	public void pwdUpdate(String id,String pwd) {
		dao.pwdUpdate(id,pwd);
	}

}
