import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/currency.dart';
import '../../repositories/favorites_repository.dart';
import '../_general_components/general_header_component.dart';
import '../currency_detail/currency_detail_page.dart';
import 'components/tile_list_favorite_component.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const GeneralHeaderComponent(
            title: 'Favorites',
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    color: const Color(0xffCDD2DE), //Color(0xffCDD2DE),
                    child: Consumer<FavoritesRepository>(
                      builder: (context, favoritas, child) {
                        return favoritas.favoriteList.isEmpty
                            ? Container(
                                color: const Color(0xffCDD2DE),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.star),
                                      SizedBox(width: 10),
                                      Text('There are no coins in the favorites list yet.'),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: favoritas.favoriteList.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () => _showCurrencyDetails(favoritas.favoriteList[index]),
                                  child: TileListFavoriteComponent(currency: favoritas.favoriteList[index]),
                                ),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showCurrencyDetails(Currency currency) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CurrencyDetailsPage(currency: currency)),
    );
  }
}
