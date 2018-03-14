package com.finance.util;

import org.slf4j.Logger;

public class Assert {
	  public static void isNull(Object object, Logger logger, String message) {
		    if (object != null) {
		      IllegalArgumentException e = new IllegalArgumentException(message);
		      logger.error(e.getMessage(), e);
		      throw e;
		    }
	  }
}
