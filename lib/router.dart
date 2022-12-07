import 'package:flutter/material.dart';

import 'package:your_shop_app/features/admin_add_product/screens/add_products_screen.dart';
import 'package:your_shop_app/features/home/screens/category_deals_screen.dart';
import 'package:your_shop_app/features/product_details/screens/product_details_screen.dart';
import 'package:your_shop_app/features/search/screens/search_screen.dart';
import 'package:your_shop_app/models/product_modal.dart';
import 'features/home/screens/home_screen.dart';
import 'package:your_shop_app/features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case AddProductsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductsScreen(),
      );
    case CategoryDealsScreen.routeName:
      Map<String, String> passedArgument =
          routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: passedArgument['category']!,
        ),
      );
    case SearchScreen.routeName:
      Map<String, String> passedArgument =
          routeSettings.arguments as Map<String, String>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: passedArgument['searchQuery']!,
        ),
      );
    case ProductDetailsScreen.routeName:
      Map<String, Product> passedArgument =
          routeSettings.arguments as Map<String, Product>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: passedArgument['product']!,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
