package com.laver.bookstore.service;

import java.util.List;

import com.laver.bookstore.domain.BookOrder;
import com.laver.bookstore.domain.BookOrderExample;

public interface IBookOrderService {
	int addBookOrder(BookOrder bookOrder);
	
	int selectOid(BookOrderExample example);
	
	List<BookOrder> selectByExample(BookOrderExample example);
	
	int deleteByPrimaryKey(Integer oid);
	
	BookOrder selectByPrimaryKey(Integer oid);
	
	int update( BookOrder record);
	

}
