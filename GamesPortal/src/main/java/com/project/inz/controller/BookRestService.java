package com.project.inz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import com.project.inz.model.BookEntity;
import com.project.inz.service.BookService;

import java.util.List;

@RestController
@RequestMapping(value="/books")
public class BookRestService {

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public List<BookEntity> findBooksByTitle(@RequestParam(value = "titlePrefix", required = false) String titlePrefix) {
        if (StringUtils.isEmpty(titlePrefix)) {
            return bookService.findAllBooks();
        }
        return bookService.findBooksByTitle(titlePrefix);
    }

    @RequestMapping(value = "/book", method = RequestMethod.POST)
    public BookEntity saveBook(@RequestBody BookEntity book) {
    	
        return bookService.saveBook(book);
    }

    @RequestMapping(value = "/book/{id}", method = RequestMethod.DELETE)
    public void deleteBook(@PathVariable("id") Integer id) {
        bookService.deleteBook(id);
    }
}
