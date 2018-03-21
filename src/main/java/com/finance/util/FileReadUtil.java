package com.finance.util;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class FileReadUtil {

  public static List<List<Object>> readFileLines(InputStream inputStream) {
    List<List<Object>> lines = new ArrayList<List<Object>>();
    String line = "";
    List<Object> list = null;
    InputStreamReader isr = new InputStreamReader(inputStream);
    BufferedReader br = new BufferedReader(isr);
    try {
      while ((line = br.readLine()) != null) {
        list = new ArrayList<Object>();
        Object[] obj = line.split(",");
        for (Object object : obj) {
          list.add(object);
        }
        lines.add(list);
      }
      return lines;
    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      try {
        br.close();
        isr.close();
        inputStream.close();
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return lines;
  }
}
