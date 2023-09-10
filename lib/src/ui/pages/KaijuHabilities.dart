import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:test/src/ui/widgets/KaijuCardWidget.dart';


class KaijuHabilitiesPage extends StatelessWidget{
  
  final Enemy enemy;
  KaijuHabilitiesPage({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        title: Text("Habilidades"),
        backgroundColor: enemy.color,
      ),
      body:
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_card.jpg'), // Reemplaza con la ruta de tu imagen
                fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el fondo
              ),
            ),
          ),
          Padding( 
          padding: EdgeInsets.only(
            top: 10.0
          ), 
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 30,
            ),
            itemCount: enemy.kaijuHabs.length,
            itemBuilder: (context, index){
              return KaijuCardWidget(
                title: (enemy.kaijuHabs.keys).toList()[index],
                description: '-',
                img: (enemy.kaijuHabs.values).toList()[index],
                enemy: enemy,
              );
            },
          ),
        )
       ],
      ) 
    );
  }
}