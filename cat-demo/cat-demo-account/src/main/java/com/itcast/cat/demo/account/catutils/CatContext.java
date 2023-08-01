package com.itcast.cat.demo.account.catutils;

import com.dianping.cat.Cat;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Description: </p>
 * @date 2019/12/19
 * @author 贺锟 
 * @version 1.0
 * <p>Copyright:Copyright(c)2019</p>
 */
public class CatContext implements Cat.Context {

    /**
     * 属性的记录
     */
    private Map<String, String> properties = new HashMap<>();

    @Override
    public void addProperty(String key, String value) {
        properties.put(key, value);
    }

    @Override
    public String getProperty(String key) {
        return properties.get(key);
    }
}
