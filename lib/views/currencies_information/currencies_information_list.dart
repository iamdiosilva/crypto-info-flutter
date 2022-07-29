import 'package:crypto_currency/views/_general_components/general_header_component.dart';
import 'package:crypto_currency/views/currency_detail/currency_detail_page.dart';
import 'package:flutter/material.dart';

import '../../models/currency.dart';
import '../../repositories/currency_repository.dart';
import 'components/cancel_floating_button.dart';
import 'components/favorite_button_component.dart';
import 'components/search_bar_component.dart';
import 'components/tile_list_component.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          clipBehavior: Clip.none,
          child: GeneralHeaderComponent(title: 'Currencies'),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  color: Color(0xffCDD2DE),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: currencyList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: (() {
                        _selection(index);
                      }),
                      onTap: () => _showCurrencyDetails(currencyList[index]),
                      child: TileListComponent(
                        iconPath: currencyList[index].iconPath,
                        currencyName: currencyList[index].name,
                        initials: currencyList[index].initials,
                        price: currencyList[index].price,
                        selected: selectedList.contains(currencyList[index]),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: CancelFloatingButton(
                  action: () => _cancelSelection(),
                  expand: selectedList.isNotEmpty,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FavoriteButtonComponent(),
              )
            ],
          ),
        ),
      ],
    );
  }

  _selection(int index) {
    setState(() {
      (selectedList.contains(CurrencyRepository.currenciesList[index]))
          ? selectedList.remove(CurrencyRepository.currenciesList[index])
          : selectedList.add(CurrencyRepository.currenciesList[index]);
    });
  }

  _cancelSelection() {
    setState(() {
      selectedList.clear();
    });
  }

  _showCurrencyDetails(Currency currency) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CurrencyDetailsPage(currency: currency),
      ),
    );
  }
}
