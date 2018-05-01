package com.finance.controller.gongzhonghao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finance.dao.GoodDao;
import com.finance.entity.XlGood;
import com.finance.entity.XlOrder;
import com.finance.entity.XlVip;
import com.finance.model.AjaxResult;
import com.finance.service.XlGoodService;
import com.finance.service.XlOrderSendService;
import com.finance.service.XlOrderService;
import com.finance.util.ArrayUtil;
import com.finance.util.Constants;

@Controller
@RequestMapping("/front/gift")
public class GiftController {
	private Logger logger=LoggerFactory.getLogger(GiftController.class);
	@Resource
	XlOrderService xlOrderService;
	@Resource
	XlGoodService xlGoodService;
	@Resource
	XlOrderSendService xlOrderSendService;
	@RequestMapping("/giftShare.do")
	public String giftShare(HttpServletRequest request,@RequestParam("orderNo")String orderNo,Model model){
		XlVip currUser=(XlVip) request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
		List<XlOrder> orderList=xlOrderService.findByOrderNoAndVipId(orderNo, currUser.getId());
		if(!ArrayUtil.isUnique(orderList)){
			logger.error("订单号查询到多个值或不存在，orderNo :"+orderNo);
			//调到错误页面
			return "/error";
		}
		XlOrder order=orderList.get(0);
		Map<String,Object> param=new HashMap<String,Object>();
		param.put(GoodDao.PARAM_GOOD_ID, order.getGoodId());
		XlGood good=xlGoodService.findByGoodId(param);
		if(good==null){
			logger.error("不存在此商品，商品id为："+order.getGoodId());
			return "/error";
		}
		if(order.isPay()||true){
			String shareUrl="/front/gift/giftClaim.do?orderNo="+orderNo+"&sharerId="+currUser.getId();
			model.addAttribute("good",good);
			//页面jssdk分享权限
			model.addAttribute("jsApiListInit","onMenuShareAppMessage");
			//点击分享后填写的认领url
			model.addAttribute("shareUrl",shareUrl);
		}else{
			//跳到赠送管理页面，确认是否支付
			return "redirect:/front/index.do?tabName=gift";
		}
		return "front/giftShare";
	}
	
	@RequestMapping("/giftClaim.do")
	public String giftClaim(HttpServletRequest request,@RequestParam("orderNo")String orderNo,@RequestParam("sharerId")int sharerId){
		XlVip currUser=(XlVip) request.getSession().getAttribute(Constants.currentFrontUserSessionKey);
		//判断赠送订单是否还有认领的余额（错误，还需要判断是否已经支付）
		boolean result=xlOrderSendService.claimIfOrderHasRest(orderNo, sharerId, currUser.getId());
		if(result){
			return "redirect:/front/index.do";	
		}else {
			return "front/failClaim";	
		}
	}
}
