import 'package:henry_potier/features/basket/offer.dart';
import 'package:henry_potier/features/books/book.dart';
import 'package:henry_potier/core/network/network_service.dart';

class OffersRepository {
  final NetworkService _networkService;

  OffersRepository({required NetworkService networkService})
      : _networkService = networkService;

  Future<List<Offer>> getCommercialOffers(List<Book> books) async {
    final isbns = books.map((e) => e.isbn).join(',');
    final endpoint = '$isbns/commercialOffers';

    try {
      final Map<String, dynamic> response = await _networkService.getData(endpoint);
      final List offersJson = response['offers'];
      final offers = offersJson.map((e) => Offer.fromJson(e)).toList();
      return offers;
    } catch (e) {
      rethrow;
    }
  }
}
