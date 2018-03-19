package com.finance.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.TypeDao;
import com.finance.entity.XlType;
import com.finance.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService{
	@Resource
	TypeDao typeDao;
	
	@Override
	public List<XlType> findAll(){
		
		return typeDao.findAll();
		
	}
}
