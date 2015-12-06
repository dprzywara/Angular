package com.project.inz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.inz.dao.BookDao;
import com.project.inz.model.BookEntity;
import com.project.inz.service.BookService;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookRepository;

    @Override
    public List<BookEntity> findAllBooks() {
        return bookRepository.findAllBooks();
    }

    @Override
    public List<BookEntity> findBooksByTitle(String title) {
        return bookRepository.findBooksByTitle(title);
    }


    @Override
    @Transactional(readOnly = false)
    public BookEntity saveBook(BookEntity book) {
        //BookEntity entity = BookMapper.map(book);
        BookEntity entity = bookRepository.saveBook(book);
        return entity;
    }

    @Override
    @Transactional(readOnly = false)
    public void deleteBook(Integer id) {
        bookRepository.deleteBook(id);
    }
}
