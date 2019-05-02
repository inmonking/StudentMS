package com.shs.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "shs_search.jsp";
		String name = null;
		int search_cnt = 0;
		if((name = request.getParameter("name"))!=null) {
			MemberDAO mDao =MemberDAO.getInstance();
			List<MemberDTO> list = mDao.memSelect(name);
			search_cnt = list.size();
			request.setAttribute("shslist", list);
			request.setAttribute("name", name);
		}
		request.setAttribute("search_cnt", search_cnt);
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);

		
		return forward;
	}

}
