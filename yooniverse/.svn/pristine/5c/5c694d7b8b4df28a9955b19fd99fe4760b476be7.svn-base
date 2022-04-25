package service;

import java.util.List;

import dao.BoardDao;
import vo.Attach;
import vo.Board;
import vo.Criteria;

public class BoardServiceImpl implements BoardService{
	private BoardDao dao=new BoardDao();
	@Override
	//트랜잭션
	public Long write(Board board) {
		//글 작성 후 글 번호 봔환
		Long bno=dao.insert(board);
		//각 첨부파일에 글 번호 부여
		for(Attach attach:board.getAttachs()) {
			attach.setBno(bno);
//			첨부 파일 작성
			dao.writeAttach(attach);
		}
		return bno;
	}

	@Override
	public Board read(Long bno) {
		Board board= dao.read(bno);
		board.setAttachs(dao.readAttach(bno));
		return board;
	}

	@Override
	public List<Board> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void modify(Board board) {
		// TODO Auto-generated method stub
		dao.update(board);
	}

	@Override
	public void remove(Long bno) {
		// TODO Auto-generated method stub
		ReplyService rpService=new ReplyServiceImpl();
		dao.deleteAttach(bno);
		rpService.delete(bno);
		dao.delete(bno);
	}

	@Override
	public String findOriginBy(String uuid) {
		// TODO Auto-generated method stub
		return dao.findOriginBy(uuid);
	}

	@Override
	public List<Board> list(Criteria cri) {
		// TODO Auto-generated method stub
		List<Board> list=dao.list(cri);
		list.forEach(b->b.setAttachs(dao.readAttach(b.getBno())));
		return list;
	}

	@Override
	public int getCount(Criteria cri) {
		return dao.getCount(cri);
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Board> list(int category) {
		// TODO Auto-generated method stub
		return dao.list(category);
	}

	public List<Attach> readAttachByPath(String path) {
		// TODO Auto-generated method stub
		return dao.readAttachByPath(path);
	}

	@Override
	public void deleteAttach(Long bno) {
		dao.deleteAttach(bno);
		
	}

	public String findIdBy(Long bno) {
		// TODO Auto-generated method stub
		return dao.findIdBy(bno);
	}

	@Override
	public void withdraw(String id) {
		dao.withdraw(id);
		
	}

	@Override
	public void hit(Long bno) {
		dao.hit(bno);
	}

	@Override
	public void plusHeart(String id, Long bno) {
		// TODO Auto-generated method stub
		dao.insertHeart(id,bno);
	}

	@Override
	public void minusHeart(String id, Long bno) {
		dao.deleteHeart(id,bno);
	}

	@Override
	public int getHeartCount(Long bno) {
		// TODO Auto-generated method stub
		return dao.getHeartCount(bno);
	}

	@Override
	public int checkHeart(String id, Long bno) {
		return dao.findHeartBy(id, bno);
	}

	@Override
	public int heart(String id, Long bno) {
		int status=0;
		if(dao.findHeartBy(id, bno)==1) {
			dao.deleteHeart(id, bno);
		} else {
			dao.insertHeart(id, bno);
			status =1;
		}
		return status;
	}

}
