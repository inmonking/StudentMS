package com.shs.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class SelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "shs_select.jsp";
		MemberDAO mDao =MemberDAO.getInstance();
		List<MemberDTO> list = mDao.memSelect();
		request.setAttribute("shslist", list);
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
