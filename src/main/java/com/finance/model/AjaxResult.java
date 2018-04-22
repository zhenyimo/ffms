package com.finance.model;

import com.jfinal.kit.JsonKit;

/**
 * 功能描述: 封装ajax返回
 * @author L.cm
 * email: 596392912@qq.com
 * site:http://www.dreamlu.net
 * date: 2015年7月31日 下午9:50:58
 */
public class AjaxResult {

	// 标记成功失败，默认0：成功，1：失败、用于alert，2：失败、用于confirm
	public static final int SUCCESS=0;
	public static final int FAIL_ALERT=1;
	public static final int FAIL_CONFIRM=2;
	public static final String DEFAULT_SUCCESS_TIP="操作成功";
	public static final String DEFAULT_FAIL_TIP="操作失败";
	private int code = 0;

	// 返回的中文消息
	private String message;

	// 成功时携带的数据
	private Object data;
	public AjaxResult(){};
	public AjaxResult(int code, String message, Object data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	// 校验错误
	public boolean hasError() {
		return this.code != 0;
	}

	// 添加错误，用于alertError
	public AjaxResult addError(String message) {
		this.message = message;
		this.code = 1;
		return this;
	}

	/**
	 * 用于Confirm的错误信息
	 * @param addConfirmError
	 * @return AjaxResult
	 */
	public AjaxResult addConfirmError(String message) {
		this.message = message;
		this.code = 2;
		return this;
	}

	/**
	 * 封装成功时的数据
	 * @param data
	 * @return AjaxResult
	 */
	public AjaxResult success(Object data) {
		this.data = data;
		return this;
	}

	@Override
	public String toString() {
		return JsonKit.toJson(this);
	}
}
