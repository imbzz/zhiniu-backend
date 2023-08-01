package com.itcast.cat.demo.account.catutils;

import com.dianping.cat.Cat;
import com.dianping.cat.CatConstants;
import com.dianping.cat.message.Message;
import com.dianping.cat.message.Transaction;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * <p>Description: </p>
 * @date 2019/12/19
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class CatServletFilter implements Filter {

    private String[] urlPatterns = new String[0];

    /**
     * 初始化配置
     * @param filterConfig
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 获取初始化参数， CatHttpModuleUrlPatterns
        String patterns = filterConfig.getInitParameter("CatHttpModuleUrlPatterns");
        if (patterns != null) {
            patterns = patterns.trim();
            urlPatterns = patterns.split(",");
            for (int i = 0; i < urlPatterns.length; i++) {
                urlPatterns[i] = urlPatterns[i].trim();
            }
        }
    }


    /**
     * 请求过滤处理
     * @param servletRequest
     * @param servletResponse
     * @param filterChain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        // 1. 做模块URL的匹配判断
        String url = request.getRequestURL().toString();
        for (String urlPattern : urlPatterns) {
            if (url.startsWith(urlPattern)) {
                url = urlPattern;
            }
        }

        // cat 上下文信息设置
        CatContext catContext = new CatContext();
        catContext.addProperty(Cat.Context.ROOT, request.getHeader(CatHttpConstants.CAT_HTTP_HEADER_ROOT_MESSAGE_ID));
        catContext.addProperty(Cat.Context.PARENT, request.getHeader(CatHttpConstants.CAT_HTTP_HEADER_PARENT_MESSAGE_ID));
        catContext.addProperty(Cat.Context.CHILD, request.getHeader(CatHttpConstants.CAT_HTTP_HEADER_CHILD_MESSAGE_ID));
        Cat.logRemoteCallServer(catContext);

        Transaction t = Cat.newTransaction(CatConstants.TYPE_URL, url);

        try {
            // cat日志记录
            Cat.logEvent("Service.method", request.getMethod(), Message.SUCCESS, request.getRequestURL().toString());
            Cat.logEvent("Service.client", request.getRemoteHost());

            filterChain.doFilter(servletRequest, servletResponse);

            t.setStatus(Transaction.SUCCESS);
        } catch (Exception ex) {
            t.setStatus(ex);
            Cat.logError(ex);
            throw ex;
        } finally {
            t.complete();
        }
    }



}
