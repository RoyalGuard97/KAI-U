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
        'Habitantes de un planeta extinto producto de pruebas nucleares. Errantes por el universo, se encontraban en búsqueda de un planeta habitable.\nLlegaron a la Tierra mediante un aterrizaje forzoso, no osbtante se dieron con la grata sorpresa de que nuestro planeta ostentaba lo que ellos deseaban en un nuevo mundo. Sus habilidades ilusorias fueron suficientes para superar a los humanos, pero para su mala suerte la Tierra estaba protegia por otro ser alienígena de gran poder.',
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
        comentary: '“Aunque fuera cuestionable mi ofrecimiento de que humanos y baltan coexistan, en realidad lo hice para revelar sus verdaderos colores.\nTras frustar su intento de invasión, tuve que eliminar su nave nodriza para proteger a la humanidad. Sin duda los Baltan son enemigos formidables y muy resistentes.”',
        imgDrawer: 'assets/002_alien_baltan_2.webp',
      ),
      
      Enemy(
        'Neronga',
        'El Devorador Eléctrico',
        'Registros del antiguo Japón contaban la historia de una bestia que había sido sellada por un antiguo y poderoso samurai. Desde aquel momento la criatura se mantendría en letargo mientras se desarrollaba cada vez más con el pasar del tiempo. \nEventualmente, el continuo avance tecnológico de los humanos haría que el alimento de Neronga escaceara. Resurgiendo y arremetiendo con algunas plantas eléctricas, su encuentro y derrota en manos de Ultraman fue inevitable.',
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
        comentary: '“Neronga es una criatura potencialmente peligrosa para los humanos y su tecnología incipiente; sin embargo, gracias a mi inmunidad a la electricidad pude sortear sus ataques más mortíferos. Por supuesto, su invisibilidad es una variable que no permite distracción alguna en un guerrero como yo.”',
        imgDrawer: 'assets/003_neronga_2.webp',
      ),
      Enemy(
        'Ragon',
        'El Pseudohumanoide Nuclear',
        'Des',
        //Imágenes Principales
        ['assets/004_ragon_0.webp','assets/004_ragon_1.webp','assets/004_ragon_3.webp'],
        //Habilidades del Kaiju
        {'Rayo Radioactivo':'assets/ragon_habs.webp', 'Adaptación Submarina': 'assets/ragon_habs_1.webp'},
        color: const Color.fromARGB(255, 9, 165, 69),
        aliasOf: 'El Anfibio Primordial',
        height: '2.0 ~ 50m',
        weight: '100kg ~ 20,000T',
        planet: 'La Tierra',
        ultra: '@ULTRAMAN',
        comentary: '“Este ser humanoide es responsabilidad directa de los humanos y sus ansias de poder. Tuve que enfrentarlo con extremo cuidado para no detonar la bomba que alojaba en su cuerpo... Aún así no puedo dejar de pensar en que no era culpa suya.”',
        imgDrawer: 'assets/004_ragon_2.webp'
      ),
      Enemy(
        'Greenmons',
        'La Muerte Verde',
        'Descripción de Greenmons...',
        ['assets/005_greenmons_0.webp','assets/005_greenmons_1.webp','assets/005_greenmons_3.webp'],
        //Habilidades del Kaiju
        {'Neblina Tóxica':'assets/greenmons_habs.webp', 'Adaptación de Forma': 'assets/greenmons_habs_1.webp'},
        color: const Color.fromARGB(255, 4, 180, 72),
        aliasOf: 'La Planta Bizarra',
        height: '2 ~ 40m',
        weight: '10 ~ 20,000T',
        planet: 'La Tierra\n(Isla Oirisu)',
        ultra: '@ULTRAMAN',
        comentary: '“La Experimentación es vital para el desarrollo de una civilización, sin embargo si no se hace con debido respeto puede provocar una reacción adversa. No deseo pensar en que hubiese pasado de no intervenir.”', 
        imgDrawer: 'assets/005_greenmons_2.webp',
      ),
      Enemy(
        'Gesura',
        'GLatinoamericano',
        'Descripción de Gesura...',
        ['assets/006_gesura_0.webp','assets/006_gesura_1.webp','assets/006_gesura_3.webp'],
        //Habilidades del Kaiju
        {'Adaptación Submarina':'assets/gesura_habs.webp', 'Glándulas Venenosas': 'assets/gesura_habs_1.webp'},
        color: Color.fromARGB(255, 7, 77, 34),
        aliasOf: 'El Monstruo Marino',
        height: '60m',
        weight: '10,000T',
        planet: 'La Tierra\n(Brasil ~ Yokohama)',
        ultra: '@ULTRAMAN',
        comentary: '“Es impresionante que la Tierra albergue criaturas tan colosales, sin duda supone un problema para las embarcaciones que trasladaban su alimento predilecto.\nAl enfrentrarlo reconozco que su emisión de veneno es capaz de hacer mermar mis energías”.',
        imgDrawer: 'assets/006_gesura_2.webp'
      ),
      Enemy(
        'Antlar',
        'El Verdugo Ancestral',
        'Des',
        ['assets/007_antlar_0.webp','assets/007_antlar_1.webp','assets/007_antlar_3.webp'],
        //Habilidades del Kaiju
        {'Exoesqueleto':'assets/antlar_habs.webp', 
        'Rayo Magnético': 'assets/antlar_habs_1.webp',
        'Explosión de Escombros': 'assets/antlar_habs_2.webp'
        },
        color: Color.fromARGB(255, 4, 154, 180),
        aliasOf: 'El Monstruo Magnético',
        height: '40m',
        weight: '20,000T',
        planet: 'La Tierra (Bharadi)',
        ultra: '@ULTRAMAN',
        imgDrawer: 'assets/007_antlar_2.webp',
        comentary: '“Es dificil de creer pero parece que un antecesor mío protegió la ciudad que este ser aterrorizaba sin fin, espero poder conocerlo para rendirle mi más profundo respeto.”'
      ),
      Enemy(
        'Red King',
        'El Kaiju Berserk',
        'Descripción de Red King...',
         //Imágenes Principales
        ['assets/008_redking_0.webp','assets/008_redking_1.webp','assets/008_redking_3.webp'],
        //Habilidades del Kaiju
        {'Fuerza Extrema':'assets/redking_habs.webp'},
        color: Color.fromARGB(255, 131, 197, 25),
        aliasOf: 'El Monstruo Calavera',
        height: '45m',
        weight: '20,000T',
        planet: 'La Tierra\n(Isla Tatara)',
        ultra: '@ULTRAMAN',
        comentary: '“Cuenta con un poder físico impresionante.\nDe no contar con mi entrenamiento especial para contrarrestar sus embestidas sería casi invencible. Debo estar agradecido por su escasa inteligencia.”',
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