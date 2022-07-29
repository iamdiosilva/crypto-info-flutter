import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:crypto_currency/views/currency_detail/components/header_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../models/currency.dart';

class CurrencyDetailsPage extends StatefulWidget {
  Currency currency;

  CurrencyDetailsPage({Key? key, required this.currency}) : super(key: key);

  @override
  State<CurrencyDetailsPage> createState() => _CurrencyDetailsPageState();
}

class _CurrencyDetailsPageState extends State<CurrencyDetailsPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final _form = GlobalKey<FormState>();
  final _value = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffCDD2DE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderComponent(
              title: widget.currency.name,
              iconPath: widget.currency.iconPath,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    child: Image.asset(widget.currency.iconPath),
                  ),
                  SizedBox(width: 15),
                  Text(
                    real.format(widget.currency.price),
                    style: AppTextStyles.detailCurrencyPrice(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
              child: Form(
                key: _form,
                child: TextFormField(
                  controller: _value,
                  style: AppTextStyles.buyForm(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff20253D), width: 2.5),
                    ),
                    labelText: 'Valor',
                    labelStyle: TextStyle(color: Color(0xff20253D)),
                    prefixIcon: Icon(
                      Icons.monetization_on_outlined,
                      color: Color(0xff20253D),
                    ),
                    suffix: Text(
                      'reais',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o valor da compra';
                    } else if (double.parse(value) < 50) {
                      return 'Compra mínina é R\$50,00 reais';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
