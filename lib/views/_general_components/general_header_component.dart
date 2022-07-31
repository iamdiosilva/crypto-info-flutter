import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class GeneralHeaderComponent extends StatelessWidget {
  final String title;
  final Widget btnLocale;
  const GeneralHeaderComponent({Key? key, required this.title, required this.btnLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: size.height * .1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xff20253D),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.detailCurrencyName(),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: btnLocale,
          ),
        ),
      ],
    );
  }
}
