import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/home/screens/category_deals_screen.dart';

class TopCategoriesBox extends StatelessWidget {
  const TopCategoriesBox({Key? key}) : super(key: key);

  void navigateToCategoryDealsScreen(BuildContext context, String category) {
    Navigator.pushNamed(
      context,
      CategoryDealsScreen.routeName,
      arguments: {
        'category': category,
      },
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => navigateToCategoryDealsScreen(
              context,
              GlobalVariables.categoryImages[index]['title']!,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                top: 6.0,
                right: 0,
                bottom: 6,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
