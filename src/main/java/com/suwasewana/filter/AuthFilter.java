package com.suwasewana.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

    @WebFilter({ "/servlet1", "/servlet2", "/servlet3" })
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        chain.doFilter(request, response);
        response.getWriter().println("Hanssana Ranaweera filter");
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = ((HttpServletRequest) request).getSession(false);
        String loginURI = ((HttpServletRequest) request).getContextPath() + "/s/login";

        boolean loggedIn = session != null && session.getAttribute("user") != null;
        boolean loginRequest = ((HttpServletRequest) request).getRequestURI().equals(loginURI);
        String uNic = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("unic")) uNic = cookie.getValue();
            }
        }
        System.out.println(uNic);
        res.getWriter().println(uNic);

        if (uNic != "") {
            chain.doFilter(request, response);
            System.out.println(uNic);
        } else {
//            ((HttpServletResponse) response).sendRedirect(loginURI);
            System.out.println("login");

        }




//        if (uNic != null || uNic != "" ) {
//            chain.doFilter(request, response);
//        } else {
//            ((HttpServletResponse) response).sendRedirect(loginURI);
//        }
    }

}
