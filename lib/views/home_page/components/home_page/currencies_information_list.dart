import 'package:flutter/material.dart';

import '../../../../models/currency.dart';
import '../../../../repositories/currency_repository.dart';

import 'currencies_information/card_selected_list_component.dart';
import 'currencies_information/favorite_button_component.dart';
import 'currencies_information/header_component.dart';
import 'currencies_information/search_bar_component.dart';
import 'currencies_information/tile_list_component.dart';

class CurrenciesInformationList extends StatefulWidget {
  const CurrenciesInformationList({Key? key}) : super(key: key);

  @override
  State<CurrenciesInformationList> createState() => _CurrenciesInformationListState();
}

class _CurrenciesInformationListState extends State<CurrenciesInformationList> {
  List<Currency> currencyList = CurrencyRepository.currenciesList;
  List<Currency> selectedList = [];

  Color selectedColor = const Color(0xff20253D);
  Color unselectedColor = Colors.white;

  _selection(int index) {
    setState(() {
      (selectedList.contains(CurrencyRepository.currenciesList[index]))
          ? selectedList.remove(CurrencyRepository.currenciesList[index])
          : selectedList.add(CurrencyRepository.currenciesList[index]);
      debugPrint('selection');
    });
  }

  _cancelSelection() {
    setState(() {
      selectedList.clear();
      debugPrint('cancelou');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Color(0xff6A6D7D),
            ),
            HeaderComponent(),

            //Container ListBuilder
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  width: size.width,
                  height: size.height * .825,
                  decoration: const BoxDecoration(
                    color: Color(0xffCDD2DE),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: currencyList.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onLongPress: (() {
                          _selection(index);
                        }),
                        child: TileListComponent(
                          iconPath: currencyList[index].iconPath,
                          currencyName: currencyList[index].name,
                          initials: currencyList[index].initials,
                          price: currencyList[index].price,
                          selected: (selectedList.contains(currencyList[index])),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Searchbar
            Positioned(
              top: size.height * 0.120,
              left: 0,
              child: SearchBarComponent(),
            ),

            //Card Selection
            Positioned(
              top: size.height * 0.120,
              right: size.width * 0.04,
              child: Center(
                child: CardSelectedListComponent(
                  action: (() => _cancelSelection()),
                  expand: selectedList.isNotEmpty,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: (selectedList.isNotEmpty) ? const FavoriteButtonComponent() : const SizedBox(),
            )
          ],
        ),
      ],
    );
  }
}
