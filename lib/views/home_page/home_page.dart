import 'package:flutter/material.dart';

import 'components/home_page/currencies_information_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurrenciesInformationList(),
    );
  }
}
