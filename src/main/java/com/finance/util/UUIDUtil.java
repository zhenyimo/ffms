package com.finance.util;


import java.util.UUID;

public class UUIDUtil {

  public static String getUUID() {
    UUID uuid = UUID.randomUUID();
    return uuid.toString().replaceAll("\\-", "");
  }
}
