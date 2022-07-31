import 'package:crypto_currency/repositories/favorites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesRepository(),
    child: const App(),
  ));

  //Deixa o APP FullScreen Imersivo
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
