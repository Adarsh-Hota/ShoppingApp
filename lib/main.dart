import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/auth/screens/auth_screen.dart';
import 'package:your_shop_app/features/home/screens/home_screen.dart';
import 'package:your_shop_app/providers/user_provider.dart';
import 'package:your_shop_app/router.dart';
import 'package:your_shop_app/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    () async {
      await authService.getUserDetails(
        context: context,
      );
    }();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YourShop App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).getUser.token.isNotEmpty
          ? const HomeScreen()
          : const AuthScreen(),
    );
  }
}
