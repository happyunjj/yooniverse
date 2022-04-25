package service;

import java.util.List;

import dao.ReplyDao;
import vo.Reply;

public class ReplyServiceImpl implements ReplyService{
	private ReplyDao dao=new ReplyDao();
	@Override
	public List<Reply> list(Long bno) {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}
	@Override
	public Reply get(Long rno) {
		// TODO Auto-generated method stub
		return dao.select(rno);
	}
	@Override
	public void remove(Long rno) {
		dao.remove(rno);	
	}
	@Override
	public void write(Reply reply) {
		dao.insert(reply);
		
	}
	@Override
	public void delete(Long bno) {
		dao.delete(bno);
		
	}
	@Override
	public void withdraw(String id) {
		dao.withdraw(id);
		
	}
	@Override
	public void modify(Reply reply) {
		dao.update(reply);
		
	}
	@Override
	public String findIdBy(Long rno) {
		return dao.findIdBy(rno);
	}

	
}
