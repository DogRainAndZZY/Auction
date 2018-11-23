package com.zzy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zzy.entity.Auction_user;

/**
 * �Զ���������
 * 
 * @author Carry
 * 
 */
public class AuthInterceptor implements HandlerInterceptor {

	@Override
	/**
	 * �ڽ��뵽����������֮ǰ����뵽�������
	 * �����Ҫ���У��ͷ���true������ͷ���false
	 */
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// ����¼���ܷ���
		HttpSession session = arg0.getSession();
		Auction_user user = (Auction_user) session.getAttribute("user");
		if (user != null) {
			// ˵���Ѿ���¼������
			return true;
		} else {
			String url = arg0.getRequestURI();
			// �ض��򵽵�¼ҳ��
			arg1.sendRedirect("login.jsp?url=" + url);
			return false;
		}

	}

	@Override
	/**
	 * ��������������ִ�����֮��return���ִ��֮ǰ
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	@Override
	/**
	 * ����������ִ�н���֮�󣬻���뵽���������
	 */
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

}
