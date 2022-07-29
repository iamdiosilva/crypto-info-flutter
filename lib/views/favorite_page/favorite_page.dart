import 'package:flutter/material.dart';

import '../_general_components/general_header_component.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            GeneralHeaderComponent(
              title: 'Favorites',
            )
          ],
        ),
        color: Color(0xffCDD2DE),
      ),
    );
  }
}
