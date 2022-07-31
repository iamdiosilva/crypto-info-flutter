import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/currency.dart';
import '../../repositories/currency_repository.dart';
import '../../repositories/favorites_repository.dart';
import '../_general_components/general_header_component.dart';
import '../currency_detail/currency_detail_page.dart';
import 'components/cancel_floating_button.dart';
import 'components/favorite_button_component.dart';
import '../_general_components/tile_list_component.dart';

class CurrenciesInformationList extends StatefulWidget {
  const CurrenciesInformationList({Key? key}) : super(key: key);

  @override
  State<CurrenciesInformationList> createState() => _CurrenciesInformationListState();
}

class _CurrenciesInformationListState extends State<CurrenciesInformationList> {
  List<Currency> currencyList = CurrencyRepository.currenciesList;
  List<Currency> selectedList = [];
  var favoritesRepository = FavoritesRepository();

  Color selectedColor = const Color(0xff20253D);
  Color unselectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    favoritesRepository = Provider.of<FavoritesRepository>(context);
    favoritesRepository = context.watch<FavoritesRepository>();

    return Column(
      children: [
        const GeneralHeaderComponent(title: 'Currencies'),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  color: const Color(0xffCDD2DE),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: currencyList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: (() {
                        _selection(index);
                      }),
                      onTap: () => _showCurrencyDetails(currencyList[index]),
                      child: TileListComponent(
                        currency: currencyList[index],
                        selected: selectedList.contains(currencyList[index]),
                        favorite: favoritesRepository.favoriteList.contains(currencyList[index]),
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
                child: FavoriteButtonComponent(
                  selected: selectedList.isNotEmpty,
                  action: () {
                    favoritesRepository.saveAll(selectedList);
                    _cancelSelection();
                  },
                ),
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
      MaterialPageRoute(builder: (_) => CurrencyDetailsPage(currency: currency)),
    );
  }
}
