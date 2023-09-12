import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app_fi/core/utils/colors.dart';
import 'package:my_app_fi/module/account/account.dart';
import 'package:my_app_fi/module/giraph/giraph.dart';
import 'package:my_app_fi/module/home/home.dart';
import 'package:my_app_fi/module/profile/profile.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;

  late Home home;

  late Giraph giraph;

  late Account account;

  late Profile profile;

  late List<Widget> pages;

  late Widget currentpage;

  @override
  void initState() {
    super.initState();
    home = Home();
    giraph = Giraph();
    account = Account();
    profile = Profile();

    pages = [home, giraph, account, profile];

    currentpage = home;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: homeBody,
        onButtonPressed: (int index) {
          setState(() {
            currentIndex = index;
            currentpage = pages[index];
          });
        },
        iconSize: 25,
        selectedIndex: currentIndex,
        barItems: [
          BarItem(
            icon: Icons.home_outlined,
            title: 'Home',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.bar_chart_outlined,
            title: 'Chart',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),

          BarItem(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Account',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),
          BarItem(
            icon: Icons.person_outline,
            title: 'Profile',
            activeColor: Colors.white,
            inactiveColor: Colors.white,
          ),

          /// Add more BarItem if you want
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go("/addPage");
        },
        backgroundColor: homeBody,
        child: Icon(Icons.add),
      ),
      body: currentpage,
    );
  }
}
