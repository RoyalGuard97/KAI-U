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
  final String comentary;
  final String imgDrawer;
  final String imgHab;
  Map<String, String> kaijuHabs = {};

  //Posee un Color por defecto al construirse
  Enemy(
    this.name,this.subtitle, this.description, this.img, this.kaijuHabs,
    {this.color = Colors.black,
     this.aliasOf = '-',
     this.height ='-',
     this.weight = '-',
     this.planet = '-',
     this.ultra = '-',
     this.comentary = '-',
     this.imgDrawer = '-',
     this.imgHab = '-',
    } 
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
        'El Fugitivo Intergaláctico', 
        'Oficialmente es el primer enemigo que Ultraman derrotó en su llegada a la Tierra.\nSiendo un peligroso fugitivo intergaláctico su arribo a nuestro planeta fue tan aparatoso que incluso provocó la muerte de un inocente. \nEscondido en un lago para recuperar energías, se encontraba dispuesto a eliminar a cualquiera que osara irrumpir en la zona. En su batalla contra Ultraman mostró resistencia al no querer ser nuevamente aprisionado pero finalmente cayó por el novedoso Rayo Specium.',
        //Imágenes Principales
        ['assets/001_bemular_0.webp', 'assets/001_bemular_1.webp', 'assets/001_bemular_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.webp', 'Adaptación Submarina': 'assets/bemular_habs_1.webp', 'Esfera de Viaje': 'assets/bemular_habs_2.webp'},
        color: Color.fromARGB(255, 146, 97, 5),
        aliasOf: 'Monstruo Espacial',
        height: '50m',
        weight: '25,000T',
        planet: 'Planeta M35',
        ultra: '@ULTRAMAN',
        comentary: '“Mi objetivo era detenerlo antes de que llegara a un planeta habitable. \nFui imprudente al subestimarlo, por ello un valioso terrícola perdió la vida. \nAl principio lo único que pensaba era en saldar mi deuda... Poco sabía que sería el inicio de una gran aventura que me haría sentir aprecio por la humanidad”',
        imgDrawer: 'assets/001_bemular_2.webp',
      ),

      Enemy(
        'Alien Baltan',
        'El Errante Invasor',
        'Des',
        //Imágenes Principales
        ['assets/002_alien_baltan_0.webp','assets/002_alien_baltan_1.webp','assets/002_alien_baltan_3.webp'],
        //Habilidades del Kaiju
        {'Fusión Ilusoria':'assets/baltan_habs.webp', 'Vuelo': 'assets/baltan_habs_1.webp', 'Haz de Destrucción': 'assets/baltan_habs_2.webp', 'Gigantificación por Unión': 'assets/baltan_habs_3.webp'},
        color: const Color.fromARGB(255, 9, 64, 165),
        aliasOf: 'Ninja Espacial',
        height: 'Microscópico ~ 50m',
        weight: '0.0 ~ 15,000T',
        planet: 'Extinto',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/002_alien_baltan_2.webp',
      ),
      
      Enemy(
        'Neronga',
        'El Devorador Eléctrico',
        'Des',
        //Imágenes Principales
        ['assets/003_neronga_0.webp','assets/003_neronga_1.webp','assets/003_neronga_3.webp'],
        //Habilidades del Kaiju
        {'Invisibilidad':'assets/neronga_habs.webp', 'Manipulación Eléctrica': 'assets/neronga_habs_1.webp'},
        color :Color.fromARGB(255, 231, 197, 4),
        aliasOf: 'El Monstruo Traslúcido',
        height: '45m',
        weight: '40,000T',
        planet: 'La Tierra',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/003_neronga_2.webp',
      ),
      Enemy(
        'Ragon',
        'El Pseudohumanoide Nuclear',
        'Des',
        //Imágenes Principales
        ['assets/004_ragon_0.webp','assets/004_ragon_1.webp','assets/004_ragon_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
        color: const Color.fromARGB(255, 9, 165, 69),
        aliasOf: 'El Anfibio Primordial',
        height: '2.0 ~ 50m',
        weight: '100kg ~ 20,000T',
        planet: 'La Tierra',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/004_ragon_2.webp'
      ),
      Enemy(
        'Greenmons',
        'La Muerte Verde',
        'Descripción de Greenmons...',
        ['assets/005_greenmons_0.webp','assets/005_greenmons_1.webp','assets/005_greenmons_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
        color: const Color.fromARGB(255, 4, 180, 72),
        aliasOf: 'La Planta Bizarra',
        height: '2 ~ 40m',
        weight: '10 ~ 20,000T',
        planet: 'La Tierra (Isla Oirisu)',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/005_greenmons_2.webp'
      ),
      Enemy(
        'Gesura',
        'GLatinoamericano',
        'Descripción de Gesura...',
        ['assets/006_gesura_0.webp','assets/006_gesura_1.webp','assets/006_gesura_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
        color: Color.fromARGB(255, 7, 77, 34),
        aliasOf: 'La Monstruosidad Marina',
        height: '60m',
        weight: '10,000T',
        planet: 'La Tierra\n(Brasil ~ Yokohama)',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/006_gesura_2.webp'
      ),
      Enemy(
        'Antlar',
        'El Verdugo Ancestral',
        'Des',
        ['assets/007_antlar_0.webp','assets/007_antlar_1.webp','assets/007_antlar_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
        color: Color.fromARGB(255, 4, 154, 180),
        aliasOf: 'El Monstruo Magnético',
        height: '40m',
        weight: '20,000T',
        planet: 'La Tierra (Bharadi)',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/007_antlar_2.webp'
      ),
      Enemy(
        'Red King',
        'El Kaiju Berserk',
        'Descripción de Red King...',
         //Imágenes Principales
        ['assets/008_redking_0.webp','assets/008_redking_1.webp','assets/008_redking_3.webp'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
        color: Color.fromARGB(255, 131, 197, 25),
        aliasOf: 'El Monstruo Calavera',
        height: '45m',
        weight: '20,000T',
        planet: 'La Tierra\n(Isla Tatara)',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/008_redking_2.webp'
      ),
    ], // Enemigos de ULTRAMAN
    '@ULTRAMAN TIGA':[
      Enemy(
        'Golza',
        'El que destruye',
        'Descripcion de Golza',
        ['assets/golza.jpg'],
        //Habilidades del Kaiju
        {'Onda de Calor Traslúcida':'assets/bemular_habs.jpg', 'Adaptación Submarina': 'assets/bemular_habs_1.jpg'},
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