import 'package:flutter/material.dart';
import 'package:henry_potier/features/basket/basket_viewmodel.dart';
import 'package:provider/provider.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Panier'),
      ),
      body: Consumer<BasketViewModel>(builder: (context, viewmodel, child) {
       return Container(); 
      }),
    );
  }
}
