import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:test/src/core/constants/data.dart';

class KaijuWeaknessPage extends StatelessWidget{
  
  final Enemy enemy;
  KaijuWeaknessPage({required this.enemy});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Debilidades"),
        backgroundColor: enemy.color,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 400,
          color: Constants.ultraRed,
        ),
      )
    );
  }
}