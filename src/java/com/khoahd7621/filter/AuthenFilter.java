package com.khoahd7621.filter;

import com.khoahd7621.model.Account;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KhoaHD7621
 */
public class AuthenFilter implements Filter {

    private static List<String> ADMIN_LIST;
    private static List<String> USER_LIST;
    private static final String HOME = "HomeController";
    private static final String AD_HOME = "AdminHomeController";
    private static final String US_HOME = "UserHomeController";
    private static final int AD = 1;
    private static final int US = 0;

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public AuthenFilter() {
        ADMIN_LIST = new ArrayList<>();
        ADMIN_LIST.add("admin.jsp");
        ADMIN_LIST.add("admininfo.jsp");
        ADMIN_LIST.add("sendMail.jsp");
        ADMIN_LIST.add("manageAccount.jsp");
        ADMIN_LIST.add("manageCategory.jsp");
        ADMIN_LIST.add("manageOrder.jsp");
        ADMIN_LIST.add("managePlant.jsp");
        ADMIN_LIST.add("LogoutController");
        ADMIN_LIST.add("AdminHomeController");
        ADMIN_LIST.add("AdminInfoController");
        ADMIN_LIST.add("AdminManageAccountController");
        ADMIN_LIST.add("AdminManageCategoryController");
        ADMIN_LIST.add("AdminManageOrderController");
        ADMIN_LIST.add("AdminManagePlantController");
        ADMIN_LIST.add("ChangeOrderController");
        ADMIN_LIST.add("UpdateAccountController");
        ADMIN_LIST.add("UpdateCategoryController");
        ADMIN_LIST.add("UpdatePlantController");
        ADMIN_LIST.add("AdminSearchOrderController");
        ADMIN_LIST.add("SendEmailController");

        USER_LIST = new ArrayList<>();
        USER_LIST.add("user.jsp");
        USER_LIST.add("about.jsp");
        USER_LIST.add("order.jsp");
        USER_LIST.add("orderDetail.jsp");
        USER_LIST.add("plantDetail.jsp");
        USER_LIST.add("product.jsp");
        USER_LIST.add("LogoutController");
        USER_LIST.add("HomeController");
        USER_LIST.add("SearchOrderController");
        USER_LIST.add("UpdateUserController");
        USER_LIST.add("UpdateOrderController");
        USER_LIST.add("UserHomeController");
        USER_LIST.add("UserViewOrderController");
        USER_LIST.add("UserViewOrderDetailController");
        USER_LIST.add("AddToCartController");
        USER_LIST.add("CartController");
        USER_LIST.add("DeleteCartController");
        USER_LIST.add("UpdateCartQuantityController");
        USER_LIST.add("CheckOutController");
        USER_LIST.add("ViewAllController");
        USER_LIST.add("SearchController");
        USER_LIST.add("AboutUsController");
        USER_LIST.add("LoadMoreController");
        USER_LIST.add("AddToCartAsyncController");
        USER_LIST.add("PlantDetailController");
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthenFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            // Pass .jpg, .pgn, .gif, .css files
            if (uri.contains(".jpg") || uri.contains(".png") || uri.contains(".gif") || uri.contains(".css")) {
                chain.doFilter(request, response);
                return;
            }
            // Pass .js files
            int indexJs = uri.lastIndexOf(".");
            String jsSource = uri.substring(indexJs + 1);
            if (jsSource.equals("js")) {
                chain.doFilter(request, response);
                return;
            }
            // If first time access web, it will call LoginController
            int index = uri.lastIndexOf("/");
            String resource = uri.substring(index + 1);
            if (resource.isEmpty() || resource.equals("")) {
                res.sendRedirect("LoginController");
                return;
            }
            HttpSession session = req.getSession();
            if (session != null && session.getAttribute("LOGIN_USER") != null) {
                // Authentication if logged in
                Account account = (Account) session.getAttribute("LOGIN_USER");
                int role = account.getRole();
                if (role == AD) {
                    if (ADMIN_LIST.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(AD_HOME);
                    }
                } else if (role == US) {
                    if (USER_LIST.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect(US_HOME);
                    }
                }
            } else {
                if (uri.contains("AboutUsController")
                        || uri.contains("AddToCartController")
                        || uri.contains("CartController")
                        || uri.contains("CheckOutController")
                        || uri.contains("DeleteCartController")
                        || uri.contains("LoadMoreController")
                        || uri.contains("LoginController")
                        || uri.contains("PlantDetailController")
                        || uri.contains("RegistrationController")
                        || uri.contains("SearchController")
                        || uri.contains("UpdateCartQuantityController")
                        || uri.contains("login.jsp")
                        || uri.contains("about.jsp")
                        || uri.contains("HomeController")
                        || uri.contains("ViewAllController")
                        || uri.contains("SendEmailController")
                        || uri.contains("AddToCartAsyncController")) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect(HOME);
                }
            }
        } catch (Exception e) {
            log("Error at AuthenFilter: " + e.toString());
        }

    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthenFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthenFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthenFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
