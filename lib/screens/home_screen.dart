import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quote_generator_app/screens/favourite_screen.dart';
import 'package:quote_generator_app/utils/app_colors.dart';
import 'package:quote_generator_app/widgets/counter_circle_avatar.dart';
import 'package:quote_generator_app/widgets/view_fav_container.dart';
import '../provider/quote_provider.dart';
import '../widgets/quote_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, quoteProvider, child) {
        return ModalProgressHUD(
          inAsyncCall: quoteProvider.isLoading,
          child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FavouriteScreen();
                              },
                            ),
                          );
                        },
                        child: ViewFavContainer(),
                      ),
                      Positioned(
                        top: -10,
                        right: -10,
                        child: CounterCircleAvatar(
                          counter: quoteProvider.counter.toString(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  QuoteContainer(
                    quote: quoteProvider.quote,
                    fetchQuote: quoteProvider.fetchQuote,
                    addToFav: quoteProvider.addToFav,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
