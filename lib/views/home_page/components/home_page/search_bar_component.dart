import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  const SearchBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
