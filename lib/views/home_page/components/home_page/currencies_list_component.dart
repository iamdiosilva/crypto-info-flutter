import 'package:flutter/material.dart';

import '../../../../repositories/currency_repository.dart';

class CurrenciesListComponent extends StatelessWidget {
  final currenciesList = CurrencyRepository.currenciesList;
  CurrenciesListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
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
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Image.asset(currenciesList[index].iconPath),
                    title: Text(currenciesList[index].name),
                    trailing: Text(currenciesList[index].price.toString()),
                  );
                }),
                padding: const EdgeInsets.all(16),
                separatorBuilder: (_, __) => Divider(),
                itemCount: currenciesList.length,
              ),
            ),
            //Searchbar
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Center(child: Text('Crypto')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
