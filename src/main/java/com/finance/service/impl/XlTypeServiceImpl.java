package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlTypeDao;
import com.finance.entity.XlType;
import com.finance.service.XlTypeService;
/**
 * 类型Service实现类
 * @author zhongzh
 */
@Service("xlTypeService")
public class XlTypeServiceImpl implements XlTypeService{
	@Resource
	private XlTypeDao xlTypeDao;
	@Override
	public List<XlType> getXlTypes() {
		// TODO Auto-generated method stub
		return xlTypeDao.getXlTypes();
	}

	@Override
	public int addXlType(XlType xlType) {
		// TODO Auto-generated method stub
		return xlTypeDao.addXlType(xlType);
	}

	@Override
	public int updateXlType(XlType xlType) {
		// TODO Auto-generated method stub
		return xlTypeDao.updateXlType(xlType);
	}

	@Override
	public int deleteXlType(Integer id) {
		// TODO Auto-generated method stub
		return xlTypeDao.deleteXlType(id);
	}

	@Override
	public Long getTotalXlType(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlTypeDao.getTotalXlType(map);
	}

	@Override
	public List<XlType> findXlType(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return xlTypeDao.findXlType(map);
	}

}
