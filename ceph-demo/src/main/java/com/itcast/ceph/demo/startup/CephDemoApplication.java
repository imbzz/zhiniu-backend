package com.itcast.ceph.demo.startup;

import com.itcast.ceph.demo.service.CephOperator;
import com.itcast.ceph.demo.service.SwiftOperator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

/**
 * <p>Description: </p>
 * @date
 * @author
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
@SpringBootApplication
@ComponentScan(basePackages = {"com.itcast"})
public class CephDemoApplication {


    public static void main(String[] args) throws Exception  {
        swiftApi();
    }

    /**
     *  Rados Api的封装处理
     * @throws Exception
     */
    public static void radosApi(String[] args) throws Exception  {
        System.out.println("start....");
        String username = "admin";
        String monIp = "10.10.20.11:6789;10.10.20.12:6789;10.10.20.13:6789";
        String userKey = "AQBZBypdMchvBRAAbWVnIGyYNvxWQZ2UkuiYew==";
        String mountPath = "/";
        CephOperator cephOperate = null;
        try {
            String opt = (args == null || args.length < 1)? "" : args[0];
            cephOperate = new CephOperator(username, monIp, userKey, mountPath);
            if("upload".equals(opt)) {
                cephOperate.uploadFileByPath("/temp_upload_fs", args[1]);
            }else if("download".equals(opt)) {
                cephOperate.downloadFileByPath("/temp_download_fs", args[1]);
            }else {
                System.out.println("Unrecognized Command! Usage  opt[upload|download] filename[path]!");
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            if(null != cephOperate) {
                cephOperate.umount();
            }
        }
        System.out.println("end....");

    }

    /**
     * 通过Swift方式, 操作Ceph集群
     * @throws Exception
     */
    public static void swiftApi() throws Exception {
        // 1. 打印列出用户的所有容器信息
        ConfigurableApplicationContext appContext = SpringApplication.run(CephDemoApplication.class);
        SwiftOperator swiftOperator = appContext.getBean(SwiftOperator.class);
        swiftOperator.listContainer();

        // 2. 上传指定的文件
        String objName = "test_ceph";
        swiftOperator.createObject(objName, "d:/test_swift_ceph.txt");

        // 3. 从Ceph下载文件到指定的路径下面
        swiftOperator.retrieveObject(objName, "e:/test.txt");

        System.out.println("complete");
    }

}
