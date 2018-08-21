package com.laver.bookstore.mapper;

import com.laver.bookstore.domain.BookOrder;
import com.laver.bookstore.domain.BookOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookOrderMapper {
    int countByExample(BookOrderExample example);

    int deleteByExample(BookOrderExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(BookOrder record);

    int insertSelective(BookOrder record);

    List<BookOrder> selectByExample(BookOrderExample example);

    BookOrder selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") BookOrder record, @Param("example") BookOrderExample example);

    int updateByExample(@Param("record") BookOrder record, @Param("example") BookOrderExample example);

    int updateByPrimaryKeySelective(BookOrder record);

    int updateByPrimaryKey(BookOrder record);
}