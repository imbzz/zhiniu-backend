package com.itcast.bulls.stock.starter.ceph;

import org.javaswift.joss.client.factory.AccountConfig;
import org.javaswift.joss.client.factory.AccountFactory;
import org.javaswift.joss.client.factory.AuthenticationMethod;
import org.javaswift.joss.model.Account;
import org.javaswift.joss.model.Container;
import org.javaswift.joss.model.StoredObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.InputStream;
import java.lang.invoke.MethodHandles;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
public class CephSwiftOperator {
    private static final Logger log = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());
    /**
     * 用户连接名称, 格式: 主用户名:子用户名
     */
    private String username;

    /**
     * 用户连接的密码信息
     */
    private String password;


    /**
     * 接口的访问地址
     */
    private String authUrl;

    /**
     * 默认存储的容器名称
     */
    private String defaultContainerName;

    /**
     * Ceph的账户操作对象
     */
    private Account account;

    /**
     * Ceph的容器操作对象
     */
    private Container container;


    /**
     * Ceph集群的连接初始化配置
     */
    public CephSwiftOperator(String username, String password, String authUrl, String defaultContainerName) {
        this.username = username;
        this.password = password;
        this.authUrl = authUrl;
        this.defaultContainerName = defaultContainerName;
        init();
    }

    public void init() {
        try {
            // 1. 设置Ceph的账户连接配置信息
            AccountConfig config = new AccountConfig();
            config.setUsername(username);
            config.setPassword(password);
            config.setAuthUrl(authUrl);
            config.setAuthenticationMethod(AuthenticationMethod.BASIC);
            account  = new AccountFactory(config).createAccount();

            // 2. 获取容器操作对象
            Container newContainer =  account.getContainer(defaultContainerName);
            if(!newContainer.exists()) {
                container = newContainer.create();
                log.info("container create ==> " + defaultContainerName);
            }else {
                container = newContainer;
                log.info("container exists! ==> " + defaultContainerName);
            }
        }catch(Exception e ) {
            log.error("Ceph连接初始化异常: " + e.getMessage());
        }
    }
    /**
     * 文件上传的处理接口
     * @param remoteName
     * @param filePath
     */
    public void createObject(String remoteName, String filePath) {
        // 1. 从容器当中获取远程存储对象信息
        StoredObject object = container.getObject(remoteName);
        // 2. 执行文件的上传处理
        object.uploadObject(new File(filePath));
    }

    /**
     * 文件上传的处理接口(字节数组形式)
     * @param remoteName
     * @param inputStream
     */
    public void createObject(String remoteName, byte[] inputStream) {
        // 1. 从容器当中获取远程存储对象信息
        StoredObject object = container.getObject(remoteName);
        // 2. 执行文件的上传处理
        object.uploadObject(inputStream);
    }

    /**
     * 文件的下载处理接口
     * @param objectName
     * @param outPath
     */
    public void retrieveObject(String objectName, String outPath) {
        // 1. 从容器当中获取远程对象信息
        StoredObject object = container.getObject(objectName);
        // 2. 执行文件的下载方法
        object.downloadObject(new File(outPath));
    }


    /**
     * 下载文件, 转换为文件流的形式
     * @param objectName
     * @return
     */
    public InputStream retrieveObject(String objectName) {
        // 1. 从容器当中获取远程对象信息
        StoredObject object = container.getObject(objectName);
        // 2. 执行文件的下载方法
        return object.downloadObjectAsInputStream();
    }

    /**
     * 删除指定的文件对象
     * @param objectName
     * @return
     */
    public boolean deleteObject(String objectName) {
        try {
            StoredObject object = container.getObject(objectName);
            object.delete();
            return !object.exists();
        }catch(Exception e) {
            log.error("Ceph删除文件失败: " + e.getMessage());
        }
        return false;
    }

    /**
     * 获取用户下面的所有容器信息
     * @return
     */
    public List listContainer() {
        List list = new ArrayList();
        Collection<Container> containers = account.list();
        for(Container container : containers) {
            list.add(container.getName());
            log.info("current container name: " + container.getName());
        }
        return list;
    }

 }
