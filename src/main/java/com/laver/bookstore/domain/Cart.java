package com.laver.bookstore.domain;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;


//购物车类
public class Cart {

	//购买商品的集合
	private HashMap<Book,Integer> goods;
	
	//购物车的总金额
	private double totalPrice;

	//构造方法
	public Cart()
	{
		goods = new HashMap<Book,Integer>();
		totalPrice = 0.0;
	}
	
	public Cart(HashMap<Book, Integer> goods, double totalPrice) {
		super();
		this.goods = goods;
		this.totalPrice = totalPrice;
	}

	public HashMap<Book, Integer> getGoods() {
		return goods;
	}

	public void setGoods(HashMap<Book, Integer> goods) {
		this.goods = goods;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	//添加商品进购物车的方法
	public boolean addGoodsInCart(Book item ,int number)
	{
		if(goods.containsKey(item))
		{
			goods.put(item, goods.get(item)+number);
		}
		else
		{
			goods.put(item, number);	
		}
		calTotalPrice(); //重新计算购物车的总金额
		return true;
	}
	
	//删除商品的方法
	public boolean removeGoodsFromCart(Book item)
	{
		goods.remove(item);
		calTotalPrice(); //重新计算购物车的总金额
		return true;
	}
	
	//统计购物车的总金额
	public double calTotalPrice()
	{
		double sum = 0.0;
		Set<Book> keys = goods.keySet(); //获得键的集合
		Iterator<Book> it = keys.iterator(); //获得迭代器对象
	    while(it.hasNext())
	    {
	    	Book i = it.next();
	    	sum += Double.parseDouble(i.getPirce())* goods.get(i);
	    }
	    this.setTotalPrice(sum); //设置购物车的总金额
	    return this.getTotalPrice();
	}
	
//	public static void main(String[] args) {
//		
//		//先创建两个商品对象
//		Book i1 = new Book(1,"沃特篮球鞋","温州",200,500,"001.jpg");
//		Book i2 = new Book(2,"李宁运动鞋","广州",300,500,"002.jpg");
//		Book i3 = new Book(1,"沃特篮球鞋","温州",200,500,"001.jpg");
//		
//		Cart c = new Cart();
//		c.addGoodsInCart(i1, 1);
//		c.addGoodsInCart(i2, 2);
//		//再次购买沃特篮球鞋，购买3双
//		c.addGoodsInCart(i3, 3);
//		
//		
//		//变量购物商品的集合
//		Set<Map.Entry<Book, Integer>> Book= c.getGoods().entrySet();
//		for(Map.Entry<Book, Integer> obj:Book)
//		{
//			System.out.println(obj);
//		}
//		
//		
//		System.out.println("购物车的总金额："+c.getTotalPrice());
//		
//	}
	
}
