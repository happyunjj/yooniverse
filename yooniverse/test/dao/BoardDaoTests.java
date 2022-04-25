package dao;

import vo.Board;
import vo.Criteria;

public class BoardDaoTests {
	BoardDao dao=new BoardDao();
	public static void main(String[] args) {
		//테스트할 것만 주석풀고 하기
		BoardDaoTests tests=new BoardDaoTests();
//		tests.testInsert();
//		tests.testRead();
//		tests.testList();
//		tests.testUpdate();
//		tests.testDelete();
//		tests.testGetCount();
//		tests.testHit();
//		tests.testWithdraw();
		
	}
	public void testInsert() {
		Board board=new Board("dao테스트","잘되넹","happyunjj",1);
		dao.insert(board);
	}
	public void testRead() {
		Board board=dao.read(10L);
		System.out.println(board);
	}
	
	public void testList() {
		dao.list(new Criteria(1,20)).forEach(System.out::println);
	}
	
	public void testUpdate() {
		dao.update(new Board(90L,"dao수정테스트","잘되나용"));
	}
	
	public void testDelete() {
		dao.delete(90L);
	}
	
	public void testGetCount() {
		System.out.println(dao.getCount(new Criteria(1,10,1)));
	}
	
	public void testHit() {
		dao.hit(89L);
	}
	
	public void testWithdraw() {
		dao.withdraw("babamba");
	}
}
