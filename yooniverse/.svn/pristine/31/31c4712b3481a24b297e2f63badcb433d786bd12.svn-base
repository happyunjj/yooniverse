package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.MemberService;
import service.MemberServiceImpl;
import vo.Member;

@WebServlet("/findId")
public class FindId extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/findId.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service = new MemberServiceImpl();
		String email=req.getParameter("email");
		String id=service.findByEmail(email).getId();
		
		resp.sendRedirect("informId?id="+id);
		
	}

}
