import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../services/hive_service.dart';
import '../services/quote_service.dart';

class QuoteProvider with ChangeNotifier {
  QuoteModel? _quote;
  List<QuoteModel> _favQuotes = [];
  List<QuoteModel> _allFavQuotes = [];
  bool isSearching = false;
  bool noItemFound = false;
  bool _isLoading = false;
  int _counter = 0;

  QuoteModel? get quote => _quote;

  List<QuoteModel?> get favQuotes => _favQuotes;

  List<QuoteModel?> get allFavQuotes => _allFavQuotes;

  bool get isLoading => _isLoading;

  int get counter => _counter;

  QuoteProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();
    await fetchQuote();
    await fetchFavCount();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchQuote() async {
    QuoteModel randomeQuote = await QuoteService().getRandomQuote();
    _quote = randomeQuote;
    notifyListeners();
  }

  Future<void> fetchFavQuotes() async {
    _isLoading = true;
    notifyListeners();
    var quotesBox = await HiveService.openQuotesBox();
    _allFavQuotes = quotesBox.values.toList();
    _favQuotes = List.from(_allFavQuotes);
    _isLoading = false;
    notifyListeners();
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      isSearching = false;
      noItemFound = false;
      _favQuotes = List.from(_allFavQuotes);
      notifyListeners();
    } else {
      isSearching = true;
      if (query.isNotEmpty) {
        List<QuoteModel> dummyListData = [];
        _allFavQuotes.forEach((quote) {
          String data = quote.content;
          if (data.toLowerCase().contains(query)) {
            dummyListData.add(quote);
          }
        });

        _favQuotes.clear();
        favQuotes.addAll(dummyListData);
        notifyListeners();
        return;
      } else {
        favQuotes.clear();
        favQuotes.addAll(_allFavQuotes);
        notifyListeners();
      }
    }
  }

  Future<void> fetchFavCount() async {
    var quotesBox = await HiveService.openQuotesBox();
    _counter = quotesBox.values
        .toList()
        .length;
    notifyListeners();
  }

  Future<void> addToFav() async {
    var quotesBox = await HiveService.openQuotesBox();
    await quotesBox.put(_quote?.id, _quote!);
    fetchFavCount();
  }

  Future<void> removeFromFav(String id) async {
    var quotesBox = await HiveService.openQuotesBox();
    await quotesBox.delete(id);
    _allFavQuotes.removeWhere((quote) => quote.id == id);
    _favQuotes.removeWhere((quote) => quote.id == id);
    fetchFavCount();
    notifyListeners();
  }
}