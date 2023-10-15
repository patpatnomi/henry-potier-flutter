import 'package:flutter/material.dart';
import 'package:henry_potier/core/network/network_service.dart';
import 'package:henry_potier/features/basket/basket_viewmodel.dart';
import 'package:henry_potier/features/basket/offers_repository.dart';
import 'package:henry_potier/features/books/books_repository.dart';
import 'package:henry_potier/features/books/books_screen.dart';
import 'package:henry_potier/features/books/books_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NetworkService _networkService =
      NetworkService(baseUrl: 'https://henri-potier.techx.fr');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => BooksViewModel(
                  repository:
                      BooksRepository(networkService: _networkService))),
          ChangeNotifierProvider(
              create: (_) => BasketViewModel(
                  repository:
                      OffersRepository(networkService: _networkService))),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const BooksScreen(),
        ));
  }
}
