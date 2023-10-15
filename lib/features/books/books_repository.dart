import 'package:henry_potier/features/books/book.dart';
import 'package:henry_potier/core/network/network_service.dart';

class BooksRepository {
  final NetworkService _networkService;

  BooksRepository({required NetworkService networkService})
      : _networkService = networkService;

  Future<List<Book>> getBooks() async {
    const endpoint = '/books';

    try {
      final List response = await _networkService.getData(endpoint);
      final books = response.map((e) => Book.fromJson(e)).toList();
      return books;
    } catch (e) {
      rethrow;
    }
  }
}
