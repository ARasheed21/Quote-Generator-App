import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:quote_generator_app/widgets/back_to_home_container.dart';
import 'package:quote_generator_app/widgets/search_text_field.dart';
import '../provider/quote_provider.dart';
import '../widgets/quote_widget.dart';
import '../utils/app_colors.dart';

class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuoteProvider>(context, listen: false).fetchFavQuotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BackToHomeContainer(),
              ),
              const SizedBox(
                height: 10,
              ),
              SearchTextField(
                controller: controller,
                onChanged: (query) {
                  Provider.of<QuoteProvider>(context, listen: false)
                      .filterSearchResults(query);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<QuoteProvider>(
                builder: (context, quoteProvider, child) {
                  return quoteProvider.isSearching == true &&
                          quoteProvider.favQuotes.isEmpty
                      ? Expanded(
                          child: SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                "No Quotes Found.",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'GemunuLibre'),
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            itemCount: quoteProvider.isSearching == false
                                ? quoteProvider.allFavQuotes.length
                                : quoteProvider.favQuotes.length,
                            itemBuilder: (context, i) {
                              return FavQuoteContainer(
                                  quote: quoteProvider.isSearching == false
                                      ? quoteProvider.allFavQuotes[i]
                                      : quoteProvider.favQuotes[i],
                                  removeFromFav: () async {
                                    await quoteProvider.removeFromFav(
                                        quoteProvider.isSearching == false
                                            ? quoteProvider.allFavQuotes[i]!.id
                                            : quoteProvider.favQuotes[i]!.id);
                                  });
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
