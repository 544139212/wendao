/**
 * 
 */
package com.example.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;



/**
 * @author Administrator
 *
 */
public class LoginFailureHandler implements AuthenticationFailureHandler {

	/* (non-Javadoc)
	 * @see org.springframework.security.web.authentication.AuthenticationFailureHandler#onAuthenticationFailure(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.springframework.security.core.AuthenticationException)
	 */
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException exception)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String flag = "FAIL_REASON_NONE";
		if (exception != null) {
			if (exception instanceof DisabledException) {
				flag = "FAIL_REASON_DISABLED";
			}
			if (exception instanceof BadCredentialsException) {
				flag = "FAIL_REASON_BAD_CREDENTIALS";
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/fail?email=" + email + "&password=" + password + "&flag=" + flag);
 	}

}
