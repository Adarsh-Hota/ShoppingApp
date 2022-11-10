import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/account/screens/account_page.dart';
import 'package:your_shop_app/features/account/widgets/account_app_bar.dart';
import 'package:your_shop_app/features/home/widgets/cart_page.dart';
import 'package:your_shop_app/features/home/widgets/home_app_bar.dart';
import 'package:your_shop_app/features/home/widgets/home_main_page.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarIconBorderWidth = 3;
  List<Widget> pages = [
    const HomeMain(),
    const AccountPage(),
    const CartPage(),
  ];

  Widget appBarList(page) {
    if (page == 0) {
      return const HomeAppBar();
    } else if (page == 1) {
      return const AccountAppBAr();
    }
    return AppBar();
  }

  void updatePage(index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: appBarList(_page),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (index) => updatePage(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: _page == 0 ? bottomBarIconBorderWidth : 0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: _page == 1 ? bottomBarIconBorderWidth : 0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: _page == 2 ? bottomBarIconBorderWidth : 0,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
