import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'models/quote_model.dart';
import 'provider/quote_provider.dart';
import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteModelAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuoteProvider(),
      child: QuoteGeneratorApp(),
    ),
  );
}

class QuoteGeneratorApp extends StatelessWidget {
  const QuoteGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
  }
}

