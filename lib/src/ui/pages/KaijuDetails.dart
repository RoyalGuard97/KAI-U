import 'package:flutter/material.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:test/src/ui/pages/HomeApp.dart';
import 'package:test/src/ui/widgets/KaijuButtonChangeImages.dart';
import 'package:test/src/ui/widgets/KaijuButtonMoreDetails.dart';
import 'package:test/src/ui/widgets/KaijuDrawerWidget.dart';

class KaijuDetailsPage extends StatelessWidget {
  
  // Variable para almacenar el enemigo actual.
  final Enemy enemy;
  KaijuDetailsPage({required this.enemy});
  

  @override
  Widget build(BuildContext context) {
    //Variables Reponsive
    var statusHeight = MediaQuery.of(context).viewPadding.top;
    var size = MediaQuery.of(context).size;
    double screenHeight = size.height - (statusHeight);
    double screenWidth = size.width;
  
  return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          enemy.name, //Nombre del Enemigo
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: enemy.color,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                // Icono del Ultra en el AppBar
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeApp())
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 25.0,   // Espacio en la parte superior
                      right: 20.0, // Espacio en la parte derecha
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.ultraWhiteLight,
                      ),
                      height: 42,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(ultraData[enemy.ultra]![1]),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
      // Menú deslizante (drawer)
      drawer: KaijuDrawerWidget(enemy: enemy),
      body: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen del Kaiju con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                //Usamos este Widget para Elegir las Imágenes a Mostrar.
                height: screenHeight/2.85, //Altura de la Imagen según la Pantalla 
                width : screenWidth, //Ancho de la Imagen según la Pantalla
                child: ImageChanger(enemy: enemy),
              ),
            ),
            
            //Espaciado - 1/50 de la Altura de la Pantalla
            SizedBox(height: screenHeight/50,),
            
            // Alias del Kaiju & Subtítulo
            Text(
              'Alias: ${enemy.subtitle}',
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
           
           //Espaciado - 1/50 de la Altura de la Pantalla
            SizedBox(height: screenHeight/50,),
            
            // Descripción Específica del Kaiju
            Container(
              //Dimensiones de la Caja con el Texto "Descripción"
              height: screenHeight/2.85, //Altura de la Imagen según la Pantalla
              width: screenWidth, //Ancho de la Imagen según la Pantalla
              
              decoration: BoxDecoration(
                color: Constants.ultraWhiteLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Constants.ultraWhite,
                  width: 4,
                ),
              ),
              child: Scrollbar(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: 
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                            enemy.description,
                            style: TextStyle(
                              fontSize: 19,
                              color: Constants.ultraGray,
                            ),
                            textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                    )
                  ],
                ),
              ),
            ),
            
            //Espaciado Estratégico
            Expanded(child: Container()),
            // Detalles adicionales del enemigo
            MoreDetailsWidget(enemy: enemy),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}