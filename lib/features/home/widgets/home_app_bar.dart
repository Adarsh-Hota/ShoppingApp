import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/search/screens/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  void navigateToSearchScreen(BuildContext context, String searchQuery) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: {
        'searchQuery': searchQuery,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: GlobalVariables.appBarGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 42,
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1,
                child: TextFormField(
                  onFieldSubmitted: (searchQuery) =>
                      navigateToSearchScreen(context, searchQuery),
                  decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 23,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(top: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide(color: Colors.black38, width: 1),
                    ),
                    hintText: 'Search Amazon.in',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 42,
            color: Colors.transparent,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(
              Icons.mic,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
