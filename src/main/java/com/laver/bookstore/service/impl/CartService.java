package com.laver.bookstore.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.Cart;
import com.laver.bookstore.service.ICartService;


@Service
public class CartService implements ICartService{	
		
	@Override
	public Cart addGoodsInCart(Book book, int number,Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Book,Integer> goods=cart.getGoods();
		if(goods.containsKey(book))
		{
			goods.put(book, goods.get(book)+number);
		}
		else
		{
			goods.put(book, number);	
		}
		 //重新计算购物车的总金额
		return calTotalPrice(cart);
	}

	@Override
	public Cart removeGoodsFromCart(Book book,Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Book,Integer> goods=cart.getGoods();
		goods.remove(book);
		cart.setGoods(goods);
		//重新计算购物车的总金额
		return calTotalPrice(cart);
	}

	@Override
	public Cart calTotalPrice(Cart cart) {
		// TODO Auto-generated method stub
		HashMap<Book,Integer> goods=cart.getGoods();
		double sum = 0.0;
		Set<Book> keys = goods.keySet(); //获得键的集合
		Iterator<Book> it = keys.iterator(); //获得迭代器对象
	    while(it.hasNext())
	    {
	    	Book i = it.next();
	    	sum += Double.parseDouble(i.getPirce())* goods.get(i);
	    }
	    cart.setTotalPrice(sum);
	    return cart;
	}

}
