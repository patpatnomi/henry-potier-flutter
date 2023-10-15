import 'package:flutter/material.dart';
import 'package:henry_potier/features/books/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final void Function()? onPressed;

  const BookWidget({
    super.key,
    required this.book,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Text(book.title),
    //   ],
    // );
    return ListTile(
      leading: Image(image: NetworkImage(book.cover)),
      title: Text(book.title),
      subtitle: Text('prix: ${book.price}€'),
      trailing: TextButton(
        onPressed: onPressed,
        child: const Text('ADD'),
      ),
    );
  }
}
