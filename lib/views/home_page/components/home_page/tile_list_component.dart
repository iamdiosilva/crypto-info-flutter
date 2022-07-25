import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_text_styles.dart';

class TileListComponent extends StatelessWidget {
  final String iconPath;
  final String currencyName;
  final String initials;
  final double price;
  const TileListComponent({Key? key, required this.iconPath, required this.currencyName, required this.initials, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Package intl para formatação do valor da moeda
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 3,
              color: Colors.black.withOpacity(.2),
              offset: const Offset(2, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              //IconImage
              SizedBox(
                width: 50,
                child: Image.asset(iconPath),
              ),

              //Space between icon image and currency name
              const SizedBox(width: 10),

              //CurrencyName and CurrencyInitials
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,

                      //CurrencyName
                      child: Text(
                        currencyName,
                        style: AppTextStyles.currencyName(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,

                      //Initials
                      child: Text(
                        '($initials)',
                        style: AppTextStyles.currencyInitials(),
                      ),
                    ),
                  ],
                ),
              ),

              //Price
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(real.format(price)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
