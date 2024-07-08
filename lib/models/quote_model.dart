
import 'package:hive/hive.dart';

part 'quote_model.g.dart';

@HiveType(typeId: 0)
class QuoteModel {

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String author;

  QuoteModel(
      {required this.id,
        required this.content,
        required this.author,
        });

  factory QuoteModel.fromJson(jsonData) {
    return QuoteModel(
        id:jsonData['_id'],
        content: jsonData['content'],
        author: jsonData['author'],
        );
  }
}