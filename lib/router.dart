import 'package:flutter/material.dart';

import 'package:your_shop_app/features/admin_add_product/screens/add_products_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'package:your_shop_app/features/auth/screens/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomeScreen());
    case AddProductsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddProductsScreen());
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
