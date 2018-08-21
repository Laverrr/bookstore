package com.laver.bookstore.controller;

import com.laver.bookstore.domain.Book;
import com.laver.bookstore.domain.Cart;
import com.laver.bookstore.domain.OrderDetail;
import com.laver.bookstore.service.IBookService;
import com.laver.bookstore.service.ICartService;
import com.laver.bookstore.util.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by L on 2018/3/23.
 */
@Controller
public class CartController {

    @Resource
    private IBookService bookService;
    @Resource
    private ICartService cartService;

    @RequestMapping("/addGoodsInCart")
    public ModelAndView addGoodsInCart(Integer bid, Integer number, HttpSession session){
        Book book=bookService.findById(bid);
        Cart cart=null;
        if(session.getAttribute("cart")!=null){
            cart=(Cart) session.getAttribute("cart");
        }else{
            cart=new Cart();
        }
        cart=cartService.addGoodsInCart(book, number,cart);
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }
    @RequestMapping("/removeGoodsFromCart")
    public ModelAndView removeGoodsFromCart(Integer bid,HttpSession session){
        Book book=bookService.findById(bid);
        Cart cart=(Cart) session.getAttribute("cart");
        cart=cartService.removeGoodsFromCart(book, cart);
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }

    @RequestMapping("/cleanCart")
    public ModelAndView cleanCart(HttpSession session){
        Cart cart=null;
        session.setAttribute("cart",cart);
        return new ModelAndView("redirect:/cartPage.do");
    }
    @ResponseBody
    @RequestMapping(value = "/checkStore",produces={"text/html;charset=UTF-8;","application/json;"})
    public String checkStore(HttpSession session){
        Cart cart =(Cart)session.getAttribute("cart");
        Map<Book, Integer> map=cart.getGoods();
        Iterator<Map.Entry<Book, Integer>> iter = map.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry<Book, Integer> entry =  iter.next();
            Book book = entry.getKey();
            Integer number = entry.getValue();
            if (!bookService.checkStore(book.getBid(),number)){
                return "《"+book.getBname()+"》库存不足,库存剩余:"+book.getStore();
            }
        }
        return "success";
    }





}
