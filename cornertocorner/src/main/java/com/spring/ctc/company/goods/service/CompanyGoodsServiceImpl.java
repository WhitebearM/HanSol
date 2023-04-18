package com.spring.ctc.company.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ctc.company.goods.dao.CompanyGoodsDAO;
import com.spring.ctc.order.vo.OrderVO;

@Service("comPanyGoodsService")
public class CompanyGoodsServiceImpl implements CompanyGoodsService{
   @Autowired
   private CompanyGoodsDAO companyGoodsDAO;
   
   @Override
   public List<OrderVO> selectOrderList() throws Exception{
      List<OrderVO> order = companyGoodsDAO.selectComList();
      return order;
   }
   
   @Override
   public List<OrderVO> findOrderGoods(Map find) throws Exception{
      List<OrderVO> order = companyGoodsDAO.comfind(find);
      return order;
   }
}