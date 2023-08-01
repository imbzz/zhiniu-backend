package com.itcast.bull.stock.common.service.utils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

import java.util.HashSet;
import java.util.Set;

/**
 * <p>Description: </p>
 * @date 2019/8/19
 * @author 贺锟 
 * @version 1.0
 * @name mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
public class BeanAssistant {


    /**
     * 获取对象为null的属性
     * @param source
     * @return
     */
    public static Set<String> getNullPropertyNames (Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

        Set<String> emptyNames = new HashSet<String>();
        for(java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) emptyNames.add(pd.getName());
        }
        return emptyNames;
    }

    /**
     * 拷贝对象属性， 排除NULL值
     * @param src
     * @param target
     */
    public static void copyNotNullProps(Object src, Object target) {
        Set<String> emptyNames = getNullPropertyNames(src);
        BeanUtils.copyProperties(src, target, emptyNames.toArray(new String[emptyNames.size()]));
    }

    /**
     * 拷贝对象属性， 排除NULL值
     * @param src
     * @param target
     */
    public static void copyNotNullProps(Object src, Object target, String... excludeNames) {

        Set<String> emptyNames = getNullPropertyNames(src);
        for(String excludeName : excludeNames) {
            emptyNames.add(excludeName);
        }
        BeanUtils.copyProperties(src, target, emptyNames.toArray(new String[emptyNames.size()]));
    }
}
