import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/pages/KaijuGaleryImagesOnline.dart';
import 'package:test/src/ui/pages/KaijuHabilities.dart';
import 'package:test/src/ui/pages/KaijuWeakness.dart';
import 'package:test/src/ui/widgets/KaijuOptionDrawerWidget.dart';

//Widget de Barra Lateral para cada Kaiju
class KaijuDrawerWidget extends StatelessWidget {
  
  // Variable para almacenar el enemigo actual.
  final Enemy enemy;

  // Constructor que recibe el enemigo.
  KaijuDrawerWidget({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: ultraWhite,
      child: ListView(
        children: [    
          // Encabezado del Drawer con la imagen y el nombre del enemigo.
          DrawerHeader(
            decoration: BoxDecoration(
              color: enemy.color,
              image: DecorationImage(
                //La Imagen del Drawer debe ser con el enemigo alineado a la derecha 
                image: AssetImage(enemy.imgDrawer),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              //Contenedor Padre
              child: Container( 
                decoration: BoxDecoration(
                  color: enemy.color.withOpacity(0.75),
                  //Bordes Redondeados del Contenedor. 
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.5),
                  //Texto Hijo con el Nombre del Kaiju
                  child: Text(
                    enemy.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ), // Coloca aquí el widget hijo
                )
              ),
            ),
          ),
          
          // Opciones Desplegadas en el Drawer.
          ListTile(
            // Título del alias oficial del enemigo.
            title: OptionDrawerWidget(color: enemy.color, text: 'Alias Oficial: ${enemy.aliasOf}',),
          ),
          
          // Título de la altura del enemigo.
          ListTile(
            title: OptionDrawerWidget(color: Colors.orange, text: 'Altura: ${enemy.height}',),
            
          ),
         
          // Título del peso del enemigo.
          ListTile(
            title: OptionDrawerWidget(color: Colors.green, text: 'Peso: ${enemy.weight}',),
          ),
          
          // Título del planeta de origen del enemigo.
          ListTile(
            title: OptionDrawerWidget(color: Colors.lightBlueAccent, text: 'Planeta de Origen: ${enemy.planet}',),
            // onTap: () {
            //   // Acción al tocar la opción.
            //   print("prueba");
            // },
          ),

          // Título de las habilidades del enemigo.
          ListTile(
            title: OptionDrawerWidget(color: Colors.red, text: 'Habilidades', optionColor: Constants.ultraOption, ),
            onTap: () {
              // Acción al tocar la opción para mostrar las habilidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuHabilitiesPage(enemy: enemy))
              );
            },
          ),
          
          // Título de las debilidades del enemigo.
          ListTile(
            title: OptionDrawerWidget(color: Colors.purple, text: 'Debilidades', optionColor: Constants.ultraOption ),
            onTap: () {
              // Acción al tocar la opción para mostrar las debilidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuWeaknessPage(enemy: enemy))
              );
            },
          ),
          
          ListTile(
            title: OptionDrawerWidget(color: const Color.fromARGB(255, 252, 227, 2), text: 'Galería Online', optionColor: Constants.ultraOption ),
            onTap: () {
              // Acción al tocar la opción para mostrar las curiosidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuGaleryImagesOnlinePage(enemy:enemy))
              );
            },
          ),
          
          // Fila con botón de comentario y logo del Ultra.
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(9.0),
              ),
              image: DecorationImage(
                image: AssetImage("assets/Land_of_Light.webp"),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.75), BlendMode.dstATop)
              ),
              color: const Color.fromARGB(255, 66, 236, 72)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón para mostrar el comentario.
                Padding(
                  padding: EdgeInsets.only(
                    left: 25
                  ),
                  child: Container(
                    width: 127,
                    child: Image.asset(
                      //Se actualiza en Ultra Data y se ingresa mediante una llave. 
                      ultraData[enemy.ultra]![0]
                    ),
                  )
                ),
                            
                Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    top: 10,
                  ), 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.ultraRed.withOpacity(0.6),
                      elevation: 5.0,
                    ),
                    onPressed: (){
                      // Script Accionado por el Botón: Mostrar una ventana emergente con el comentario.
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            color: Color(0xFF737373), // Color de fondo oscuro
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(87, 0, 0, 0),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // Texto del comentario.
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      enemy.comentary,
                                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic ,color: Constants.ultraWhite),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  // Botón para cerrar la ventana emergente.
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cerrar', style: TextStyle(fontSize: 17),),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }, 
                    //Identificador del Botón
                    child: Padding(
                      padding:EdgeInsets.all(4.0), 
                      child: const Icon(
                        const IconData(0xe652, fontFamily: 'MaterialIcons'),
                        size: 32,
                      )
                    )
                  )
                ),
                
                // Imagen del Ultra con transparencias. .
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: 50
                //   ),
                //   child: Container(
                //     width: 127,
                //     child: Image.asset(
                //       //Se actualiza en Ultra Data y se ingresa mediante una llave. 
                //       ultraData[enemy.ultra]![0]
                //     ),
                //   )
                // ),
              ],
            )
          ),
        ],
      ),
    );
  }
}