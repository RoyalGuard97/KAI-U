import 'package:flutter/material.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/widgets/ultraWidget.dart';

//El Home de la App - Dinámico
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  PageController _pageController = PageController(); // Controlador para el PageView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("@UltraBrother M78"), // Título de la AppBar
        backgroundColor: Constants.ultraRed, // Color de fondo de la AppBar
      ),
      body: PageView(
        controller: _pageController, // Asigna el controlador al PageView
        scrollDirection: Axis.vertical, // Dirección de desplazamiento vertical
        children: [
          UltraWidget(name: "@ULTRAMAN", img: "assets/ultraman.jpg"), // Primer widget de Ultra
          UltraWidget(name: "@ULTRASEVEN", img: "assets/ultraseven.jpg"), // Primer widget de Ultra
          UltraWidget(name: "@ULTRAMAN JACK", img: "assets/ultramanjack.jpg"), // Primer widget de Ultra
          // UltraWidget(name: "@ULTRAMAN TIGA", img: "assets/ultraseven.jpg") // Segundo widget de Ultra
        ],
      ),
    );
  }
}