import 'package:crypto_currency/views/home_page/components/home_page/tile_list_component.dart';
import 'package:flutter/material.dart';

import '../../../../repositories/currency_repository.dart';
import 'search_bar_component.dart';

class CurrenciesListComponent extends StatelessWidget {
  final currenciesList = CurrencyRepository.currenciesList;
  CurrenciesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xff8B93B3),
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
                  return TileListComponent(
                    iconPath: currenciesList[index].iconPath,
                    currencyName: currenciesList[index].name,
                    initials: currenciesList[index].initials,
                    price: currenciesList[index].price,
                  );
                }),
                padding: const EdgeInsets.all(16),
                itemCount: currenciesList.length,
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
