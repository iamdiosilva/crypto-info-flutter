import 'package:crypto_currency/core/components/app_icons.dart';
import 'package:flutter/material.dart';

class CancelFloatingButton extends StatelessWidget {
  Function()? action;
  bool? expand = false;

  CancelFloatingButton({
    Key? key,
    this.expand,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (expand!)
        ? FloatingActionButton(
            heroTag: 'btnCancel',
            onPressed: action,
            child: Image.asset(AppIcons.removerX),
          )
        : SizedBox();
  }
}
