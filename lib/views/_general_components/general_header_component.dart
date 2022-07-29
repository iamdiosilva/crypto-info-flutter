import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class GeneralHeaderComponent extends StatelessWidget {
  final String title;
  const GeneralHeaderComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff20253D),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.detailCurrencyName(),
        ),
      ),
    );
  }
}
