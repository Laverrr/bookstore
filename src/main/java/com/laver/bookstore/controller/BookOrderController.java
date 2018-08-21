package com.laver.bookstore.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.BookOrder;
import com.laver.bookstore.domain.BookOrderExample;
import com.laver.bookstore.domain.BookOrderExample.Criteria;
import com.laver.bookstore.domain.Cart;
import com.laver.bookstore.domain.OrderDetail;
import com.laver.bookstore.domain.OrderDetailExample;
import com.laver.bookstore.service.IBookOrderService;
import com.laver.bookstore.service.IBookService;
import com.laver.bookstore.service.IOrderDetailService;
import com.laver.bookstore.util.Constant;

@Controller
public class BookOrderController {
	
	@Resource 
	private IBookService bookService;
	@Resource
	private IBookOrderService bookOrderService;
	@Resource
	private IOrderDetailService orderDetailService;
	
	@RequestMapping("/addBookOrder")
	public ModelAndView addOrder(Integer uid,String oname,String oaddress,HttpSession session){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr=sdf.format(date);
		int oid;
		BookOrder bookOrder=new BookOrder();
		bookOrder.setDate(dateStr);
		bookOrder.setOname(oname);
		bookOrder.setAdress(oaddress);
		bookOrder.setStatus(Constant.UN_DO);
		bookOrder.setUid(uid);
		bookOrderService.addBookOrder(bookOrder);
		BookOrderExample example = new BookOrderExample();
		Criteria cri = example.createCriteria();
		cri.andDateEqualTo(dateStr);
		oid = bookOrderService.selectOid(example);
		Cart cart =(Cart)session.getAttribute("cart");
		Map<Book, Integer> map=cart.getGoods();
		Iterator<Entry<Book, Integer>> iter = map.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry<Book, Integer> entry = (Entry<Book, Integer>) iter.next();
			Book book = entry.getKey();
			Integer number = entry.getValue();
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderId(oid);
			orderDetail.setBookId(book.getBid());
			orderDetail.setBookNum(number);
			orderDetail.setStatus(Constant.UN_COMMENT);
			orderDetailService.addOrderDetail(orderDetail);
			bookService.reduceStore(book.getBid(), number);
			}
		session.removeAttribute("cart");
		return new ModelAndView("redirect:/shoppingResult.do");
	}
	@RequestMapping("/allBookOrder")
	public String allBookOrder(Model model,Integer pageNum,String oname,Integer oid,HttpSession session){
		Set<Book> books=new HashSet<Book>();
		OrderDetailExample example2 = new OrderDetailExample();
		List<OrderDetail> orderDetails = orderDetailService.selectByExample(example2);
		for(OrderDetail od:orderDetails){
			Book book = bookService.findById(od.getBookId());
			books.add(book);
		}
		BookOrderExample boexample = (BookOrderExample) session.getAttribute("boexample");
		if(boexample==null){
			boexample= new BookOrderExample();
		}
		if(oid!=null){
			boexample.clear();
			Criteria cri = boexample.createCriteria();
			cri.andOidEqualTo(oid);
		}
		if(oname!=null){
			boexample.clear();
			Criteria cri = boexample.createCriteria();
			cri.andOnameLike("%"+oname+"%");
		}
		session.setAttribute("boexample", boexample);
		if(pageNum!=null){
			PageHelper.startPage(pageNum,com.laver.bookstore.util.Constant.UO_PAGE_SIZE);
		}else{
			PageHelper.startPage(1, com.laver.bookstore.util.Constant.UO_PAGE_SIZE);
		}
		List<BookOrder> bookOrders = bookOrderService.selectByExample(boexample);
		PageInfo<BookOrder> pageInfo = new PageInfo<BookOrder>(bookOrders);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("bookOrders", bookOrders);
		model.addAttribute("books", books);
		model.addAttribute("orderDetails", orderDetails);
		return "manage/order";
	}
	@RequestMapping("/delserchBookOrder")
	public ModelAndView delserchBookOrder(Integer oid){
		bookOrderService.deleteByPrimaryKey(oid);
		orderDetailService.deleteByOid(oid);
		return new ModelAndView("redirect:/allBookOrder.do");
	}
	@RequestMapping("/orderModify")
	public ModelAndView orderModify(Integer oid,String oname,String address,String status){
		BookOrder bookOrder = new BookOrder();
		bookOrder.setOid(oid);
		bookOrder.setOname(oname);
		bookOrder.setAdress(address);
		bookOrder.setStatus(status);
		bookOrderService.update(bookOrder);
		return new ModelAndView("redirect:/allBookOrder.do");
	}
	@RequestMapping("/orderModifyPage")
	public String orderModifyPage(Integer oid,Model model){
		BookOrder bookOrder = bookOrderService.selectByPrimaryKey(oid);
		model.addAttribute("bookOrder", bookOrder);
		return "manage/order-modify";
	}


}
