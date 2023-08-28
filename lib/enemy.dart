import 'package:flutter/material.dart';

//Creamos la Clase Enemigo
class Enemy {
  //Variable Cadena Nombre.
  final String name;
  //Variable Cadena subtítulo.
  final String subtitle;
  //Variable Cadena descripción.
  final String description;
  //Variable cadena img clase.
  final List<String> img; 
  //Color Asociado al Enemigo
  final dynamic color;

  //Detalles Oficiales
  final String aliasOf;
  final String height;
  final String weight;
  final String planet;
  final String ultra;
  
  //Posee un Color por defecto al construirse
  Enemy(
    this.name,this.subtitle, this.description, this.img, 
    {this.color = Colors.black, this.aliasOf = '-', this.height ='-', this.weight = '-', this.planet = '-', this.ultra = '-'} 
  );
}

final Map<String,List<String>> ultraData = {
  //0 - Personaje - 1 - Logo 
  '@ULTRAMAN':['assets/ultraman_info.png','assets/ultraman_logo.png'],
  '@ULTRAMAN TIGA': ['assets/ultraman_tiga_info.png','assets/ultraman_tiga_logo.png']
};



  //Lista de Enemigos de Cada Héroe
final Map<String,List<Enemy>> ultraEnemies = {
    '@ULTRAMAN': [
      Enemy(
        'Bemular',
        'Alias: El Fugitivo Intergaláctico', 
        'Oficialmente es el primer enemigo que Ultraman derrotó en su llegada a la Tierra.\nSiendo un peligroso fugitivo intergaláctico su arribo a nuestro planeta fue tan aparatoso que incluso provocó la muerte de un inocente. \nEscondido en un lago para recuperar energías, se encontraba dispuesto a eliminar a cualquiera que osara irrumpir en la zona. En su batalla contra Ultraman mostró resistencia al no querer ser nuevamente aprisionado pero finalmente cayó por el novedoso Rayo Specium.',
        ['assets/bemular.webp','assets/001_bemular_1.webp','assets/001_bemular_2.webp'], 
        color: Color.fromARGB(255, 146, 97, 5),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),

      Enemy(
        'Alien Baltan',
        'Alias: El Errante Invasor',
        'Des',
        ['assets/alien_baltan.webp','assets/002_alien_baltan_2.webp',],
        color: const Color.fromARGB(255, 9, 64, 165),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Neronga',
        'Alias: El Devorador Eléctrico',
        'Des',
        ['assets/neronga.jpg'],
        color :Color.fromARGB(255, 231, 197, 4),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Ragon',
        'Ragon: El Pseudohumanoide Nuclear',
        'Des',
        ['assets/ragon.png'],
        color: const Color.fromARGB(255, 9, 165, 69),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Greenmons',
        'Greenmons: La Muerte Verde',
        'Descripción de Greenmons...',
        ['assets/greenmons.jpg'],
        color: const Color.fromARGB(255, 4, 180, 72),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Gesura',
        'Gesura: Latinoamericano',
        'Descripción de Gesura...',
        ['assets/gesura.png'],
        color: Color.fromARGB(255, 7, 77, 34),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Antlar',
        'Antlar: El Verdugo Ancestral',
        'Des',
        ['assets/antlar.png'],
        color: Color.fromARGB(255, 4, 154, 180),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
      Enemy(
        'Red King',
        'Red King: La Muerte Verde',
        'Descripción de Red King...',
        ['assets/red_king.jpg'],
        color: Color.fromARGB(255, 207, 204, 20),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN',
      ),
    ], // Enemigos de ULTRAMAN
    '@ULTRAMAN TIGA':[
      Enemy(
        'Golza',
        'El que destruye',
        'Descripcion de Golza',
        ['assets/golza.jpg'],
        color: Color.fromARGB(255, 132, 20, 207),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'K76',
        ultra: '@ULTRAMAN TIGA',
      ),
    ], // Enemigos de ULTRAMAN JACK
    // Agrega más listas de enemigos para otros héroes
};