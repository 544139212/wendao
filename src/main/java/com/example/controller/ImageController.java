/**
 * 
 */
package com.example.controller;

import java.io.*;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.enums.ContentTypeEnum;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.example.data.UserData;

/**
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/image")
public class ImageController extends BaseController {
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public void upload(HttpServletRequest request, HttpServletResponse response) {
		//创建一个通用的多部分解析器 
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getServletContext());
	    //判断 request 是否有文件上传,即多部分请求 
	    if(multipartResolver.isMultipart(request)){ 
	        //转换成多部分request  
	        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
	        String type = multiRequest.getParameter("type");
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
	            		
		            	if ("textarea".equals(type)) {
		            		String basePath = request.getServletContext().getRealPath("/upload");
			    			final File dir = new File(basePath);
			    			if (!dir.exists()) {
			    				dir.mkdir();
			    			}
			    			
		    				String fileName = getFileName(getSuffix(file.getContentType()));
							file.transferTo(new File(dir, fileName));
							out.write("{\"status\":0, \"path\":\"/upload/" + fileName + "\"}");
		    				break;
		            	} else {
		            		String basePath = request.getServletContext().getRealPath("/upload/user");
			    			final File dir = new File(basePath);
			    			if (!dir.exists()) {
			    				dir.mkdir();
			    			}
			    			
		    				String fileName = null;
	    					String oldFileName = getCurrentUser().getPhoto();
	    					if (StringUtils.isEmpty(oldFileName)) {
	    						fileName = getFileName(getSuffix(file.getContentType()));
	    					} else {
	    						fileName = oldFileName;
	    					}
							file.transferTo(new File(dir, fileName));
							// update db
							UserData userData = getCurrentUser();
							userData.setPhoto(fileName);
							userFacade.updateByPrimaryKeySelective(userData);
							out.write("{\"status\":0, \"path\":\"/upload/user/" + fileName + "\"}");
		    				break;
		            	}
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

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(HttpServletRequest request, HttpServletResponse response) {
		ServletContext ctx = request.getSession().getServletContext();

		String scope = request.getParameter("scope");
		//String type = request.getParameter("type");
		String fileName = request.getParameter("fileName");

		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);

		OutputStream out = null;
		InputStream in = null;
		try {
			String filePath = ctx.getRealPath("/upload" + "/"/* + type + "/"*/ + scope + "/" + URLEncoder.encode(fileName, "UTF-8"));
			in = new FileInputStream(filePath);
			out = response.getOutputStream();

			byte[] buffer = new byte[1024];
			int i = 0;
			while((i = in.read(buffer)) > 0){
				out.write(buffer, 0, i);
			}
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.flush();
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest request, HttpServletResponse response) {
    	String paths = request.getParameter("paths");
    	if (paths != null && !"".equals(paths)) {
    		// 此处加/和不加/，经验证效果一样
    		String basePath = request.getServletContext().getRealPath("/");
    		String[] pathArray = paths.split(",");
    		for (String path : pathArray) {
    			File file = new File(basePath + path);
    			if (file.exists()) {
    				file.delete();
    			}
    		}
    		
    		PrintWriter out = null;
			try {
				out = response.getWriter();
				out.write("{\"status\":0}");
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
