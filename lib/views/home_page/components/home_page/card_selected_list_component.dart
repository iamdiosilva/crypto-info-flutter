import 'package:crypto_currency/core/components/app_icons.dart';
import 'package:crypto_currency/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../models/currency.dart';

class CardSelectedListComponent extends StatelessWidget {
  double? maxWidth;
  final double? maxHeight = 50;
  final double? minWidth = 20;
  final double? minHeight = 20;
  Function()? action;
  bool? expand = false;

  CardSelectedListComponent({
    Key? key,
    this.expand,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    maxWidth = size.width * .20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceOut,
      decoration: BoxDecoration(
        color: const Color(0xff68D69D),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      width: (expand!) ? maxWidth : minWidth,
      height: (expand!) ? maxHeight : minHeight,
      child: (expand!)
          ? Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: GestureDetector(
                      onTap: action,
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                          AppIcons.removerX,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}