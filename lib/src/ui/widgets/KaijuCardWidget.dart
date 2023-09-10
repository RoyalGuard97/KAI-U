import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';

class KaijuCardWidget extends StatelessWidget {
  

  final String title;
  final String description;
  final String img;
  final Enemy enemy;
  
  KaijuCardWidget({required this.title, required this.description, required this.img, required this.enemy});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/card_background.jpg"), // Agrega la imagen de fondo de la carta
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 0.75,
            ),
            color: Colors.black.withOpacity(0.1),
          ),
          width: 298,
          // Ajusta el ancho de la carta según tus necesidades
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(5),
            color: enemy.color.withOpacity(0.5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
            
                      Container(
                        decoration: BoxDecoration(
                          color: enemy.color,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.72,
                              blurRadius: 0.72,
                              color: Colors.white,
                              offset: Offset(-1.5,-1.5)
                            )
                          ],
                          border: Border(
                            top: BorderSide(
                              color: Colors.white,
                              width: 0.0,
                            ),
                            left: BorderSide(
                              color: Colors.white,
                              width: 0.0,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            )
                          )
                        ),
                        height: 25,
                        width: 290,
                        child: 
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            title.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              )
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20,),
                      
                      Container(
                        height: 185,
                        width: 290,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2.5,
                              blurRadius: 2.0,
                              color: const Color.fromARGB(255, 78, 77, 77),
                              offset: Offset(-1.0, 1.0)
                            )
                          ],
                          border: Border.all(
                            color: Color.fromARGB(181, 48, 47, 47),
                            width: 0.5,
                          )
                        ), // Agrega una imagen o contenido aquí
                        child: Image.asset(
                          img
                          ),
                      ),
                      
                      SizedBox(height: 20,),

                      Container(
                        height: 70,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 167, 205, 213),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              color: Color.fromARGB(238, 19, 57, 181),
                              offset: Offset(0, 0)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            description,
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7.5,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}