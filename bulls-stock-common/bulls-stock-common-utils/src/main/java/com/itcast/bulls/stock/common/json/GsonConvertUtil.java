package com.itcast.bulls.stock.common.json;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 *  Gson封装工具
 */
public class GsonConvertUtil {

    /**
     * 采用单例模式, 需要保证线程安全性
     */
	private volatile static GsonConvertUtil singleton = null;

    /**
     * Gson解析对象
     */
	private Gson gson;

    /**
     * Gson封装工具的初始化， 主要处理JSON的解析配置
     */
	private GsonConvertUtil() {
	    // 1. 对日期做格式化处理
        // 2. 开启对MAP的解析转换支持， {key1: value1, key2:value2}
		gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").enableComplexMapKeySerialization().create();
	}

    /**
     * 单例的实现(做了线程安全处理)
     * @return
     */
	public static GsonConvertUtil getSingleton() {
    	
	    if (singleton == null) {  
	        synchronized (GsonConvertUtil.class) {
		        if (singleton == null) {
		        	singleton = new GsonConvertUtil();
		        }  
	        }  
	    }  
	    
	    return singleton;  
    }

    /**
     * 将JSON转为指定的JAVA对象，支持泛型传递
     * @param jsonStr
     * @param t
     * @param <T>
     * @return
     */
	public <T>  T cvtJson2Obj(String jsonStr, Class<T> t) {
		
		return gson.fromJson(jsonStr, t);
	}

    /**
     * 将JsonObject转换为指定的JAVA对象
     * @param jsonObj
     * @param t
     * @param <T>
     * @return
     */
	public <T>  T cvtJson2Obj(JsonObject jsonObj, Class<T> t) {
		
		return gson.fromJson(jsonObj, t);
	}


    /**
     * 将JSON转换为List对象
     * Usage: Type type = new TypeToken<List<obj>>() {}.getType();
     * @param jsonObj
     * @param type
     * @param <T>
     * @return
     */
    public <T> List<T> cvtJson2List(String jsonObj, Class<T[]> clazz) {
        T[] arr = gson.fromJson(jsonObj, clazz);
        return Arrays.asList(arr);
    }


    /**
     * 将JSON字符串转换为MAP对象
     * @param json
     * @return
     */
	public Map<String, String> cvtJson2Map(String json) {
		return gson.fromJson(json, new TypeToken<Map<String, String>>() {
		}.getType());
	}
	
	/**
	 * 对象转换为JSON
	 * @param obj
	 * @return
	 */
	public String cvtObj2Json(Object obj) {
		return gson.toJson(obj);
	}
	
	/**
	 * 采用GSON的解析方式获取JSON某属性
	 * 方法用途: <br>
	 * 实现步骤: <br>
	 * @param jsonStr
	 * @param name
	 * @return
	 */
	public String getJsonProp(String jsonStr, String name) {

		JsonParser parser = new JsonParser();
		JsonElement jsonEl = parser.parse(jsonStr);
		JsonObject jsonObj = jsonEl.getAsJsonObject();
		return jsonObj.get(name).getAsString();
	}

    /**
     * 获取JsonObject对象
     * @param jsonObject
     * @return
     */
	public JsonObject getJsonObject(String jsonObject) {
		JsonParser parser = new JsonParser();
		return parser.parse(jsonObject).getAsJsonObject();
	}

    /**
     * 获取JsonArray对象
     * @param jsonObject
     * @return
     */
	public JsonArray getJsonArray(String jsonObject) {
        JsonParser parser = new JsonParser();
        return parser.parse(jsonObject).getAsJsonArray();
    }

	/**
	 * 生成包含参数名值对的Json字符串
	 * @param paramNameList
	 * @param paramValueList
	 * @return
	 */
	public String generateParamJsonData(String[] paramNameList, Object[] paramValueList) {

		JsonObject jsonObj = new JsonObject();
		for(int i=0; i<paramNameList.length;i++){
			if (paramValueList[i] instanceof String){
				jsonObj.addProperty(paramNameList[i], String.valueOf(paramValueList[i]));
			} else{
				jsonObj.addProperty(paramNameList[i], cvtObj2Json(paramValueList[i]));
			}
		}
		return gson.toJson(jsonObj);
	}

	/**
	 * 从指定 jsonObject 中找出 subJsonName 命名的子对象
	 * @param jsonObject
	 * @param subJsonName
	 * @param t 子对象class类型
	 * @return
	 */
	public  <T>  T cvtSubJson2Obj(JsonObject jsonObject, String subJsonName,
			Class<T> t) {
		String param = jsonObject.getAsJsonPrimitive(subJsonName).getAsString();
		return cvtJson2Obj(param,t);
	}

    public static void main(String[] args) {

        System.out.println(GsonConvertUtil.getSingleton().cvtJson2Map("{'a':1, 'b':2}"));

    }

}
