package dao;

import vo.Reply;

public class ReplyDaoTests {
	ReplyDao dao=new ReplyDao();
	public static void main(String[] args) {
		ReplyDaoTests tests=new ReplyDaoTests();
//		tests.testList();
//		tests.testSelect();
//		tests.testInsert();
//		tests.testRemove();
//		tests.testDelete();
//		tests.testWithdraw();
//		tests.testUpdate();
//		tests.testFindIdBy();
		
	}
	public void testList() {
		dao.list(89L).forEach(System.out::println);
	}
	
	public void testInsert() {
		dao.insert(new Reply(40L,"인서트테스트","2021-09-29","happyunjj",89L));
	}
	
	public void testSelect() {
		dao.select(33L);
	}
	
	public void testRemove() {
		dao.remove(40L);
	}
	
	public void testDelete() {
		dao.delete(89L);
	}
	
	public void testWithdraw() {
		dao.withdraw("yunjeong");
	}
	
	public void testUpdate() {
		dao.update(new Reply(40L,"수정테스트 내용"));
	}
	
	public void testFindIdBy() {
		dao.findIdBy(39L);
	}
}
