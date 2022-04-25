package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/informId")
public class InformId extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService service=new MemberServiceImpl();
		req.setAttribute("member", service.findBy(req.getParameter("id")));
		req.getRequestDispatcher("/WEB-INF/jsp/member/informId.jsp").forward(req, resp);
	}

}
