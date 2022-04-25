package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberServiceImpl;

@WebServlet("/preventDup")
public class PreventDup extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		-- 0 가입 가능
//        -- 1 아이디 중복
//        -- 2 이메일 중복
//        -- 3 아이디, 이메일 중복
		
		String id=req.getParameter("id");
		String email=req.getParameter("email");
		int result=new MemberServiceImpl().memberValid(email,id);
		resp.getWriter().print(result);
	}
	
}
