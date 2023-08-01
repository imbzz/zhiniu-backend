package com.itcast.bulls.stock.common.generator;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

/**
 * <p>Description: </p>
 *
 * @author 贺锟
 * @version 1.0
 * @date 2019/8/19
 * @name Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
public class DateUtils {

    /**
     * 格式化日期， 标准格式
     */
    private static final String FMT_STANDARD = "yyyy-MM-dd HH:mm:ss";
    /**
     * 格式化日期, 格式: yyyyMMdd
     */
    private static final String FMT_YYYYMMDD = "yyyyMMdd";


    /**
     * 拼装时间转换为时间戳(精确到秒)， 默认置为东八时区
     *
     * @param date
     * @param time
     * @return
     */
    public static Long cvt2Long(Date date) {
        return date.getTime();
    }

    /**
     * 指定分钟与当前时间比较
     *
     * @param mins
     * @return
     */
    public static boolean compareMins(Long mins) {
        Calendar calendar = Calendar.getInstance();
        int hours = calendar.get(Calendar.HOUR_OF_DAY);
        int minutes = calendar.get(Calendar.MINUTE);
        if (minutes + hours * 60 > mins) {
            return true;
        }
        return false;
    }


    /**
     * 指定分钟与当前时间比较， 返回差值
     *
     * @param mins
     * @return
     */
    public static int compareMinsDiff(int mins) {
        Calendar calendar = Calendar.getInstance();
        int hours = calendar.get(Calendar.HOUR_OF_DAY);
        int minutes = calendar.get(Calendar.MINUTE);
        int now = minutes + hours * 60;
        return now - mins;
    }

    /**
     * 获取上一天的时间戳， 从0点开始
     *
     * @return
     */
    public static long getLastDaytime() {

        long lastDaytime = LocalDateTime.now().minusDays(1)
                .withHour(0)
                .atZone(ZoneId.systemDefault())
                .toInstant().truncatedTo(ChronoUnit.HOURS).toEpochMilli();
        return lastDaytime;
    }

    /**
     * 获取指定日期当天时间范围
     *
     * @param specialDay
     * @return
     */
    public static Timestamp[] getDayRangeTimestamp(String specialDay) {
        return new Timestamp[]{Timestamp.valueOf(specialDay + " 00:00:00"), Timestamp.valueOf(specialDay + " 23:59:59")};
    }

    /**
     * 获取格式化的今天开始时间
     *
     * @return
     */
    public static Timestamp getFmtTodayStart() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return Timestamp.valueOf(LocalDateTime.now().withHour(0).withMinute(0).withSecond(0).format(formatter));
    }

    /**
     * 获取格式化的今天结束时间
     *
     * @return
     */
    public static Timestamp getFmtTodayEnd() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return Timestamp.valueOf(LocalDateTime.now().format(formatter));
    }


    /**
     * 将时间戳转换为timestamp对象
     * @param timeMills
     * @return
     */
    public static Timestamp parse2Timestamp(long timeSeconds) {

        Instant instant = Instant.ofEpochSecond(timeSeconds);
        ZoneId zone = ZoneId.systemDefault();
        return Timestamp.valueOf(LocalDateTime.ofInstant(instant, zone));
    }

    /**
     * 获取当天的格式化日期（格式： yyyy-MM-dd）
     *
     * @return
     */
    public static String getFmtToday() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return LocalDateTime.now().format(formatter);
    }


    /**
     * 获取当天的时间戳
     *
     * @return
     */
    public static long getCurDaytime() {
        long lastDaytime = LocalDateTime.now()
                .withHour(0)
                .atZone(ZoneId.systemDefault())
                .toInstant().truncatedTo(ChronoUnit.HOURS).toEpochMilli();
        return lastDaytime;
    }

    /**
     * 根据时间戳格式化日期
     * @param datetime
     * @return
     */
    public static String getFmtDateByTime(long datetime) {
        Instant instant = Instant.ofEpochMilli(datetime);
        ZoneId zone = ZoneId.systemDefault();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return dtf.format(LocalDateTime.ofInstant(instant, zone));
    }


    /**
     * 根据时间戳格式化日期
     * @param datetime
     * @return
     */
    public static String getFmtDateBySeconds(long seconds) {
        Instant instant = Instant.ofEpochSecond(seconds);
        ZoneId zone = ZoneId.systemDefault();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return dtf.format(LocalDateTime.ofInstant(instant, zone));
    }

    /**
     * 格式化日期（格式：yyyy-MM-dd HH:mm:ss）
     * @param date
     * @return
     */
    public static String getFmtDatetime(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat();
        return sdf.format(date);
    }

    /**
     * 将指定时间转为时间戳
     * @param datetime
     * @return
     */
    public static Long parse2TimeMillis(String datetime) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return LocalDateTime.parse(datetime, dtf).atZone(ZoneId.systemDefault())
                .toInstant().toEpochMilli();
    }


    /**
     * 将指定时间转为时间戳
     * @param datetime
     * @return
     */
    public static Long parse2TimeSeconds(String datetime) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern(FMT_STANDARD);
        return LocalDateTime.parse(datetime, dtf).atZone(ZoneId.systemDefault())
                .toEpochSecond();
    }

    /**
     * 获取格式化日期: yyyyMMdd
     * @return
     */
    public static String getFmtDay() {
        SimpleDateFormat sdf = new SimpleDateFormat(FMT_YYYYMMDD);
        return sdf.format(new Date());
    }

    public static void main(String[] args) throws Exception {
//        System.out.println(getLastDaytime());
//        SimpleDateFormat sdf = new SimpleDateFormat(FMT_STANDARD);
//        System.out.println(sdf.parse("2019-08-20 00:00:00").getTime());
//        System.out.println(getDayRangeTimestamp("2019-08-6")[0]);

//        System.out.println(getFmtDateByTime(parse2TimeMillis("2019-08-28 00:27:16")));

        Long timemills = 1566923236L;
        System.out.println(parse2Timestamp(timemills));
        // 1566403200
        // 1566489599

        System.out.println(parse2TimeSeconds("2019-12-13 17:23:12"));

        System.out.println(parse2TimeSeconds("2020-01-06 17:23:12"));

    }

}
