package com.spring.ctc.company.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ctc.order.vo.OrderVO;

public interface CompanyOrderDAO {
	
	public List<OrderVO> selectComOrderList() throws DataAccessException;
	public List<OrderVO> selectCompanyOrderList(Map find) throws DataAccessException;

}
