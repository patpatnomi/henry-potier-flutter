import 'package:flutter/material.dart';
import 'package:henry_potier/features/basket/basket_screen.dart';
import 'package:henry_potier/features/books/book_widget.dart';
import 'package:henry_potier/features/books/books_viewmodel.dart';
import 'package:provider/provider.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<BooksViewModel>(context, listen: false).fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Books'),
        ),
        body: SafeArea(
          child: Consumer<BooksViewModel>(builder: (context, viewmodel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final book = viewmodel.books[index];
                      return BookWidget(
                        book: book,
                        onPressed: () {
                          viewmodel.addBook(book);
                        },);
                    },
                    itemCount: viewmodel.books.length,
                  ),
                ),
                Container(
                  color: Colors.blueAccent,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BasketScreen(); // add a router
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Voir le panier',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          }),
        ));
  }
}
