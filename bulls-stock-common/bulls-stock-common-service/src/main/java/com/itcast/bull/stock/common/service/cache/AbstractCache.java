package com.itcast.bull.stock.common.service.cache;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public abstract class AbstractCache<K, V> {

    /**
     * 缓存数据
     */
    protected Map<K, V> DATA_CACHE = new ConcurrentHashMap<>();

    /**
     * 获取缓存对象
     * @param key
     * @return
     */
    public V get(K key) {
        return DATA_CACHE.get(key);
    }

    /**
     * 获取所有的KEY
     * @return
     */
    public Set<K> getKeys() {
        return DATA_CACHE.keySet();
    }


    /**
     * 加载缓存
     */
   public abstract void loadCache();
}
