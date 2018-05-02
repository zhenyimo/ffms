package com.finance.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlVoucherDao;
import com.finance.entity.XlVoucher;
import com.finance.service.XlVoucherService;
/**
 * 抵用券Service实现类
 * @author zhongzh
 *
 */
@Service("xlVoucherService")
public class XlVoucherServiceImpl implements XlVoucherService{
	@Resource
	private XlVoucherDao xlVoucherDao;
	public Long getTotalXlVoucher(Map<String, Object> map) {
		return xlVoucherDao.getTotalXlVoucher(map);
	}

	public List<XlVoucher> findXlVoucher(Map<String, Object> map) {
		return xlVoucherDao.findXlVoucher(map);
	}

	public List<XlVoucher> getAllXlVouchers(Map<String, Object> map) {
		return xlVoucherDao.getAllXlVouchers(map);
	}

	public int addXlVoucher(XlVoucher xlVoucher) {
		return xlVoucherDao.addXlVoucher(xlVoucher);
	}

	public int updateVoucher(XlVoucher xlVoucher) {
		return xlVoucherDao.updateVoucher(xlVoucher);
	}
	
	public int deleteXlVoucher(Integer id) {
		return xlVoucherDao.deleteXlVoucher(id);
		
	}

	@Override
	public int addXlVoucherGood(XlVoucher xlVoucher) {
		// TODO Auto-generated method stub
		return xlVoucherDao.addXlVoucherGood(xlVoucher);
	}

	@Override
	public long getXlVoucherIsExists(XlVoucher xlVoucher) {
		// TODO Auto-generated method stub
		return xlVoucherDao.getXlVoucherIsExists(xlVoucher);
	}

}
