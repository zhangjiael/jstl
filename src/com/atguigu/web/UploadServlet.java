package com.atguigu.web;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UploadServlet", value = "/UploadServlet")
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //1.先判断上传的数据是否是多段数据（只有是多断数据，才是文件上传的）
        if (ServletFileUpload.isMultipartContent(request)){
            //创建FileItemFactory工厂实现类
            FileItemFactory factory = new DiskFileItemFactory();
            //创建用于解析上传数据的工具类ServletFileUpload
            ServletFileUpload upload = new ServletFileUpload(factory);
            //解析上传的数据，返回的是list对象 存放的是FileItem对象
            try {
                List<FileItem> list=upload.parseRequest(request);
                //循环判断每一个表单项，是普通类型，还是上传文件
                for (FileItem item : list){
                    if (item.isFormField()){
                        //普通表单项  获取表单项的name和value值
                        System.out.println("表单项的name属性值："+item.getFieldName());
                        System.out.println("表单项的value属性值："+item.getString("UTF-8"));
                    }else{
                        //上传的文件 获取表单项name 文件的的name
                        System.out.println("表单项的name属性值："+item.getFieldName());
                        System.out.println("上传的文件名："+item.getName());
                        item.write(new File("E:\\java编译器\\用户上传的文件\\"+item.getName()));
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

    }
}