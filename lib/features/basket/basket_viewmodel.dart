import 'package:flutter/material.dart';
import 'package:henry_potier/features/basket/offer.dart';
import 'package:henry_potier/features/basket/offers_repository.dart';

class BasketViewModel extends ChangeNotifier {
  final OffersRepository repository;

  final List<Offer> _offers = [];

  List<Offer> get offers => _offers;

  BasketViewModel({required this.repository});

  void fetchOffers() async {
    final offers = await repository.getCommercialOffers([]); // inject books
    _offers.addAll(offers);
    notifyListeners();
  }
}
