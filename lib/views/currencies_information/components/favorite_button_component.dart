import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class FavoriteButtonComponent extends StatelessWidget {
  const FavoriteButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FloatingActionButton.extended(
        heroTag: 'btnFavorite',
        onPressed: () {},
        backgroundColor: const Color(0xff68D69D),
        icon: Icon(
          Icons.star,
          color: Color(0xff20253D),
        ),
        label: Text('Favorite', style: AppTextStyles.favouriteButton()),
      ),
    );
  }
}
