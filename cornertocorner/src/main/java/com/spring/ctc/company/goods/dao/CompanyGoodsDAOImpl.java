package com.spring.ctc.company.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ctc.order.vo.OrderVO;

@Repository("companyGoodsDAO")
public class CompanyGoodsDAOImpl implements CompanyGoodsDAO{
   @Autowired
   private SqlSession sqlSession;
   
   
   //최초 페이지 이동 전체목록 조회
   public List<OrderVO> selectComList() throws DataAccessException{
      List<OrderVO> comOrder = sqlSession.selectList("mapper.company.selectReservationList");
      return comOrder;
   }
   
   //예약목록 조회
   public List<OrderVO> comfind(Map find) throws DataAccessException{
      List<OrderVO> comOrder = sqlSession.selectList("mapper.company.selectCompanyGoodsList",find);
      return comOrder;
   }
}