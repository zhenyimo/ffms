package com.finance.serial;

public interface SerialCallable<R,T> {
	public T serial(R obj);
	
}
