import 'package:crypto_currency/views/home_page/components/home_page/header_component.dart';
import 'package:flutter/material.dart';

import 'components/home_page/currencies_list_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeaderComponent(),
        SizedBox(height: 5),
        CurrenciesListComponent(),
      ],
    ));
  }
}
