import 'package:crypto_currency/core/components/app_icons.dart';
import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String title;
  final String iconPath;
  const HeaderComponent({Key? key, required this.title, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            enableFeedback: true,
            icon: Image.asset(AppIcons.arrowBack),
          ),
          Text(
            title,
            style: AppTextStyles.detailCurrencyName(),
          ),
          SizedBox(width: 50),
        ],
      ),
    );
  }
}
