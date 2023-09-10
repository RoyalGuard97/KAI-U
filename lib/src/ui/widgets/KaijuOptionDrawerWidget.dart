import 'package:flutter/material.dart';
// import 'package:test/src/core/constants/data.dart';

// Son los Títulos para las Opciones del Drawer
class OptionDrawerWidget extends StatelessWidget{
  final Color color;
  final String text;
  final Color optionColor;
  
  OptionDrawerWidget({required this.color, this.text = '', this.optionColor=Colors.white10});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
              radius: 1.0,
            ),
          ),
          margin: EdgeInsets.only(right: 10), // Espacio entre el círculo y el texto
        ),
        Container(
          decoration: BoxDecoration(
            color: optionColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
          )
        )
      ],
    );
  }
}