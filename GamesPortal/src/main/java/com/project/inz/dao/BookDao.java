package com.project.inz.dao;
import java.util.List;

import com.project.inz.model.BookEntity;

 
public interface BookDao {
 
	List<BookEntity> findAllBooks();
    List<BookEntity> findBooksByTitle(String title);
    BookEntity findById(Integer id);
    BookEntity saveBook(BookEntity book);
    void deleteBook(Integer id);
}