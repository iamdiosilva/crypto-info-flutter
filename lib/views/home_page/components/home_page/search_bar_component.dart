import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 50,
        width: size.width * .7,
        decoration: BoxDecoration(
          color: Color(0xff68D69D),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Center(
          child: Text('Search Bar'),
        ),
      ),
    );
  }
}
