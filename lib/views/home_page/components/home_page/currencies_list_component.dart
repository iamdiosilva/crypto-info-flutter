import 'package:flutter/material.dart';

import '../../../../models/currency.dart';
import '../../../../repositories/currency_repository.dart';
import 'search_bar_component.dart';
import 'tile_list_component.dart';

class CurrenciesListComponent extends StatefulWidget {
  const CurrenciesListComponent({Key? key}) : super(key: key);

  @override
  State<CurrenciesListComponent> createState() => _CurrenciesListComponentState();
}

class _CurrenciesListComponentState extends State<CurrenciesListComponent> {
  List<Currency> selectedCurrency = [];
  Color selectedColor = const Color(0xff20253D);
  Color unselectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xffCDD2DE),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      setState(() {
                        (selectedCurrency.contains(CurrencyRepository.currenciesList[index]))
                            ? selectedCurrency.remove(CurrencyRepository.currenciesList[index])
                            : selectedCurrency.add(CurrencyRepository.currenciesList[index]);
                      });
                    },
                    child: TileListComponent(
                      iconPath: CurrencyRepository.currenciesList[index].iconPath,
                      currencyName: CurrencyRepository.currenciesList[index].name,
                      initials: CurrencyRepository.currenciesList[index].initials,
                      price: CurrencyRepository.currenciesList[index].price,

                      //receive true or false if is selected
                      selected: (selectedCurrency.contains(CurrencyRepository.currenciesList[index])),
                    ),
                  );
                }),
                padding: const EdgeInsets.all(16),
                itemCount: CurrencyRepository.currenciesList.length,
              ),
            ),
            //Searchbar
            const Positioned(
              top: -35,
              left: 0,
              right: 0,
              child: SearchBarComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
