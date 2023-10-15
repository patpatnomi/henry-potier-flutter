import 'package:flutter/material.dart';
import 'package:henry_potier/features/books/book.dart';
import 'package:henry_potier/features/books/books_repository.dart';

class BooksViewModel extends ChangeNotifier {
  final BooksRepository repository;

  final List<Book> _books = [];
  final List<Book> _basket = [];

  BooksViewModel({required this.repository});

  List<Book> get books => _books;

  void fetchBooks() async {
    final books = await repository.getBooks();
    _books.addAll(books);
    notifyListeners();
  }

  void addBook(Book book) {
    _basket.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    _basket.remove(book);
    notifyListeners();
  }
}
