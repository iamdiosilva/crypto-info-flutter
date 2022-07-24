import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  runApp(App());

  //Deixa o APP FullScreen Imersivo
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
