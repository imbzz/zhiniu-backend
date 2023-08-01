package com.itcast.bulls.stock.common.math;

import java.math.BigDecimal;
import java.text.NumberFormat;

/**
 * <p>Description: </p>
 * @date 2019/8/6
 * @author 贺锟 
 * @version 1.0
 * @name  Mirson
 * <p>Copyright:Copyright(c)2019</p>
 */
public class MathUtils {

    //默认除法运算精度
    private static final int DEF_DIV_SCALE = 4;


    //工具类不可以实例化
    private MathUtils() {

    }

    /*
     * 提供精确的加法运算
     *@v1 被加数
     *@v2 加数
     *@return 两个参数的和
     */
    public static double add(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.add(b2).doubleValue();
    }

    /**
     * 长整型， 加法计算
     * @param v1
     * @param v2
     * @return
     */
    public static long add(long v1, long v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.add(b2).longValue();
    }

    /*
     *提供精确的减法运算
     *@v1 被减数
     *@v2 减数
     *@return 两个参数的差
     */
    public static double sub(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.subtract(b2).doubleValue();
    }

    public static long sub(long v1, long v2) {
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.subtract(b2).longValue();
    }

    /*
     *提供精确的乘法运算
     *@v1 被乘数
     *@v2 乘数
     *@return 两个参数的积
     */
    public static double mul(double v1, double v2) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.multiply(b2).doubleValue();
    }

    public static long mul(long v1, long v2) {
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.multiply(b2).longValue();
    }

    /**
     * 整型相乘， 保留2位小数
     * @param v1
     * @param v2
     * @return
     */
    public static long mul2Long(long v1, long v2) {
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.multiply(b2).divide(new BigDecimal("100")).longValue();
    }

    /**
     * 整型相乘， 保留指定精度
     * @param v1
     * @param v2
     * @return
     */
    public static long mul2Long(long v1, long v2, int scale) {
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.multiply(b2).divide(new BigDecimal(Math.pow(10, scale))).longValue();
    }

    public static double mul(double v1, double v2, int scale) {
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.multiply(b2).setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 格式化， 处理科学计数显示问题
     * @param v1
     * @return
     */
    public static String fmt(double v1, int scale) {
        NumberFormat nf = NumberFormat.getInstance();
        nf.setMaximumFractionDigits(scale);//设置保留多少位小数
        nf.setGroupingUsed(false);//取消科学计数法
        return nf.format(v1);
    }

    /*
     *提供相对精确的除法运算，当发生除不尽的情况时，精确到小数点以后10位，
     *以后的数字四舍五入
     *@v1 被除数
     *@v2 除数
     *@return 两个参数的商
     */
    public static double div(double v1, double v2) {
        return div(v1, v2, DEF_DIV_SCALE);
    }

    /*
     *提供相对精确的除法运算，当发生除不尽的情况时，有scale参数指定
     *精度，以后的数字四舍五入
     *@v1 被除数
     *@v2 除数
     *@scale 表示表示需要精确到小数点以后几位
     *@return 两个参数的商
     */
    public static double div(double v1, double v2, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP)
                .doubleValue();
    }

    public static long div2Long(double v1, double v2, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b1 = new BigDecimal(v1);
        BigDecimal b2 = new BigDecimal(v2);
        return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(Math.pow(10,scale)))
                .longValue();
    }

    /*
     *提供精确的小数位四舍五入处理
     *@v 需要四舍五入的数字
     *@scale 小数点后保留几位
     *@return 四舍五入后的结果
     */
    public static double round(double v, int scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b = new BigDecimal(Double.toString(v));
        BigDecimal one = new BigDecimal("1");
        return b.divide(one, scale, BigDecimal.ROUND_HALF_UP)
                .doubleValue();
    }

    /**
     * 将字符数值保留两位小数后转成长整型
     * @param value
     * @return
     */
    public static long round2Long(String value) {
        BigDecimal b = new BigDecimal(value);
        return b.setScale(DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).multiply( new BigDecimal("100")).longValue();
    }

    /**
     *  将双精度保留两位小数后转成长整型
     * @param value
     * @return
     */
    public static long round2Long(Double value) {
        BigDecimal b = new BigDecimal(value);
        return b.setScale(DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).multiply( new BigDecimal("100")).longValue();
    }

    /**
     * 将长整型转换为指定位数的浮点型
     * @param value
     * @param pos
     * @return
     */
    public static double round2Double(Long value, int pos){
        BigDecimal b = new BigDecimal(value);
        return b.divide(new BigDecimal(Math.pow(10, pos)), DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).doubleValue();
    }


    /**
     * 长整型求除， 精确至4位小数
     * @param total
     * @param per
     * @return
     */
    public static double div2Double(long total, long per){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 长整型求除， 精确指定小数位
     * @param total
     * @param per
     * @return
     */
    public static double div2Double(long total, long per, int scale){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 长整型求除， 保留2位小数（两个长整型都包含2位小数， 相除会有4位小数， 保留2位则需舍去2个小数位）
     * @param total
     * @param per
     * @return
     */
    public static long div2Long(long total, long per){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).multiply( new BigDecimal("100")).longValue();
    }

    /**
     *  长整型求除， 保留原始小数长度
     * @param total
     * @param per
     * @return
     */
    public static long divLong(long total, long per){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).longValue();
    }


    /**
     * 长整型求除， 保留指定位小数
     * @param total
     * @param per
     * @return
     */
    public static long div2Long(long total, long per, int scale){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).multiply( new BigDecimal(Math.pow(10,scale))).longValue();
    }

    /**
     * 双精度求除， 保留4位小数
     * @param total
     * @param per
     * @return
     */
    public static double div2Double(double total, double per){
        BigDecimal totalB = new BigDecimal(total);
        BigDecimal perB = new BigDecimal(per);
        return totalB.divide(perB, DEF_DIV_SCALE, BigDecimal.ROUND_HALF_UP).doubleValue();
    }


    /**
     * 计算佣金
     * @param amount
     * @param commissionRate
     * @return
     */
    public static long calcCommission(long amount, double commissionRate){
        return mul2Long(amount, round2Long(commissionRate), 4);
    }


    public static void main(String[] args) {


//        Double d = MathUtils.div(10040, MathUtils.mul(87.8402, 200000, 4), 4);
//
//
//        Double d2 = 0.0009;
//        NumberFormat nf = NumberFormat.getInstance();
//
//        nf.setMaximumFractionDigits(7);//设置保留多少位小数
//
//        nf.setGroupingUsed(false);//取消科学计数法
//
//        System.out.println(nf.format(d2));
//        System.out.println(fmt(d,4 ));
//
//        System.out.println(div2Long(81265, 200000, 4));

        System.out.println(div2Double(5356.89, 236.78));
        // 12684044142
        System.out.println(div2Long(535689, 23678));
        System.out.println(mul2Long(535689, 23678));

        System.out.println(calcCommission(218698, 22.27));

        System.out.println(divLong(10000, 3));

        System.out.println(round2Double(1234l, 2));

        System.out.println(div2Double(10, 552) * 100 );
    }

}
