package com.finance.dao;

import java.util.List;
import java.util.Map;

import com.finance.entity.XlVoucher;
/**
 * 抵用券dao层
 * @author zhongzh
 *
 */
public interface XlVoucherDao {
	/**
	 * 获取抵用券记录数
	 * @param map
	 * @return
	 */
	public Long getTotalXlVoucher();
	/**
	 * 查询抵用券
	 * @param map
	 * @return
	 */
	public List<XlVoucher> findXlVoucher(Map<String, Object> map);
	/**
	 * 获得所有抵用券
	 * @return
	 */
	List<XlVoucher> getXlVouchers();
	/**
	 * 添加抵用券
	 * @param role
	 * @return
	 */
	int addXlVoucher(XlVoucher xlVoucher);
	/**
	 * 更新抵用券
	 * @param xlVoucher
	 * @return
	 */
	int updateVoucher(XlVoucher xlVoucher);
	/**
	 * 删除抵用券
	 * @param id
	 * @return
	 */
	int deleteXlVoucher(Integer id);

}
