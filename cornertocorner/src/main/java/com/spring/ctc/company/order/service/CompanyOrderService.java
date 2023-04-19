package com.spring.ctc.company.order.service;

import java.util.List;
import java.util.Map;

import com.spring.ctc.order.vo.OrderVO;

public interface CompanyOrderService {
	
	public List<OrderVO> selectComOrderList() throws Exception;
	public List<OrderVO> findComOrderGoods(Map find) throws Exception;

}
