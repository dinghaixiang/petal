package com.maiya.web.interceptor;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

/**
 * Created by beck on 2016/11/16.
 */
public class LoginInterceptor extends AbstractInterceptor {
    private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    /**
     * Called to let an interceptor clean up any resources it has allocated.
     */
    public void destroy() {

    }

    /**
     * Called after an interceptor is created, but before any requests are processed using
     * {@link #intercept(ActionInvocation) intercept} , giving
     * the Interceptor a chance to initialize any needed resources.
     */
    public void init() {
      logger.info("interceptor init...........");
    }

    /**
     * Allows the Interceptor to do some processing on the request before and/or after the rest of the processing of the
     * request by the {@link ActionInvocation} or to short-circuit the processing and just return a String return code.
     *
     * @param invocation the action invocation
     * @return the return code, either returned from {@link ActionInvocation#invoke()}, or from the interceptor itself.
     * @throws Exception any system-level error, as defined in {@link Action#execute()}.
     */
    public String intercept(ActionInvocation invocation) throws Exception {
        logger.debug("intercept","come on");
        HttpSession session= ServletActionContext.getRequest().getSession();
        Object value= session.getAttribute("studentLogin");
        if(value==null){
            return "fail";
        }
        return invocation.invoke();
    }
}
