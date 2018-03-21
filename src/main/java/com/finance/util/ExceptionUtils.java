package com.finance.util;

import java.io.ByteArrayOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
/**
 * 異常工具類
 * @author jinbang
 *
 */
public class ExceptionUtils {

    /**
     * 将异常堆栈信息转换成字符串
     * @param e
     * @return
     */
    public static String exceptionToString(Exception e){
        ByteArrayOutputStream bout=new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(bout);
        e.printStackTrace(ps);
        String msg = new String(bout.toByteArray());
        return msg;
    }
    /**
     * 将异常堆栈信息输出到指定文件中
     * @param e
     * @param filename
     */
    public static void printExceptionToFile(Exception e,String filename){
        PrintWriter pw;
        try {
            pw = new PrintWriter(new FileWriter(filename));
            e.printStackTrace(pw);
            pw.flush();
            pw.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }

    }
    
}