import 'package:dio/dio.dart';

import '../models/quote_model.dart';
import 'api_service.dart';

class QuoteService{

  Future <QuoteModel> getRandomQuote()async{

    Response res = await ApiService().get(endpoint: 'random');
    QuoteModel quote = QuoteModel.fromJson(res.data);

    print(quote.content);
    return quote;
  }

  Future <QuoteModel> getQuoteById({required String id})async{

    Response res = await ApiService().get(endpoint: 'quotes/$id');
    QuoteModel quote = QuoteModel.fromJson(res.data);

    print(quote.content);
    return quote;
  }

}