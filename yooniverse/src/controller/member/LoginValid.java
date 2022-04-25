package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberServiceImpl;

@WebServlet("/loginValid")
public class LoginValid extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		int result=new MemberServiceImpl().login(id,pwd)==true?1:0;
		resp.getWriter().print(result);
	}
}
