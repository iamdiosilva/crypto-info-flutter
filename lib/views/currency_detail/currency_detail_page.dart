import 'package:crypto_currency/views/currency_detail/components/header_component.dart';
import 'package:flutter/material.dart';

import '../../models/currency.dart';

class CurrencyDetailsPage extends StatefulWidget {
  Currency currency;
  CurrencyDetailsPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<CurrencyDetailsPage> createState() => _CurrencyDetailsPageState();
}

class _CurrencyDetailsPageState extends State<CurrencyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffCDD2DE),
        child: Column(
          children: [
            HeaderComponent(
              title: widget.currency.name,
              iconPath: widget.currency.iconPath,
            ),
          ],
        ),
      ),
    );
  }
}
