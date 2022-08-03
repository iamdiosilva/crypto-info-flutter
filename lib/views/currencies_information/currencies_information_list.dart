import 'package:crypto_currency/core/components/app_icons.dart';
import 'package:crypto_currency/repositories/currency_format_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/configs/app_settings.dart';
import '../../models/currency.dart';
import '../../repositories/currency_repository.dart';
import '../../repositories/favorites_repository.dart';
import '../_general_components/general_header_component.dart';

import '../currency_detail_page/currency_detail_page.dart';
import 'components/cancel_floating_button.dart';
import 'components/favorite_button_component.dart';
import '../_general_components/tile_list_component.dart';

class CurrenciesInformationList extends StatefulWidget {
  const CurrenciesInformationList({Key? key}) : super(key: key);

  @override
  State<CurrenciesInformationList> createState() => _CurrenciesInformationListState();
}

class _CurrenciesInformationListState extends State<CurrenciesInformationList> {
  late List<Currency> table;
  List<Currency> selectedList = [];

  late CurrencyRepository currencies;

  //var favoritesRepository = FavoritesRepository();

  Color selectedColor = const Color(0xff20253D);
  Color unselectedColor = Colors.white;

  late Map<String, String> loc;

  readNumberFormat() {
    loc = context.watch<AppSettings>().locale;
    CurrencyFormatRepository.format = NumberFormat.currency(locale: loc['locale'], name: loc['name']);
  }

  //Change Currency Locale
  changeCurrencyLocale() {
    final locale = loc['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = loc['locale'] == 'pt_BR' ? '\$' : 'R\$';

    return PopupMenuButton(
      tooltip: 'Change Currency Format',
      color: Color(0xffCDD2DE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      icon: Image.asset(AppIcons.locationUpdate),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Usar $locale'),
            onTap: () {
              context.read<AppSettings>().setLocale(locale, name);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //favoritesRepository = context.watch<FavoritesRepository>();
    currencies = context.watch<CurrencyRepository>();
    table = currencies.table;

    readNumberFormat();

    return Column(
      children: [
        GeneralHeaderComponent(
          title: 'Currencies',
          btnLocale: changeCurrencyLocale(),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  color: const Color(0xffCDD2DE),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: table.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: (() {
                        _selection(index);
                      }),
                      onTap: () => _showCurrencyDetails(table[index]),
                      child: TileListComponent(
                        currency: table[index],
                        selected: selectedList.contains(table[index]),
                        //favorite: favoritesRepository.favoriteList.any((fav) => fav.initials == table[index].initials),
                        locale: CurrencyFormatRepository.format,
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
                    //favoritesRepository.saveAll(selectedList);
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
      (selectedList.contains(table[index])) ? selectedList.remove(table[index]) : selectedList.add(table[index]);
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
