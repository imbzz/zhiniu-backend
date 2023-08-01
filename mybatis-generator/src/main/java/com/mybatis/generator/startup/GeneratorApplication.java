package com.mybatis.generator.startup;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>Description: 代码生成器的启动类 </p>
 * @date 2020/1/3
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class GeneratorApplication {


    public static void main(String[] args) {
        try {
            // 注意windows下， 如果代码读取targetProject配置进行输出, 则需要加上工程名， targetProject="mybatis-generator\output"，如果通过MAVEN PLUGIN生成不用加工程名

            // 记录生成过程中的警告信息
            List<String> warnings = new ArrayList<String>();

            boolean overwrite = true;
            // 配置转换器
            ConfigurationParser cp = new ConfigurationParser(warnings);
            // 获取具体的代码生成配置规则
            Configuration config = cp.parseConfiguration(GeneratorApplication.class.getClassLoader().getResourceAsStream("generatorConfig_pgSql.xml"));
            // 回调方法
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            // 创建mybatis generator生成器
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
            // 开始执行代码的生成
            myBatisGenerator.generate(null);
            // 打印输出的警告信息
            if(warnings.size() >0 ) {
                System.out.println("Warnning Msg :");
                for(String warn : warnings) {
                    System.out.println(warn);
                }
            }

        } catch (Exception e) {
            // 捕获异常
            e.printStackTrace();
        }

    }
}
