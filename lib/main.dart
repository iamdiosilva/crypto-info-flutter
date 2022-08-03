import 'package:crypto_currency/repositories/currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/configs/app_settings.dart';
import 'core/configs/hive_config.dart';
import 'repositories/account_repository.dart';
import 'repositories/favorites_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountRepository()),
        ChangeNotifierProvider(create: (context) => FavoritesRepository()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => CurrencyRepository()),
      ],
      child: const App(),
    ),
  );

  //Deixa o APP FullScreen Imersivo
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
