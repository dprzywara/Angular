package com.project.inz.service;


import java.util.List;

import com.project.inz.model.BookEntity;

public interface BookService {

    List<BookEntity> findAllBooks();
    List<BookEntity> findBooksByTitle(String title);

    BookEntity saveBook(BookEntity book);
    void deleteBook(Integer id);
}
