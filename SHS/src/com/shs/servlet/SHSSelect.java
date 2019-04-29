package com.shs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSSelect
 */
@WebServlet("/SHSSelect")
public class SHSSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSSelect() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET:출석부 페이지 출력");
		MemberDAO mDao =MemberDAO.getInstance();
		List<MemberDTO> list = mDao.memSelect();
		request.setAttribute("shslist", list);
		RequestDispatcher dis = request.getRequestDispatcher("shs_select.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
