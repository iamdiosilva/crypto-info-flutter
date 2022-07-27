import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff20253D),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'description',
          style: AppTextStyles.selectedCurrencyName(),
        ),
      ),
    );
  }
}
