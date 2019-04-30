package com.shs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.action.Action;
import com.shs.action.ActionForward;
import com.shs.action.IndexAction;

/**
 * Servlet implementation class FrontController
 */
//FrontController 패턴
//앞단에서 Controller 역할을 하는 Servlet 1개만
//생성 후 생성된 1개의 Servlet이 request와 response를
//모두 처리하고, 실제 동작하는 Action부분만 Class로
//여러개 생성해서 사용하는 방법
//기존에 동작마다 Servlet을 생성하던 방식에 비해
//효율성이 매우 Up 됨.
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

//    doGet(), doPost() 모두 service()로 통해서 작동하게
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		한글깨짐 방지
		request.setCharacterEncoding("UTF-8");
		Action action = null;
		ActionForward forward = null;
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
//		uri에서 ctx를 빼면 내가 원하는 소스만 뽑을 수 있다.
		
		System.out.println("페이지 이동 ===>"+ command);
		
		if(command.equals("/index.shs")) {
			action = new IndexAction();
			forward = action.execute(request, response);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
