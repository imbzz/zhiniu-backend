package com.itcast.bulls.stock.admin.user.controller;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import com.itcast.bulls.stock.entity.user.AuthorityUser;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * <p>Description: </p>
 * @date 2020/1/10
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class BaseController {


    /**
     * 获取当前请求的token
     * @return
     */
    protected String getCurrentToken() {

        return null;
    }

    /**
     * 返回用户ID
     * @return
     */
    protected Long getUserId() throws ComponentException {


        return null;
    }

    /**
     * 获取当前登陆的用户信息
     * @return
     * @throws ComponentException
     */
    protected AuthorityUser getUser() throws ComponentException {
        HttpSession session  = getSession();
        AuthorityUser  authorityUser = (AuthorityUser) session.getAttribute(session.getId());
        if(null == authorityUser) {
            // 用户不存在， 则抛出异常
            throw new ComponentException(ApplicationErrorCodeEnum.ADMIN_USER_NEED_LOGIN);
        }

        return authorityUser;
    }

    /**
     * 从上下文中获取session对象
     * @return
     */
    protected  HttpSession getSession() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
    }

    /**
     * 获取客户端真实IP
     * @param request  客户端request
     * @return   客户端IP
     */
    protected static String getClientIP(){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        // 先从头部获取
        String ip = request.getHeader("x-forwarded-for");
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            // 直接获取IP
            ip = request.getRemoteAddr();

            if(ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")){
                //根据网卡获取本机配置的IP地址
                InetAddress inetAddress = null;
                try {
                    inetAddress = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ip = inetAddress.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实的IP地址，多个IP按照','分割
        if(null != ip && ip.length() > 15){
            if(ip.indexOf(",") > 0){
                ip = ip.substring(0, ip.indexOf(","));
            }
        }
        return ip;
    }
}
