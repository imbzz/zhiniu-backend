package com.itcast.trade.bulls.stock.user.controller;

import com.itcast.bulls.stock.common.exception.ComponentException;
import com.itcast.bulls.stock.entity.user.TradeUser;
import com.itcast.bulls.stock.entity.user.TradeUserFile;
import com.itcast.bulls.stock.starter.ceph.CephSwiftOperator;
import com.itcast.stock.common.web.vo.ApiRespResult;
import com.itcast.trade.bulls.stock.user.service.IStockUserFileService;
import com.itcast.trade.bulls.stock.user.service.IStockUserService;
import lombok.extern.log4j.Log4j2;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * <p>Description: </p>
 * @date 
 * @author 
 * @version 1.0
 * <p>Copyright:Copyright(c)2020</p>
 */
@RestController()
@RequestMapping("/user")
@Log4j2
@Validated
public class StockUserController extends BaseController{

    @Autowired
    private IStockUserService stockUserService;

    @Autowired
    private IStockUserFileService stockUserFileService;

//    @Autowired
//    private  CephSwiftOperator cephSwiftOperator;

    /**
     * 用户登陆接口
     * @param userNo
     * @param userPwd
     * @return
     */
    @RequestMapping("/userLogin")
    public ApiRespResult userLogin(@RequestParam("userNo")String userNo, @RequestParam("userPwd") String userPwd) {

        ApiRespResult  result = null;
        try {
            // 用户登陆逻辑处理
            TradeUser tradeUser = stockUserService.userLogin(userNo, userPwd);
            result = ApiRespResult.success(tradeUser);
        }catch(ComponentException e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.error(e.getErrorCodeEnum());
        }catch(Exception e) {
            log.error(e.getMessage(), e);
            result = ApiRespResult.sysError(e.getMessage());
        }

        return result;

    }

    /**
     * 用户身份证上传的接口
     * @param file
     * @return
     */
    @PostMapping("/uploadIdCard")
    public ApiRespResult uploadIdCard(@RequestParam("file")MultipartFile file) {
//        ApiRespResult result = null;
//        try {
//            // 1. 获取用户的ID
//            Long userId = getUserId();
//            // 2.保存用户上传的文件
//            String userFileId = stockUserFileService.uploadUserIdCard(userId, file);
//            result = ApiRespResult.success(userFileId);
//        }catch (ComponentException e) {
//            log.error(e.getMessage(),e);
//            result = ApiRespResult.error(e.getErrorCodeEnum());
//        }catch (Exception e) {
//            log.error(e.getMessage(),e);
//            result = ApiRespResult.sysError(e.getMessage());
//        }
//        return result;
        return null;
    }


    /**
     * 根据文件ID下载用户文件信息
     * @param fileId
     * @return
     */
    @RequestMapping(value = "/downloadFile", method = {RequestMethod.GET, RequestMethod.POST} )
    public  ApiRespResult downloadFile(@NotBlank(message = "文件ID不能为空！") String fileId) {
//        // 文件输出流
//        OutputStream os = null;
//        // 文件缓冲数据流
//        BufferedInputStream bis = null;
//        // 统一返回对象
//        ApiRespResult result = null;
//
//        try {
//            // 1. 获取HttpServletResponse输出返回对象
//            HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//                    .getResponse();
//            // 2. 获取用户的文件信息
//            TradeUserFile tradeUserFile = stockUserFileService.getTradeUserFile(fileId);
//
//            // 3. 从Ceph服务器上去获取文件流
//            InputStream inputStream = cephSwiftOperator.retrieveObject(fileId);
//
//            // 4. 设置文件的输出类型ContentType
//            if(null == tradeUserFile.getFileType()) {
//                // 放置浏览器直接打开, 强制下载文件
//                response.setContentType("applicaton/force-download");
//            }
//            response.setContentType(tradeUserFile.getFileType());
//            // 5. 设置文件下载的名称
//            response.addHeader("Content-Dispostion", "attachment:fileName=" + tradeUserFile.getFilename());
//
//            // 6. 输出文件流, 完成下载处理
//            byte[] buffer = new byte[1024];
//            bis = new BufferedInputStream(inputStream);
//            os = response.getOutputStream();
//            int i = bis.read(buffer);
//            while( i!= -1 ) {
//                os.write(buffer, 0, i);
//                i = bis.read(buffer);
//            }
//            os.flush();
//            return null;
//
//        }catch(ComponentException e ){
//            log.error(e.getMessage(), e);
//            result = ApiRespResult.error(e.getErrorCodeEnum());
//        }catch(Exception e ){
//            log.error(e.getMessage(), e);
//            result = ApiRespResult.sysError(e.getMessage());
//        }finally {
//            // 关闭文件流
//            if(bis != null) {
//                try {
//                    bis.close();
//                } catch (IOException e) {
//                    log.error(e.getMessage(), e);
//                }
//            }
//        }
//        return result;
        return null;
    }

}
