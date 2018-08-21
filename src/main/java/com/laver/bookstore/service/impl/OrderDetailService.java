package com.laver.bookstore.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.laver.bookstore.domain.OrderDetail;
import com.laver.bookstore.domain.OrderDetailExample;
import com.laver.bookstore.domain.OrderDetailExample.Criteria;
import com.laver.bookstore.mapper.OrderDetailMapper;
import com.laver.bookstore.service.IOrderDetailService;

@Service
public class OrderDetailService implements IOrderDetailService{
	@Resource
	private OrderDetailMapper orderDetailMapper;

	@Override
	public int addOrderDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return orderDetailMapper.insert(orderDetail);
	}

	@Override
	public List<OrderDetail> selectByExample(OrderDetailExample example) {
		// TODO Auto-generated method stub
		return orderDetailMapper.selectByExample(example);
	}

	@Override
	public OrderDetail selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return orderDetailMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(OrderDetail record) {
		// TODO Auto-generated method stub
		return orderDetailMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByOid(Integer oid) {
		// TODO Auto-generated method stub
		OrderDetailExample example = new OrderDetailExample();
		Criteria cri = example.createCriteria();
		cri.andOrderIdEqualTo(oid);
		return orderDetailMapper.deleteByExample(example);
	}

}
