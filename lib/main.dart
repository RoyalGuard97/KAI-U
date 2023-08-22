import 'package:flutter/material.dart';

//Constantes de Color
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
const Color ultraRed = Color(0xFFEF3340);
const Color ultraWhite = Color.fromARGB(255, 243, 238, 238);

//Función Main
void main() {
  runApp(MyApp());
}

//Widget Principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ultraWhite
      ),
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

//Widget Home
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UltraBrother M78") ,
          backgroundColor: ultraRed,
        ),
        body: UltraWidget(name: "@ULTRAMAN",img: "assets/ultraman.jpg",)
    );
  }
}


//Widget para Cada Ultra
class UltraWidget extends StatelessWidget {
  //Variables
  final String name;
  final String img;
  //Constructor
  UltraWidget({required this.name, required this.img});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Imagen
          Image.asset(
            img,
            width: 300,
            height: 500,
          ),
          //Separacionn
          const SizedBox(height: 20),
          //Botón
          ElevatedButton(
            //Acción del Botón
            onPressed: () => print("Desplegar Lista de Kaijus"),
            child: Text("Registros Kaiju"),
            //Estilo del Botón
            style: ElevatedButton.styleFrom(
              backgroundColor: ultraRed
            ),
          ),
          //Separación
          const SizedBox(height: 10,),
          //Texto
          Text(name)
        ],
      ),
    );
  }
}

