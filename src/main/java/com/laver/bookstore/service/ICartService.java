package com.laver.bookstore.service;


import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.Cart;

public interface ICartService {
	Cart addGoodsInCart(Book book ,int number,Cart cart);
	
	Cart removeGoodsFromCart(Book book,Cart cart);
	
	Cart calTotalPrice(Cart cart);
	
}
