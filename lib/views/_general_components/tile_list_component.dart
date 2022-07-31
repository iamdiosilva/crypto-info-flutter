import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/components/app_icons.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/currency.dart';

class TileListComponent extends StatelessWidget {
  final Currency currency;
  Color? tileColor;
  bool? selected = false;
  bool? favorite = false;
  NumberFormat? locale;
  TileListComponent({
    Key? key,
    this.selected,
    this.favorite,
    required this.locale,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.linear,
        height: 65,
        decoration: BoxDecoration(
          color: (selected == null)
              ? Colors.white
              : (selected!)
                  ? tileColor = const Color(0xff20253D)
                  : tileColor = Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              //IconImage
              SizedBox(
                width: 50,
                child: (selected == null) ? Image.asset(currency.iconPath) : Image.asset((selected!) ? AppIcons.checkMark : currency.iconPath),
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
                        currency.name,
                        style: (selected == null)
                            ? AppTextStyles.unselectedCurrencyName()
                            : (selected!)
                                ? AppTextStyles.selectedCurrencyName()
                                : AppTextStyles.unselectedCurrencyName(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,

                      //Initials
                      child: Text(
                        '(${currency.initials})',
                        style: (selected == null)
                            ? AppTextStyles.unselectedCurrencyInitials()
                            : (selected!)
                                ? AppTextStyles.selectedCurrencyInitials()
                                : AppTextStyles.unselectedCurrencyInitials(),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerRight,
                  children: [
                    Positioned(
                      child: Container(),
                    ),
                    Positioned(
                      child: Text(
                        locale!.format(currency.price),
                        style: (selected == null)
                            ? AppTextStyles.unselectedCurrencyName()
                            : (selected!)
                                ? AppTextStyles.selectedCurrencyName()
                                : AppTextStyles.unselectedCurrencyName(),
                      ),
                    ),
                    (favorite == null)
                        ? (const SizedBox())
                        : (favorite!)
                            ? Positioned(
                                bottom: -12,
                                right: 0,
                                child: SizedBox(
                                  width: 35,
                                  child: Image.asset(AppIcons.star),
                                ),
                              )
                            : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
