import 'dart:io';

// import 'package:path_provider/path_provider.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:test/src/core/constants/data.dart';

class KaijuGaleryImagesOnlinePage extends StatelessWidget{
  
  //Lista de Imágenes Provisionales
  final List<String> imageUrls = [
    'https://i.imgur.com/6S7tIZQ.jpg',
    'https://i.imgur.com/v6cKgbf.jpg',
    'https://i.imgur.com/itloZU1.jpg',
    // Agrega más URL de imágenes según sea necesario
  ];
  final Enemy enemy;
  
  KaijuGaleryImagesOnlinePage ({required this.enemy});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ultraBlack ,
      appBar: AppBar(
        backgroundColor: Constants.ultraBlack,
        title: Text('Galería de ${enemy.name}'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dos columnas
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => FullScreenImage(imageUrl: imageUrls[index],))
              );
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(8),
              child: Image.network(
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress ){
                  if (loadingProgress == null){
                    return child;
                  } else{
                    return CircularProgressIndicator(strokeWidth: 2,);
                  }
                },
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}


class FullScreenImage extends StatelessWidget {
  
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  // void _downloadImage(BuildContext context) async {
  //   // Usa el paquete `path_provider` para obtener el directorio de descarga.
  //   final directory = await getDownloadsDirectory();
  //   final imagePath = '${directory?.path ?? ''}/downloaded_image.jpg';
    
  //   // Descarga la imagen desde la URL y la guarda en el directorio de descarga.
  //   final response = await http.get(Uri.parse(imageUrl));
  //   final File imageFile = File(imagePath);
  //   await imageFile.writeAsBytes(response.bodyBytes);

  //   // Muestra un mensaje de confirmación.
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Imagen descargada en $imagePath'),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ultraBlack,
      appBar: AppBar(
        backgroundColor: Constants.ultraBlack,
        title: Text('Imagen Completa'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // _downloadImage(context);
              print("Aquí debería proceder la descarga de la Imagen");
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Cierra la vista de imagen completa al tocarla nuevamente.
            Navigator.pop(context);
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
          ),
        ),
      ),
    );
  }
}