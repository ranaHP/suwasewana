package com.suwasewana.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

    @WebFilter({ "/servlet1", "/servlet2", "/servlet3" , "/test" })
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

        String loginURI = ((HttpServletRequest) request).getContextPath() + "/s/login";
        System.out.println("login url " + loginURI);

        String uDetails = "";
        Cookie[] cookies = req.getCookies();
        if(cookies !=null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("uDetails")) uDetails = cookie.getValue();
            }
        }
        System.out.println(uDetails);
        res.getWriter().println(uDetails);

        if (uDetails != "") {
            System.out.println(uDetails);
            chain.doFilter(request, response);
        } else {
            ((HttpServletResponse) response).sendRedirect(loginURI);
            System.out.println("login");
        }
    }

}
