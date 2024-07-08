import 'package:flutter/material.dart';
import 'package:quote_generator_app/models/quote_model.dart';
import '../utils/app_colors.dart';


class QuoteContainer extends StatelessWidget {
  QuoteContainer({super.key, required this.quote, required this.fetchQuote, required this.addToFav});

  QuoteModel? quote;
  final fetchQuote;
  final addToFav;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 353,
        //height: 216,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight:Radius.circular(6) ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '"${quote?.content}"'?? '',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  //color: AppColors.textColor,
                  fontFamily: 'GemunuLibre',
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  quote?.author?? '',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      fontFamily: 'GemunuLibre'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: fetchQuote,
                  child: Container(
                    alignment: Alignment.center,
                    width: 203,
                    height: 48,
                    child: Text(
                      'Generate Another Quote',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'GemunuLibre'),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(6)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: addToFav,
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 48,
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 32,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(6)),
                        border:
                        Border.all(width: 2, color: AppColors.primaryColor)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavQuoteContainer extends StatelessWidget {
  FavQuoteContainer({super.key, required this.quote, required this.removeFromFav});

  final QuoteModel? quote;
  final removeFromFav;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 353,
        //height: 216,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '"${quote?.content}"'??'',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  //color: AppColors.textColor,
                  fontFamily: 'GemunuLibre'),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  quote?.author??'',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      fontFamily: 'GemunuLibre'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: removeFromFav,
                  child: Container(
                    alignment: Alignment.center,
                    width: 313,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 24,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Remove From Favourite',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                              fontFamily: 'GemunuLibre'),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2,color: AppColors.primaryColor),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(6),bottomRight:Radius.circular(6) ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
