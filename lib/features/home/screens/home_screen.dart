import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:your_shop_app/constants/global_variables.dart';
import 'package:your_shop_app/features/account/screens/account_page.dart';
import 'package:your_shop_app/features/home/widgets/cart_page.dart';
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

  void updatePage(index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_outlined),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                ],
              )
            ],
          ),
        ),
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
