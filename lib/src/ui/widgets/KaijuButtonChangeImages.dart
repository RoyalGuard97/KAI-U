import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';


class ImageChanger extends StatefulWidget {
  //Pasamos la referencia del enemigo actual
  final Enemy enemy;
  const ImageChanger({required this.enemy});

  

  @override
  _ImageChangerState createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  
  late Enemy enemy;
  List<String> kaijuImages = [];
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    enemy = widget.enemy;
    kaijuImages = enemy.img;
  }

  void changeImageNext() {
    setState(() {
      // Cambia la imagen actual al siguiente índice en forma circular.
      currentImageIndex = (currentImageIndex + 1) % kaijuImages.length;
    });
  }

  void changeImagePrevious() {
    setState(() {
      // Cambia la imagen actual al índice anterior en forma circular.
      currentImageIndex = (currentImageIndex - 1 + kaijuImages.length) % kaijuImages.length;
    });   // 0 - 1 - 2 - 3
  }

  Timer? _timer;
  
  void _startTimer(){
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer){
      changeImageNext();
    });
  }

  void _stopTimer(){
    _timer?.cancel();
  }

  @override
  void dispose(){
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    //Reconocimiento de Gestos - EFECTO IA
    return GestureDetector(
      // onHorizontalDragUpdate: (details) {
      //   // Obtén la diferencia en la posición horizontal entre el inicio y el final del deslizamiento.
      //   double delta = details.primaryDelta ?? 0;
      //   if (delta > 0) {
      //     // Deslizamiento hacia la izquierda.
      //     changeImageNext(); // Llama a la función correspondiente.
      //   }
      // },
      
      onLongPress: (){
        _startTimer();
      },

      onLongPressEnd: (details) {
        _stopTimer();
      },

      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(kaijuImages[currentImageIndex]),
          ),
          
          // Par de Botones que Generan la Acción de Cambio de Imagen.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Material(
                color: enemy.color.withOpacity(0.5),
                  child: InkWell(
                    onTap: changeImagePrevious,
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_left,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()), // Este widget ocupa el espacio restante,
              ClipOval(
                child: Material(
                  color: enemy.color.withOpacity(0.5),
                  child: InkWell(
                    onTap: changeImageNext,
                    child: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}