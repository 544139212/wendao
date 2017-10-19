package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * Created by Administrator on 2017/5/5 0005.
 */
@Controller
@RequestMapping(value = "/download")
public class DownloadController extends BaseController {

    @RequestMapping(method = RequestMethod.GET)
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
}
