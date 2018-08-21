package com.laver.bookstore.service;

import java.util.List;

import com.laver.bookstore.domain.Comment;

public interface ICommentService {
	int insert(Comment record);
	
	List<Comment> selectBybid(Integer bid);
}
