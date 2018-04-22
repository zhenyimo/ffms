package com.finance.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.finance.dao.XlAuthorityDao;
import com.finance.entity.XlAuthority;
import com.finance.service.XlAuthorityService;
/**
 * 权限Service实现类
 * @author zhongzh
 */
@Service("authorityService")
public class XlAuthorityServiceImpl implements XlAuthorityService {
      @Resource
      XlAuthorityDao authorityDao;

	@Override
	public List<XlAuthority> findXlAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return authorityDao.findXlAuthority(map);
	}

	@Override
	public Long getTotalXlAuthority(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return authorityDao.getTotalXlAuthority(map);
	}

	@Override
	public int addXlAuthority(XlAuthority authority) {
		// TODO Auto-generated method stub
		return authorityDao.addXlAuthority(authority);
	}

	@Override
	public int updateXlAuthority(XlAuthority authority) {
		// TODO Auto-generated method stub
		return authorityDao.updateXlAuthority(authority);
	}

	@Override
	public int deleteXlAuthority(Integer id) {
		// TODO Auto-generated method stub
		return authorityDao.deleteXlAuthority(id);
	}
      
}
