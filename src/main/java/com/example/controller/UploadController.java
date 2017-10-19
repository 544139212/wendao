/**
 * 
 */
package com.example.controller;

import com.example.enums.ContentTypeEnum;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.UUID;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/upload")
public class UploadController extends BaseController {
	
	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public void upload(HttpServletRequest request, HttpServletResponse response) {
		ServletContext ctx = request.getSession().getServletContext();
		//创建一个通用的多部分解析器
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(ctx);
	    //判断 request 是否有文件上传,即多部分请求 
	    if(multipartResolver.isMultipart(request)){ 
	        //转换成多部分request  
	        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
	        String scope = multiRequest.getParameter("scope");
	        //取得request中的所有文件名
	        Iterator<String> iter = multiRequest.getFileNames();
	        while(iter.hasNext()){ 
	            //取得上传文件 
	            MultipartFile file = multiRequest.getFile(iter.next()); 
	            if (file != null && !"".equals(file.getOriginalFilename())) {
	            	// 此处写upload和/upload和upload/和/upload/，经验证效果一样
	            	PrintWriter out = null;
	            	try {
	            		out = response.getWriter();

	            		String uploadPath = ctx.getRealPath("/upload");
						final File uploadDir = new File(uploadPath);
						if (!uploadDir.exists()) {
							uploadDir.mkdir();
						}

						String scopePath = uploadPath + "/" + scope;
						final File scopeDir = new File(scopePath);
						if (!scopeDir.exists()) {
							scopeDir.mkdir();
						}

						String fileName = getFileName(getSuffix(file.getContentType()));
						file.transferTo(new File(scopeDir, fileName));
						String path = "/upload" + "/" + scope + "/" + fileName;
						out.write("{\"status\":0, \"path\":\"" + path + "\"}");
	            	} catch (IOException e) {
	    				e.printStackTrace();
	    			} finally {
	    				if (out != null) {
		    				out.flush();
		        			out.close();
	    				}
	            	}
	    		}
	        }     
	    }
	}

	protected String getSuffix(String contentType) {
		ContentTypeEnum contentTypeEnum = ContentTypeEnum.getContentType(contentType);
		if (contentType != null) {
			return contentTypeEnum.getExtension();
		}
		return "";
	}

	protected String getFileName(String suffix) {
		return UUID.randomUUID().toString() + suffix;
	}

}
