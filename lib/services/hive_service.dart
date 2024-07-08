import 'package:hive/hive.dart';
import 'package:quote_generator_app/models/quote_model.dart';

class HiveService{

  static Future<Box<QuoteModel>> openQuotesBox() => Hive.openBox<QuoteModel>('quotes');

  static Box<QuoteModel> getQuotesBox() => Hive.box<QuoteModel>('quotes');

}