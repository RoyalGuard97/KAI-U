import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';

//Botón (+ Detalles) → Simplemente abre del Drawer
class MoreDetailsWidget extends StatelessWidget {
  final Enemy enemy;

  MoreDetailsWidget({required this.enemy});
  
  
  @override
  Widget build(BuildContext context) {
    var statusHeight = MediaQuery.of(context).viewPadding.top;
    var size = MediaQuery.of(context).size;
    var screenHeight = size.height - (statusHeight);
    var screenWidth = size.width;
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      customBorder: CircleBorder(),
      child: Container(
        //Controla la Dimensión del Botón "Más Detalles"
        width: screenHeight/15.0,
        height: screenWidth/6.50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enemy.color
        ),
        child: const Icon(
          Icons.add,
          size: 24,
          color:Colors.white,
        ),
      )
    );
  }
}