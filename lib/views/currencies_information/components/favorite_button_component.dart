import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class FavoriteButtonComponent extends StatelessWidget {
  bool? selected = false;
  Function()? action;
  FavoriteButtonComponent({Key? key, required this.selected, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (selected!)
        ? SizedBox(
            child: FloatingActionButton.extended(
              heroTag: 'btnFavorite',
              onPressed: action,
              backgroundColor: const Color(0xff68D69D),
              icon: Icon(
                Icons.star,
                color: Color(0xff20253D),
              ),
              label: Text('Favorite', style: AppTextStyles.favouriteButton()),
            ),
          )
        : SizedBox();
  }
}
