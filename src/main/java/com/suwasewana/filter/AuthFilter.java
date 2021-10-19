package com.suwasewana.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "authFilter" )
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        chain.doFilter(request, response);
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = ((HttpServletRequest) request).getSession(false);
        String loginURI = ((HttpServletRequest) request).getContextPath() + "/s/login";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = ((HttpServletRequest) request).getRequestURI().equals(loginURI);

        if (loggedIn || loginRequest) {
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse) response).sendRedirect(loginURI);
        }
    }

}
