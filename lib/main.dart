//Tareas - EasterEgg - Cartas Estilo YUGIOH - Pasar Imágenes desplazando a los lados. 
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/pages/HomeApp.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  
  //runApp(
    
    //DevicePreview(
    //  enabled: true,
    //  builder: (context) => MyApp(),
    //),
    
    //MyApp()
  //);
}

//Widget Principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Constants.ultraWhite
      ),
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}