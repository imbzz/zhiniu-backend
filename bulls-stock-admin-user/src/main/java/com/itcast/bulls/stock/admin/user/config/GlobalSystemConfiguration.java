package com.itcast.bulls.stock.admin.user.config;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.context.annotation.Configuration;

import com.itcast.bulls.stock.admin.user.repository.biz.AuthorityNoLimitUriRepository;
import com.itcast.bulls.stock.common.utils.GlobalConstants;
import com.itcast.bulls.stock.entity.user.AuthorityNoLimitUri;

import lombok.extern.log4j.Log4j2;

/**
 * <p>Description: </p>
 * @date 2019/7/26
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
@Configuration
@Log4j2
public class GlobalSystemConfiguration implements ApplicationRunner {

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private AuthorityNoLimitUriRepository authorityNoLimitUriRepository;

    /**
     * 容器启动后执行
     * @param args
     * @throws Exception
     */
    @Override
    public void run(ApplicationArguments args) throws Exception {

        log.info("enter GlobalSystemConfiguration run method...");
        // 加载公开菜单至缓存中
        Cache cache = cacheManager.getCache(GlobalConstants.AUTHORITY_MENU_KEY);
        List<AuthorityNoLimitUri> noLimitMenuList =  authorityNoLimitUriRepository.findAll();
        Set<String> noLimitSet = noLimitMenuList.stream().map(noLimit -> noLimit.getNoLimitUri()).collect(Collectors.toSet());
        cache.put(GlobalConstants.AUTHORITY_MENU_NO_LIMIT_KEY, noLimitSet);
    }
}
