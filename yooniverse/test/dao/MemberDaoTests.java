package dao;

import vo.Member;

public class MemberDaoTests {
	MemberDao dao=new MemberDao();
	public static void main(String[] args) {
		MemberDaoTests tests=new MemberDaoTests();
//		tests.testGetMembers();
//		tests.testLogin();
//		tests.testfindBy();
//		tests.testJoin();
//		tests.testWithdraw();
//		tests.testFindEmailBy();
//		tests.testUpdate();
//		tests.testPwdUpdate();
		
	}
	
	public void testGetMembers() {
		dao.getMembers().forEach(System.out::println);;
	}
	
	public void testLogin() {
		System.out.println(dao.login("happyunjj","1234a!"));
	}
	
	public void testfindBy() {
		Member member=dao.findBy("happyunjj");
		System.out.println(member);
	}
	
	public void testJoin() {
		dao.join(new Member("yunjeong","12345","xi@is.good","윤정"));
	}
	
	public void testWithdraw() {
		dao.withdraw("yunjeong");
	}
	
	public void testFindEmailBy() {
		Member member=dao.findEmailBy("happyunjj@gmail.com","자몽자");
		System.out.println(member);
	}
	
	public void testUpdate() {
		dao.update(new Member("happyunjj","1234","happyunjj@gmail.com","자몽자"));
	}	
	
	public void testPwdUpdate() {
		dao.pwdUpdate("happyunjj", "123456");
	}
	
	
}
