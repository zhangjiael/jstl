package com.atguigu.web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

@WebServlet(name = "Download", value = "/Download")
public class Download extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取下载的文件名
        String dowloadFileName = "game.ico.png";

        //2.读取要下载的文件内容(通过servletContext可以读取)
        ServletContext context = getServletContext();
        InputStream inputStream=context.getResourceAsStream("/"+dowloadFileName);

        //3.在回传前，通过响应头告诉客户端返回的文件类型
        response.setContentType(context.getMimeType("/"+dowloadFileName));

        //4.通过响应头告诉客户端收到的数据用于下载使用
        //Content-Disposition表示收到的数据怎么处理  attachment表示附件，表示下载使用  filename表示指定下载后的文件名
        //url编码是把汉字转换成%xx%xx的格式
        response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode("奖状.png","UTF-8"));

        //5.把下载的文件内容回传给客户端
         //获取响应的输出流
        OutputStream out = response.getOutputStream();
        //把输入流的文件内容给输出流
        IOUtils.copy(inputStream,out);

    }
}
