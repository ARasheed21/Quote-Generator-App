import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/quote_provider.dart';
import '../utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontFamily: 'GemunuLibre'),
      cursorColor: AppColors.dark,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Type Something Here To Search..',
        hintStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'GemunuLibre'),
        suffixIcon: GestureDetector(
          onTap: () {
            controller.clear();
            Provider.of<QuoteProvider>(context, listen: false)
                .fetchFavQuotes();
          },
          child: Icon(
            Icons.cancel_outlined,
            color: AppColors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
