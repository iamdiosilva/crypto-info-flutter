import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_text_styles.dart';
import '../../models/currency.dart';
import 'components/currency_header_component.dart';

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
  double amount = 0;

  _buy() {
    if (_form.currentState!.validate()) {
      //save purchase

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Purchase made successfully!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffCDD2DE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrencyHeaderComponent(
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
              child: Column(
                children: [
                  (amount > 0)
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Text(
                              '$amount ${widget.currency.initials}',
                              style: AppTextStyles.currencylabelAmount(),
                            ),
                            margin: EdgeInsets.only(bottom: 24),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xff68D69D).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 24),
                        ),
                  Form(
                    key: _form,
                    child: TextFormField(
                      controller: _value,
                      style: AppTextStyles.buyForm(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
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
                      onChanged: (value) {
                        setState(() {
                          amount = (value.isEmpty) ? 0 : double.parse(value) / widget.currency.price;
                        });
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff68D69D))),
                      onPressed: () => _buy(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Buy',
                              style: AppTextStyles.unselectedCurrencyName(),
                            ),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
