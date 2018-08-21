package com.laver.bookstore.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.BookExample;
import com.laver.bookstore.domain.BookExample.Criteria;
import com.laver.bookstore.mapper.BookMapper;
import com.laver.bookstore.service.IBookService;

@Service
public class BookService implements IBookService{

	@Resource
	private BookMapper bookMapper;
	
	@Override
	public int addBook(Book book) {
		// TODO Auto-generated method stub
		return bookMapper.insert(book);
	}

	@Override
	public List<Book> findAllBook() {
		// TODO Auto-generated method stub
		BookExample example=new BookExample();
		List<Book> books=bookMapper.selectByExample(example);
		return books;
	}

	@Override
	public int delById(Integer bid) {
		// TODO Auto-generated method stub
		return bookMapper.deleteByPrimaryKey(bid);
	}

	@Override
	public Book findById(Integer bid) {
		// TODO Auto-generated method stub
		return bookMapper.selectByPrimaryKey(bid);
	}

	@Override
	public int modifyBook(Book book) {
		// TODO Auto-generated method stub
		BookExample example=new BookExample();
		Criteria cri = example.createCriteria();
		cri.andBidEqualTo(book.getBid());
		return bookMapper.updateByExampleSelective(book, example);
	}

	@Override
	public Set<String> bookType() {
		// TODO Auto-generated method stub
		Set<String> bts=new HashSet<String>();
		BookExample example=new BookExample();
		List<Book> books=bookMapper.selectByExample(example);
		for(Book book:books){
			bts.add(book.getType());
		}
		return bts;
	}

	@Override
	public List<Book> selectByExample(BookExample example) {
		// TODO Auto-generated method stub
		return bookMapper.selectByExample(example);
	}

	@Override
	public boolean checkStore(Integer bid, Integer number){
		int store=bookMapper.selectByPrimaryKey(bid).getStore();
		if (store-number>=0){
			return true;
		}
		return false;
	}

	@Override
	public int reduceStore(Integer bid, Integer number) {
		// TODO Auto-generated method stub
		Book book = bookMapper.selectByPrimaryKey(bid);
		book.setStore(book.getStore()-number);
		return bookMapper.updateByPrimaryKey(book);
	}



	

}
