package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/findPwValid")
public class FindPwValid extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		String id=req.getParameter("id");
		String email=req.getParameter("email");
		int result=1;
		if(service.findBy(id)==null){
			result=0;
		}else {
			result=service.findBy(id).getEmail().equals(email)?1:0;			
		}
		resp.getWriter().print(result);
	}
	
}
