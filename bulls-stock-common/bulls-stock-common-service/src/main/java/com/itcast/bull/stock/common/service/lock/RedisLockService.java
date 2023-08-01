package com.itcast.bull.stock.common.service.lock;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.common.exception.constants.ApplicationErrorCodeEnum;
import lombok.extern.log4j.Log4j2;
import org.springframework.integration.redis.util.RedisLockRegistry;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;

@Log4j2
public class RedisLockService {

    private RedisLockRegistry redisLockRegistry;

    private int waitTime;


    /**
     * 初始化
     * @param redisLockRegistry
     * @param waitTime
     */
    public RedisLockService(RedisLockRegistry redisLockRegistry, int waitTime) {
        this.redisLockRegistry = redisLockRegistry;
        this.waitTime = waitTime;
    }

    /**
     * 尝试加锁， 不成功， 则抛出异常
     * @return
     * @throws ComponentException
     */
    public boolean tryLock(Object key) throws ComponentException {
        try {
            Lock lock = redisLockRegistry.obtain(String.valueOf(key));
            boolean isLock = lock.tryLock(waitTime, TimeUnit.SECONDS);
            if(!isLock) {
                throw new ComponentException(ApplicationErrorCodeEnum.WAITING_UNLOCK);
            }
            return isLock;
        }catch(ComponentException e) {
            throw e;
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            throw new ComponentException(ApplicationErrorCodeEnum.TRY_LOCK_FAIL);
        }

    }


    /**
     * 解锁处理
     * @return
     * @throws ComponentException
     */
    public void unlock(Object key){
        try {
            Lock lock = redisLockRegistry.obtain(String.valueOf(key));
            lock.unlock();
        }catch(Exception e) {
            log.error(e.getMessage(), e);
        }
    }
}
