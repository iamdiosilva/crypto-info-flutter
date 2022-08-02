import 'package:flutter/material.dart';

import '../account_page/account_page.dart';
import '../currencies_information/currencies_information_list.dart';
import '../favorite_page/favorite_page.dart';
import '../wallet_page/wallet_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late PageController pController;

  @override
  void initState() {
    super.initState();
    pController = PageController(initialPage: currentPage);
  }

  _setCurrentPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pController,
        onPageChanged: (value) => _setCurrentPage(value),
        children: [
          CurrenciesInformationList(),
          FavoritePage(),
          WalletPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff20253D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        onTap: (pageIndex) {
          pController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Todas'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
