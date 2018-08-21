package com.laver.bookstore.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.laver.bookstore.domain.BookOrder;
import com.laver.bookstore.domain.BookOrderExample;
import com.laver.bookstore.domain.BookOrderExample.Criteria;
import com.laver.bookstore.mapper.BookOrderMapper;
import com.laver.bookstore.service.IBookOrderService;

@Service
public class BookOrderService implements IBookOrderService{
	
	@Resource
	private BookOrderMapper bookOrderMapper;

	@Override
	public int addBookOrder(BookOrder bookOrder) {
		// TODO Auto-generated method stub
		return bookOrderMapper.insert(bookOrder);
	}

	@Override
	public int selectOid(BookOrderExample example) {
		// TODO Auto-generated method stub
		List<BookOrder> bookOrders = bookOrderMapper.selectByExample(example);
		BookOrder bookOrder=bookOrders.get(0);
		return bookOrder.getOid();
	}

	@Override
	public List<BookOrder> selectByExample(BookOrderExample example) {
		// TODO Auto-generated method stub
		return bookOrderMapper.selectByExample(example);
	}

	@Override
	public int deleteByPrimaryKey(Integer oid) {
		// TODO Auto-generated method stub
		return bookOrderMapper.deleteByPrimaryKey(oid);
	}

	@Override
	public BookOrder selectByPrimaryKey(Integer oid) {
		// TODO Auto-generated method stub
		return bookOrderMapper.selectByPrimaryKey(oid);
	}

	@Override
	public int update(BookOrder record) {
		// TODO Auto-generated method stub
		System.out.println(record);
		BookOrder bookOrder = bookOrderMapper.selectByPrimaryKey(record.getOid());
		if(record.getOname()!=null&&!record.getOname().equals("")){
			bookOrder.setOname(record.getOname());
		}
		if(record.getAdress()!=null&&!record.getAdress().equals("")){
			bookOrder.setAdress(record.getAdress());
		}
		if(record.getStatus()!=null&&!record.getStatus().equals("")){
			bookOrder.setStatus(record.getStatus());
		}
		BookOrderExample example = new BookOrderExample();
		Criteria cri = example.createCriteria();
		cri.andOidEqualTo(record.getOid());
		return bookOrderMapper.updateByExample(bookOrder, example);
	}

}
