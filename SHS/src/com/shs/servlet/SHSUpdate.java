package com.shs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSUpdate
 */
@WebServlet("/SHSUpdate")
public class SHSUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET: 학생수정페이지 출력");
		String id = request.getParameter("id");
		System.out.println("id="+id);
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.memInfo(id);
		System.out.println(mDto.toString());
		RequestDispatcher dis = request.getRequestDispatcher("shs_update.jsp");
		request.setAttribute("mDto", mDto);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		int sid = Integer.parseInt(request.getParameter("input_id"));
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");
		MemberDTO mDto = new MemberDTO(sid, sname, sage, smajor, sphone, null);
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
		if(result>0) {
			response.sendRedirect("SHSSelect");
		}else {
			response.sendRedirect("SHSUpdate?");
		}
	}

}
