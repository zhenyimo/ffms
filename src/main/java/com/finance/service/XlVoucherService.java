package com.finance.service;
import java.util.List;
import java.util.Map;
import com.finance.entity.XlVoucher;
/**
 * 抵用券
 * @author zhongzh
 *
 */
public interface XlVoucherService {
	/**
	 * 获得所有抵用券
	 * @return
	 */
	public Long getTotalXlVoucher(Map<String, Object> map);
	/**
	 * 查询抵用券
	 * @param map
	 * @return
	 */
	public List<XlVoucher> findXlVoucher(Map<String, Object> map);
	/**
	 * 获取抵用券记录数
	 * @param map
	 * @return
	 */
	public List<XlVoucher> getAllXlVouchers(Map<String, Object> map);
	/**
	 * 添加抵用券
	 * @param xlVoucher
	 * @return
	 */
	public int addXlVoucher(XlVoucher xlVoucher);
	/**
	 * 更新抵用券
	 * @param xlVoucher
	 * @return
	 */
	public int updateVoucher(XlVoucher xlVoucher);
	/**
	 * 删除抵用券
	 * @param id
	 * @return
	 */
	public int deleteXlVoucher(Integer id);
	/**
	 * 添加抵用券商品匹配
	 * @param xlVoucher
	 * @return
	 */
	public int addXlVoucherGood(XlVoucher xlVoucher);
	/**
	 * 判断抵用券是否已经存在
	 * @param xlVoucher
	 * @return  0：不存在  >已经存在
	 */
	public long getXlVoucherIsExists(XlVoucher xlVoucher);

}
