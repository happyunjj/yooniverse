package service;

public class MemberServiceTests {
	MemberService service=new MemberServiceImpl();
	
	public static void main(String[] args) {
		MemberServiceTests tests=new MemberServiceTests();
		tests.testMemberValid();
		tests.testMemberValid();
	}
	
	public void testMemberValid() {
		service.memberValid("happyunjj", "happyunjj");
	}
	
	public void testWithdraw() {
		service.withdraw("yunjeong");
	}
	
	
}
