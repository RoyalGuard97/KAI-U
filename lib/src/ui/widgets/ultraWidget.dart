import 'package:flutter/material.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/pages/KaijuGalery.dart';


//Widget - Para ingresar a los registros de cada Ultra. 
class UltraWidget extends StatelessWidget {
  // Variables para almacenar el nombre y la imagen del Ultra
  final String name;
  final String img;
  
  // Constructor para inicializar las variables
  UltraWidget({required this.name, required this.img});
  
  @override
  Widget build(BuildContext context) {
    
    //Variables Responsive
    var statusHeight = MediaQuery.of(context).viewPadding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - (statusHeight);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()), // Espacio flexible arriba
          Container(
            
            // Contola Tamaño de la Imagen Principal Según el Tamaño de la Pantalla
            height: screenHeight/1.50,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2.25,
                offset: const Offset(0,4)
              )]
            ),
            child:
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(22.5)
                ),
                child: Image.asset(img),
              ), // Imagen del Ultra
          ),
          Expanded(child: Container()), // Espacio flexible en el medio
          ElevatedButton(
            onPressed: (){
              // Navegar a la galería de Kaijus
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaijuGaleryPage(ultraName: name,))
              );
            },
            child: Text("◀ Registros Kaiju ▶"), // Texto del botón
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.ultraRed,
              elevation: 7.0 // Color de fondo del botón
            ),
          ), // Botón
          Expanded(child: Container()), // Espacio flexible en el medio
          Text(name), // Nombre del Ultra
          SizedBox(height: 30,) // Espacio vertical abajo
        ],
      ),
    );
  }
}