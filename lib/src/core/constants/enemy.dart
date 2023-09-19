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
        'Siendo un peligroso fugitivo intergaláctico su arribo a nuestro planeta fue tan aparatoso que incluso provocó la muerte de un inocente. \nEscondido en un lago para recuperar energías, se encontraba dispuesto a eliminar a cualquiera que osara irrumpir en la zona. En su batalla contra Ultraman mostró resistencia al no querer ser nuevamente aprisionado pero finalmente cayó por el novedoso Rayo Specium. Oficialmente es el primer enemigo que Ultraman derrotó en su llegada a la Tierra.',
        //Imágenes Principales
        ['assets/001_bemular_0.webp', 'assets/001_bemular_1.webp', 'assets/001_bemular_3.webp','assets/001_bemular_4.webp','assets/001_bemular_5.webp','assets/001_bemular_6.webp'],
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
        'Habitantes de un planeta extinto producto de pruebas nucleares. Errantes por el universo, se encontraban en búsqueda de un planeta habitable.\nLlegaron a la Tierra mediante un aterrizaje forzoso, no osbtante, se dieron con la grata sorpresa de que nuestro planeta ostentaba lo que ellos deseaban en un nuevo mundo. Sus habilidades ilusorias fueron suficientes para superar a los humanos, pero para su mala suerte la Tierra estaba protegida por otro ser alienígena de gran poder.',
        //Imágenes Principales
        ['assets/002_alien_baltan_0.webp','assets/002_alien_baltan_1.webp','assets/002_alien_baltan_3.webp','assets/002_alien_baltan_4.webp','assets/002_alien_baltan_5.webp','assets/002_alien_baltan_6.webp','assets/002_alien_baltan_7.webp','assets/002_alien_baltan_8.webp'],
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
        ['assets/003_neronga_0.webp','assets/003_neronga_1.webp','assets/003_neronga_3.webp','assets/003_neronga_4.webp','assets/003_neronga_5.webp','assets/003_neronga_6.webp','assets/003_neronga_8.webp','assets/003_neronga_9.webp'],
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
        'Habitante de un mundo submarino, esta entidad con rasgos humanoides vivía en paz y armonía hasta la inminente explosión de una bomba nuclear. Como consecuencia ragon mutó genéticamente hasta convertirse en un gigante único en su especie. Ya sea por inconsciencia o venganza, este ser se volvería extremadamente peligroso; para colmo de males, este alojaba en su cuerpo una segunda bomba atómica sin estallar.\nSin duda fue complicado para Ultraman lidiar con la situación.',
        //Imágenes Principales
        ['assets/004_ragon_0.webp','assets/004_ragon_3.webp','assets/004_ragon_4.webp','assets/004_ragon_5.webp','assets/004_ragon_6.webp','assets/004_ragon_7.webp','assets/004_ragon_8.webp'],
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
        'La Muerte Orgánica',
        'Originalmente parte de una flora perteneciente a las costas de Japón. Se usó en una serie de experimentos que resultaron en un espécimen con desarrollo acelerado, como consecuencia, Greenmons despertó cierta consciencia además de un fuerte de sentido de vengaza hacia aquellos involucrados en su desviación natural. Sus deseos asesinos aumentaron a la par de su colosal figura por lo que Ultraman debía enfrentarlo directamente.',
        ['assets/005_greenmons_0.webp','assets/005_greenmons_1.webp','assets/005_greenmons_3.webp','assets/005_greenmons_5.webp','assets/005_greenmons_6.webp','assets/005_greenmons_7.webp','assets/005_greenmons_8.webp','assets/005_greenmons_9.webp'],
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
        'El Kaiju Latinoamericano',
        'Proveniente de Latinoamérica, Gesura es una terrorífica leyenda conocida por todo marinero respetadp. Acusado de hundir un sinfin de navíos, los relatos hablan de como a través de este terrible acto lograba calmar su hambre voraz.\nEn un momento se llegaría a conocer la predilección de Gesura por el cacao, de modo que todo navío que lo transportara en su hábitat estaría en peligro. El Héroe de Rojo y Plata consiguió vencerlo mas no antes de recibir una buena muestra de su factor venenoso.',
        ['assets/006_gesura_0.webp','assets/006_gesura_1.webp','assets/006_gesura_3.webp','assets/006_gesura_4.webp','assets/006_gesura_5.webp','assets/006_gesura_6.webp'],
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
        'Esta ancestral criatura sometió a una antigua civilización que había perdido a su protector hacía mucho tiempo. Cuando la patrulla científica intentó detenerlo, su ira se desató poniendo en riesgo a los habitantes. \nEn su batalla contra Ultraman demostró su increíble resistencia; de no ser por un regalo místico dejado atrás por un legendario héroe, posiblemente Ultraman habría tenido muchísimos problemas.\nSorprendentemente es el primer enemigo en resistir completamente el poder de un Rayo Specium.',
        ['assets/007_antlar_0.webp','assets/007_antlar_1.webp','assets/007_antlar_3.webp','assets/007_antlar_4.webp','assets/007_antlar_5.webp','assets/007_antlar_6.webp','assets/007_antlar_7.webp','assets/007_antlar_8.webp','assets/007_antlar_9.webp'],
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
        comentary: '“Es dificil de creer pero parece que un antecesor mío protegió la ciudad que este ser aterrorizaba sinfín, espero poder conocerlo para rendirle mi más profundo respeto. Ahora que lo pienso... ¿Sabía de antemano que el Rayo Specium no serviría contra él?”'
      ),
      Enemy(
        'Red King',
        'El Kaiju Berserk',
        'En una isla remota, un conjunto de criaturas bestiales se enfrentan pero sólo una es capaz de emerger como el vencedor. Siendo una monstruosidad de poder incontrolable toda acción que realizara pareciera poseer un componente asesino. Lamentablemente para él y su fuerza imparable se topó con un rival capaz de usar sus fortalezas contra él mismo, concluyendo en una apabullante derrota. Sin duda la criatura más barbárica y físicamente poderosa que alguna vez habitó la Tierra.',
         //Imágenes Principales
        ['assets/008_redking_0.webp','assets/008_redking_1.webp','assets/008_redking_3.webp','assets/008_redking_4.webp','assets/008_redking_5.webp','assets/008_redking_6.webp','assets/008_redking_7.webp'],
        //Habilidades del Kaiju
        {'Fuerza Extrema':'assets/redking_habs.webp'},
        color: Color.fromARGB(255, 80, 197, 25),
        aliasOf: 'El Monstruo Calavera',
        height: '45m',
        weight: '20,000T',
        planet: 'La Tierra\n(Isla Tatara)',
        ultra: '@ULTRAMAN',
        comentary: '“Cuenta con un poder físico impresionante.\nDe no contar con mi entrenamiento especial para contrarrestar sus embestidas sería casi invencible. Debo estar agradecido por su escasa inteligencia.”',
        imgDrawer: 'assets/008_redking_2.webp'
      ),
      Enemy(
        'Gabora',
        'El Devorador Radioactivo',
        'De los Kaijus más peligrosos que habitaron la Tierra en la edad contemporánea. Desde el subsuelo Gabora emergería tras una tormeta arrasadora. Si bien su presencia ya causaba estragos en pueblos aledaños, mayor sería la preocupación al descubrir su alimento predilecto: Uranio. Al igual que Neronga su presencia era incompatible con los avances de la humanidad. Depósitos de Uranio comprometidos causarían un efecto nefasto para la naturaleza. Ultraman debía intervenir antes de presenciar un horror inimaginable.',
         //Imágenes Principales
        ['assets/009_gabora_0.webp','assets/009_gabora_1.webp','assets/009_gabora_3.webp'],
        //Habilidades del Kaiju
        {'Haz Radioactivo':'assets/gabora_habs.webp', 'Excavación': 'assets/gabora_habs_1.webp'},
        color: Color.fromARGB(255, 197, 108, 25),
        aliasOf: 'El Monustruo de Uranio',
        height: '50m',
        weight: '25,000T',
        planet: 'La Tierra (Tokio)',
        ultra: '@ULTRAMAN',
        comentary: '“Una criatura de esta naturaleza haría peligrar a toda civilización de tipo I. Dado a que su fuente de alimento es un material radioactivo es posible que toda interacción que tenga con tecnología humana sea por lo menos incómoda para el medio ambiente ¿Será posible que existan más especímenes de estos por el universo? ”',
        imgDrawer: 'assets/009_gabora_2.webp'
      ),
      Enemy(
        'Jirahs',
        'El Aberrante Experimento',
        'Conocida es la leyenda del moustruo del Lago Ness, sin embargo... ¿Quién te dijo que era solo una leyenda? Un reconocido y renombrado científico lograría estudiar a esta majestuosa criatura para dominarla. A través de diferentes experimentos lograría engendrar lo que conocemos como Jirahs, un increible Kaiju muy parecido al que llaman Rey de los Mostruos. Tras revelarse contra su amo, Jirahs enfrentaría a Ultraman en una de las batallas mas tortuosas y bizarras de la Serie',
         //Imágenes Principales
        ['assets/010_jirahs_0.webp','assets/010_jirahs_1.webp','assets/010_jirahs_3.webp'],
        //Habilidades del Kaiju
        {'Adaptación Submarina':'assets/jirahs_habs.webp', 'Rayo de Onda Eléctrica': 'assets/jirahs_habs_1.webp'},
        color: Color.fromARGB(255, 161, 184, 34),
        aliasOf: 'Dinosaurio Superior',
        height: '45m',
        weight: '20,000T',
        planet: 'La Tierra\n(Lago Ness ~ Kiyatama)',
        ultra: '@ULTRAMAN',
        comentary: '“No puedo dejar de pensar en que fui un poco duro con él... ”',
        imgDrawer: 'assets/010_jirahs_2.webp'
      ),
      Enemy(
        'Gango',
        'El Monstruo Onírico',
        'De Origen lovecraftniano, Gango es una manifestación de una mente villanesca y retorcida. Desde los cielos un extraño elemento aterrizaría en la Tierra. Tras ser analizado se confirmaría que es capaz de interactuar con seres inteligentes para manifestar sus deseos inmediatos. Una vez Gango es plasmado en la realidad entraría en descontrol combatiendo así contra Ultraman. Finalmente su creador lograría recobrar lucidez y deshacer su existencia.',
         //Imágenes Principales
        ['assets/011_gango_0.webp','assets/011_gango_1.webp','assets/011_gango_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 145, 87, 21),
        aliasOf: 'Kaiju de Ondas\nCerebrales',
        height: '2.2 ~ 50m',
        weight: '60 ~ 60,000T',
        planet: 'Indeterminado',
        ultra: '@ULTRAMAN',
        comentary: '“Es increíble pensar en un material capaz de interactuar con nuestras ondas cerebrales. A pesar de su potencial ilimitado para lograr la paz en el universo lo ideal es apartarlo de toda interacción... ya que incluso el ser más noble ha tenido pensamientos no tan gráciles en algún momento”.',
        imgDrawer: 'assets/011_gango_2.webp'
      ),

      Enemy(
        'Mummy Man',
        'El Amo Ancestral',
        'Antiguo ser terrestre de hace milenios, fue descubierto en la edad comtemporánea por un grupo de científicos. Tras diversos intentos de investigación, en las instalaciones donde yacía el supuesto cuerpo; se canalizaría energía electrica suficiente para reanimar a la aterradora momia. Siendo el verdugo de múltiples vidas humanas se le intentó contener hasta que su existencia se volvió insostenible. Finalizando su vida junto a un grito gutural despertaría a una peligrosa criatura legendaria.',
         //Imágenes Principales
        ['assets/012_mummy_man_0.webp','assets/012_mummy_man_1.webp','assets/012_mummy_man_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 137, 138, 136),
        aliasOf: 'La Momia Fantasmal',
        height: '2m',
        weight: '110kg',
        planet: 'La Tierra\n(Okutama)',
        ultra: '@ULTRAMAN',
        comentary: '“Pese a la limitación tecnológica de los humanos se las arreglaron para conservar un cuerpo a tal punto de poder reanimarlo. Desconozco mucho de su cultura antigua pero... es posible que haya sido una figura importante. Aún así, cualquier distorsión entre la vida y la muerte solo puede traer pesares. ”',
        imgDrawer: 'assets/012_mummy_man_2.webp'
      ),
      Enemy(
        'Dodongo',
        'El Equino Dracónico',
        'Contraparte simbiótica de una momia antigua. Es posible que fuera el protector de su amo antepasado. Muerta su figura superior, Dodongo se dispuso a plasmar su venganza contra esta nueva era; destruyendo todo a su paso, llegaría una mina donde aterrorizaría a los trabajadores. La Patrulla Científica hizo lo posible para detenerlo propinándole daño pero finalmente contarían con Ultraman para darle un triste pero necesario tiro de gracia.',
         //Imágenes Principales
        ['assets/013_dodongo_0.webp','assets/013_dodongo_1.webp','assets/013_dodongo_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 89, 184, 34),
        aliasOf: 'El Monstruo de la\nMomia',
        height: '30m',
        weight: '25,000T',
        planet: 'La Tierra\n(Okutama)',
        ultra: '@ULTRAMAN',
        comentary: '“Son obvias las razones, pero son pocas las criaturas del universo que permitan cabalgar a los de mi especie. Fue una experiencia novedosa, he de admitir.\nLástima que este sirviente sin rumbo terminó convirtiéndose en un peligro incontrolable”.',
        imgDrawer: 'assets/013_dodongo_2.webp'
      ),
      Enemy(
        'Pestar',
        'La Estrella Petrófaga',
        'Habitante de las profundidades y petrófago por excelencia. Pestar es potencialmente la criatura más peligrosa que alguna vez habitó el océano. Dado a sus constantes intersecciones a navíos o centrales petroleras, la contaminación marina iba en alarmante ascenso. Curiosamente Ultraman tuvo que lidiar más con las consecuencias de este Mounstruo que contra él mismo.',
         //Imágenes Principales
        ['assets/014_pestar_0.webp','assets/014_pestar_1.webp','assets/014_pestar_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 140, 189, 7),
        aliasOf: 'La Bestia Petrolera',
        height: '50m',
        weight: '25,000T',
        planet: 'La Tierra\n(Profundidades)',
        ultra: '@ULTRAMAN',
        comentary: '“Es asombroso pero de alguna forma esta criatura logró transformar combustibles fósiles en parte de su alimentación. Dejarlo sin represalias supondría un desastre ambiental irreparable y atacarlo con vehemencia podría suponer una reacción en cadena incontrolable. Ante estos casos es mejor ir codo a codo con la humanidad”.',
        imgDrawer: 'assets/014_pestar_2.webp'
      ),
      Enemy(
        'Gamakugira',
        'El Cetáceo Mounstruoso',
        'La figura de un cetáceo monstruoso se asomaba por las costas de Japón. Dispuesto a mermar todas las ostras de las inmediaciones para alimentarse de sus perlas, Gamakugira fue un peligro que llevo a la Patrulla Científica emplear múltiples vías de acción, entre ellas, colocar un cohete en la "retaguardia" del Kaiju. Por más ridículo que suene, es así que Ultraman logró interceptarlo en el aire haciendolo explotar en trizas... ',
         //Imágenes Principales
        ['assets/015_gamakujira_0.webp','assets/015_gamakujira_1.webp','assets/015_gamakujira_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 19, 156, 115),
        aliasOf: 'El Mounstruo de las\nMareas',
        height: '35m',
        weight: '10,000T',
        planet: 'La Tierra\n(Profundidades)',
        ultra: '@ULTRAMAN',
        comentary: '“Aquella ocasión fue extraña, incluso sentí que me volví alguien diferente... ”.',
        imgDrawer: 'assets/015_gamakujira_2.webp'
      ),
      Enemy(
        'Gavadon',
        'El Mounstruo de Ensueño',
        'Unos niños con cierto talento para el dibujo e imaginación lograron plasmar lo que sería un Kaiju de su autoría. Tras un fenómeno milagroso unos rayos cósmicos logran darle vida a esta figura. Dado a lo poco impresionante de su primera forma, los niños logran darle un diseño más complejo haciendo de Gavadon una criatura, aunque pasiva, molesta para los habitantes. Ultraman debe deshacerse de Gavadon mientra respeta la creación de estos inocentes niños.',
         //Imágenes Principales
        ['assets/016_gavadon_0.webp','assets/016_gavadon_1.webp','assets/016_gavadon_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 184, 182, 34),
        aliasOf: 'Mountruo\nBidimensional',
        height: '60m',
        weight: '40,000T',
        planet: 'La Tierra\n(Rayos Cósmicos)',
        ultra: '@ULTRAMAN',
        comentary: '“Escuchar a aquellos niños rogarme por mantener a su creación me conmovió, supongo que sentían que de alguna forma era su responsabilidad. Si bien no pude dejarlo en la Tierra por los diferentes problemas que causaría, me encargué de inmortalizar su existencia en las estrellas”.',
        imgDrawer: 'assets/016_gavadon_2.webp'
      ),
      Enemy(
        'Alien Baltan II',
        'La Reencarnación de la Venganza',
        'Tras su primer encuentro con Ultraman en la Tierra, los Baltan´s sobrevivientes consiguieron replegarse en un planeta llamado "R" donde formularon su venganza. El objetivo era separar a Ultraman de la Tierra para atacarlo por dos frentes. Primero secuestrando una nave espacial llevándola a su nuevo planeta y segundo atacando un aeropuerto con gran concurrencia. Sin embargo, Ultraman, ya mucho más experimentado como heróe terrestre logró resolverlo de forma magistral.',
         //Imágenes Principales
        ['assets/017_alien_baltan_0.webp','assets/017_alien_baltan_1.webp','assets/017_alien_baltan_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 134, 89, 6),
        aliasOf: 'Baltan Generation II',
        height: 'Microscópico ~ 50m',
        weight: '0 ~ 15,000T',
        planet: 'Planeta R',
        ultra: '@ULTRAMAN',
        comentary: '“Si bien crearon un plan exhaustivo para mantenerme alejado de la acción, no contaron con mi poderosa pero extenuante habilidad de teletransportación, aunque debo admitir que estudiaron muy bien como contrarrestar alguna de mis técnicas”.',
        imgDrawer: 'assets/017_alien_baltan_2.webp'
      ),
      Enemy(
        'Bullton',
        'Laͣ Вⷡeͤs͛ᴛⷮiͥaͣ dͩeͤ laͣ Cͨuͧaͣrͬᴛⷮaͣ Dͩiͥmͫeͤns͛iͥoͦ́n',
        '˙ɐɯɹoɟ uɐp ǝl ǝnb sɐzǝıd sɐl ɹınɹʇsǝp ʎ olɹɐʇoɹɹǝp ɐɹɐd pɐpıunʇɹodo ɐun uoɔ ɹɐʇuoɔ ɐɹɐd uóıɔɐuıƃɐɯı ǝ ɐllɐʇɐq uǝ bı ns opoʇ ɹɐsn ǝnb oʌnʇ uɐɯɐɹʇln ,uóısuǝɯıp ɐɹǝɔɹǝʇ ɐl uǝ odɯǝıʇ-oıɔɐdsǝ lǝ ɹɐuıɯop ɐɹɐd ǝʇuǝʇodıuɯo ısɐɔ ɹǝpod un uoɔ ˙uóısuǝɯıp ɐʇ4 ɐl uǝ ǝlqısod olos ɐɹnʇɐıɹɔ ɐun ɐ uɐíɹɐʇɹǝdsǝp ǝsɹɐuoısnɟ ɹɐɹƃol lɐ ˙ɐɹʇo ɐ ɐun sɐpíɐɹʇɐ uǝʇuǝıs ǝs sɐzǝıd sɐqɯɐ ɐɯɹoɟ ɐunƃlɐ ǝp ,ouɐɯnɥ oʇuǝıɯıpuǝʇuǝ lǝp állɐ sáɯ sǝpɐpǝıdoɹd ɹɐɹʇsoɯ uǝɔǝɹɐd soʇsǝ opuɐnɔ ˙sɐɔıɟíʇuǝıɔ sɐıɔuǝuıɯǝ ɹod sopɐƃıʇsǝʌuı uos sopıɔouoɔsǝp soʇuǝɯƃɐɹɟ sop',
         //Imágenes Principales
        ['assets/018_bullton_0.webp','assets/018_bullton_1.webp','assets/018_bullton_3.webp','assets/018_bullton_4.webp','assets/018_bullton_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 179, 18, 85),
        aliasOf: 'p4 ǝʇuǝ lǝ',
        height: 'ɯ06',
        weight: 'ʇ000,06',
        planet: 'ǝlqıuodsıp ou',
        ultra: '@ULTRAMAN',
        comentary: '“@#!?~”.',
        imgDrawer: 'assets/018_bullton_2.webp'
      ),
      Enemy(
        'Alien Zarab',
        'El Hermano de Otro Mundo',
        'Un amigable alienígena aparece en la ciudad de Tokio para salvar la población. ¡Patrañas! Este aterrador ser solo deseaba ganarse el favor de la humanidad. Pasando por la Patrulla científica hasta los altos mandos de Japón, su objetivo era sembrar la discordia en cuanto al rol de Ultraman como héroe, siendo el primer paso para que los humanos se destruyeran así mismos, todo por mera diversión. Para su mala suerte existen humanos que confían ciegamente en Ultraman, lo cual le permitió limpiar su nombre acabando con el impostor más peligroso de la Galaxia.',
         //Imágenes Principales
        ['assets/019_alien_zarab_0.webp','assets/019_alien_zarab_1.webp','assets/019_alien_zarab_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 119, 100, 108),
        aliasOf: 'El Alien Vicioso',
        height: '1.8 ~ 40m',
        weight: '30 ~ 20,000T',
        planet: 'Planeta Zarab',
        ultra: '@ULTRAMAN',
        comentary: '“Un enemigo imponente. Fui inferior ante él en cada uno de los aspectos posibles, su ingenio e inteligencia son insuperables. No sería posible que un héroe presuntuoso como yo lo venciera sin ayuda”.',
        imgDrawer: 'assets/019_alien_zarab_2.webp'
      ),
      Enemy(
        'Aboras & Banila',
        'El Dúo Infernal',
        'Dos figuras demoníacas eran el terror de alguna civilización anterior a la nuestra. De alguna forma logran capturarlos en cápsulas diferentes. Dado a que la advertencia para mantener selladas las cápsulas estaba en un idioma antiguo, la curiosidad de los humanos fue mucho mayor... Con ambas figuras traídas a la actualidad era solo cuestión de tiempo para que arrasaran con el país. Aunque fuera de todo pronóstico estas dos bestias se enfrentarían dando como ganador a la contraparte Azul. Es así que Ultraman debía enfrentar al Alfa de este par de Kaijus, empleando 3 Rayos Specium consecutivos.',
         //Imágenes Principales
        ['assets/020_aboras_banila_0.webp','assets/020_aboras_banila_1.webp','assets/020_aboras_banila_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 151, 37, 185),
        aliasOf: 'El Azul & El Rojo',
        height: '60m & 55m',
        weight: '20,000T & 20,000T',
        planet: 'La Tierra (Antigua)',
        ultra: '@ULTRAMAN',
        comentary: '“Este dúo de bestias ancestrales aterrorizaron a alguna antigua civilización terrestre. De haberme enfrentado a ellas como un equipo es posible que hubiese visto el abismo de la derrota. Para nuestra fortuna estas criaturas parecen ser antagónicas la una con la otra”.',
        imgDrawer: 'assets/020_aboras_banila_2.webp'
      ),
      Enemy(
        'Hidora',
        'El Avatar Dragón',
        'De origen sobrenatural, Hidora es la manifestación terrenal de la imaginación (o no) de un niño fallecido en un accidente automovílistico. Siguiendo su voluntad espiritual, este dragón pondría en peligro a múltiples vehículos en la ruta 87. Ultraman intevendría como siempre pero esta era una batalla que no se podía resolver con violencia, solo se podría mediante la justicia suficiente para que el pequeño joven descansara en paz.  ',
         //Imágenes Principales
        ['assets/021_hidora_0.webp','assets/021_hidora_1.webp','assets/021_hidora_3.webp','assets/021_hidora_4.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 148, 97, 89),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Aún para los Ultras, los temas espirituales son un verdadero misterio. La Tierra parece albergar un gran componente espiritual gracias al poder de las almas humanas Quizás sea por este tipo de cosas que hacen de este planeta un hogar irreplicable”.',
        imgDrawer: 'assets/021_hidora_2.webp'
      ),
      Enemy(
        'Kemular',
        'El Anfibio Venenoso',
        'Residente de un volcán inactivo, Kemular posee la misma categoría que Gabora en cuanto a peligrosidad ambiental. Su gas venenoso era suficiente para contaminar el aire circundante, causando inconsciencia y en un lapso más prolongado, la muerte. Siendo una bestia agresiva se necesito del ejército, la Patrulla Científica y de Ultraman para detener tal amenaza. ',
         //Imágenes Principales
        ['assets/022_kemular_0.webp','assets/022_kemular_1.webp','assets/022_kemular_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 51, 82, 103),
        aliasOf: 'Mounstruo de Gas\nVenenoso',
        height: '35m',
        weight: '10,000T',
        planet: 'La Tierra (Cráter \nKyushu)',
        ultra: '@ULTRAMAN',
        comentary: '“Para ser una criatura cuadrúpeda, es epecialmente inteligente y resistente. Su gas tóxico es temible, no me sorprende que habitara en una zona de gases volcánicos.',
        imgDrawer: 'assets/022_kemular_2.webp'
      ),
      Enemy(
        'Telesdon',
        'El Verdugo Subterráneo',
        'En la superficie terrestre la especie dominante es la humana, pero que hay debajo de nosotros? Esta criatura es aliada y defensora de los llamados habitantes subterráneos los cuales mediante un plan elaborado planeaban manipular a Ultraman para sumarlo como recurso a la hora de dominar la superficie. No obstante, Ultraman suele ser incorruptuble por lo que a la primera de cambios iría en contra de este Kaiju habitante del subsuelo.',
         //Imágenes Principales
        ['assets/023_telesdon_0.webp','assets/023_telesdon_1.webp','assets/023_telesdon_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 90, 49, 70),
        aliasOf: 'El Monstruo\nSubterráneo',
        height: '60m',
        weight: '120,000T',
        planet: 'La Tierra\n(Subsuelo)',
        ultra: '@ULTRAMAN',
        comentary: '“Aquellos seres subterráneos fueron capaces de capturar e hipnotizar a mi contraparte humana. Afortunadamente, ese tipo de estados no son trasnferibles a la hora de adquirir mi forma alienígena.”.',
        imgDrawer: 'assets/023_telesdon_2.webp'
      ),
      Enemy(
        'Jamila',
        'La Deshumanización Encarnada',
        'Originario de la Tierra, Jamila era un astronauta con grandes ambiciones en la vida. Siendo elegido para una misión espacial de alto calibre fue víctima de la negligencia en la calidad de seguridad relacionada con la misión. Presumiblemente varado en el espacio terminaría en un planeta desconocido. El antes humano dado a la ciencia se transformó entonces en una horrenda criatura llena de resentimiento y venganza.',
         //Imágenes Principales
        ['assets/024_jamila_0.webp','assets/024_jamila_1.webp','assets/024_jamila_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 85, 85, 84),
        aliasOf: 'Anterior Habitante de la\nTierra',
        height: '50m',
        weight: '10,000T',
        planet: 'La Tierra\n(Interacción Cósmica)',
        ultra: '@ULTRAMAN',
        comentary: '“Aún cuando la venganza no es el camino de un Ultra, puedo comprender el sentir de esta criatura. Usar a seres vivos como recursos para lograr hitos científicos inmediatos es despreciable. No hubo orgullo alguno en batalla... solo una desoladora tristeza”.',
        imgDrawer: 'assets/024_jamila_2.webp'
      ),
      Enemy(
        'Gubira',
        'La Criatura Subacuática Taladrante',
        'Instalaciones submarinas eran atacadas por una terrible criatura de las profundidades, siendo Gubira un Kaiju de naturaleza agresiva y territorial, se tuvieron que emplear tácticas de rescate para el personal en las instalaciones. Ultraman perseguiría a este Kaiju hasta llegar a la superficie, donde tendría que enfrentar su peligrosa arma capaz de penetrar la corteza terrestre.',
         //Imágenes Principales
        ['assets/025_gubira_0.webp','assets/025_gubira_1.webp','assets/025_gubira_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 156, 146, 89),
        aliasOf: 'Mounstruo del Mar\nProfundo',
        height: '50m',
        weight: '35,000T',
        planet: 'La Tierra\n(Profundidades)',
        ultra: '@ULTRAMAN',
        comentary: '“Me impresionó su capacidad para adaptarse a una movilidad terrestre. Mientras ostetara su cuerno, técnicas como el Ultra-Slash serían inútiles, quien diría que su arma más peligrosa terminaría siendo su punto más débil”.',
        imgDrawer: 'assets/025_gubira_2.webp'
      ),
      Enemy(
        'Red King II',
        'El Retorno del Rey',
        'La vuelta de un cometa espacial traería consigo muchas sorpresas. Cerca de los alpes japoneses múltiples Kaijus son perturbados por este astro desatándose un gran descontrol. Nuevamente como en aquella remota isla, un nuevo Red King se presentaría para alzarse como el alfa, sin embargo, en esta ocasión sería aún más peligroso. Con bombas de hidrógeno alojadas en su cuello, Ultraman debía enfrentar a un enemigo más poderoso que su rival original teniendo el mismo o quizás mucho más cuidado que contra el que tuvo con Ragon.',
         //Imágenes Principales
        ['assets/026_redking_II_0.webp','assets/026_redking_II_1.webp','assets/026_redking_II_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 129, 115, 78),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“La imaginación es vital para la supervivencia de un guerrero. Tuve que combinar mi poder de telequinesis y mi Ultra-Slash en un intento por detonar las bombas sin compremeter la Tierra”.',
        imgDrawer: 'assets/026_redking_II_2.webp'
      ),
      Enemy(
        'Gomora',
        'El Príncipe de los Monstruos',
        'El mayor hallazgo paleontológico hecho por la humanidad. Este antiguo pariente vivo de los dinosaurios sería sedado y trasladado a un museo para exponerlo. No obstante, en medio viaje, el kaiju lograría despertar y liberarse. Ultraman le plantaría cara, pero contra todo pronóstico se llevaría su primera derrota. Tras múltiples acontecimientos Gomora amenazaría los castillos de Osaka y mediante una extenuante batalla contra las fuerzas de defensa lograrían debitarlo para que así Ultraman logre su merecida revancha.',
         //Imágenes Principales
        ['assets/027_gomora_0.webp','assets/027_gomora_1.webp','assets/027_gomora_3.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 150, 69, 8),
        aliasOf: 'El Dinosaurio Ancestral',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“No puedo imaginar un Kaiju mas completo en términos de combate, tanto el uso de sus cuernos como de su cola son magistrales. De querer salir victorioso en una batalla cuerpo a cuerpo, debería usar mis ataques de lanzamiento con una precisión casi demencial”.',
        imgDrawer: 'assets/027_gomora_2.webp'
      ),
      Enemy(
        'Alien Dada',
        'El Agente #271',
        'Desde un mundo lejano un agente alienígena es enviado para secuestrar especímenes humanos. Su objetivo era encontrar alguno adecuado para someterlos a extenuantes pruebas y experimentos. Tras múltiples escenas de terror y suspenso, el Agente #271 se toparía con Ultraman el cual sería superior en combate en todo aspecto. En un intento fútil logra miniaturizar a Ultraman, pero las habilidades de este le permiten retomar su forma original y derrotarlo. ',
         //Imágenes Principales
        ['assets/028_alien_dada_0.webp','assets/028_alien_dada_1.webp','assets/028_alien_dada_3.webp', 'assets/028_alien_dada_4.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 77, 78, 67),
        aliasOf: 'El Fantasma de las Tres Caras',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Los rumores sugieren que los Dadas necesitan entidades externas de morfología similar para intentar reproducirse, desconozco la verdadera razón de sus actos, pero experimentar con seres inocentes es algo que no puedo permitir”.',
        imgDrawer: 'assets/028_alien_dada_2.webp'
      ),
      Enemy(
        'Goldon',
        '',
        'Las reservas de oro en una mina famosa comenzaban a escasear sin explicación aparente. Goldon era sin duda el responsable. Este Kaiju destruiría las inmediaciones en búsqueda de más y más alimento. La Patrulla Científica lograría contenerlo y derrotarlo por su cuenta, pero para variar existía un espécimen más oculto. Aquel sería quien enfrentaría a Ultraman en un combate de resistencia para poder así rescatar a sus compañeros capturados bajo Tierra.',
         //Imágenes Principales
        ['assets/029_goldon_0.webp','assets/029_goldon_1.webp','assets/029_goldon_3.webp','assets/029_goldon_4.webp','assets/029_goldon_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 175, 140, 82),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“El oro es un metal precioso valorado incluso por seres alienígenas, los más primitivos se encandilan por su brillo pero en realidad posee propiedades únicas que seguramente Goldon aprovechaba para adquirir nutrientes”.',
        imgDrawer: 'assets/029_goldon_2.webp'
      ),
      Enemy(
        'Woo',
        '',
        '',
         //Imágenes Principales
        ['assets/030_woo_0.webp','assets/030_woo_1.webp','assets/030_woo_3.webp','assets/030_woo_4.webp','assets/030_woo_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 25, 151, 182),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/030_woo_2.webp'
      ),
      Enemy(
        'Keronia',
        '',
        '',
         //Imágenes Principales
        ['assets/031_keronia_0.webp','assets/031_keronia_1.webp','assets/031_keronia_3.webp','assets/031_keronia_4.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 26, 139, 83),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/031_keronia_2.webp'
      ),
      Enemy(
        'Zumbolar',
        '',
        '',
         //Imágenes Principales
        ['assets/032_zumbolar_0.webp','assets/032_zumbolar_1.webp','assets/032_zumbolar_3.webp','assets/032_zumbolar_4.webp','assets/032_zumbolar_5.webp','assets/032_zumbolar_6.webp','assets/032_zumbolar_7.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 218, 108, 6),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/032_zumbolar_2.webp'
      ),
      Enemy(
        'Alien Mephilas',
        'El Lucifer Alienígena',
        'Formando parte de la élite alienígena, los Mephilas son una raza poderosa pero que curiosamente consiguen gloria mediante la dominación de mundos por medios alternativos a la violencia. Su plan era convencer a un inocente terrestre de cederle el derecho a poseer la Tierra; pero al no tener éxito entraría en tanta ira y desesperación que por un momento combatiría contra Ultraman. No obstante aún cuando la batalla entraba en un cruento empate, admitiría su aplastante derrota al no poder dominar el corazón humano.',
         //Imágenes Principales
        ['assets/033_mephilas_0.webp','assets/033_mephilas_1.webp','assets/033_mephilas_3.webp','assets/033_mephilas_4.webp','assets/033_mephilas_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 32, 95, 179),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Aún cuando posiblemente se trate de uno de los seres más inteligentes del universo, desde esa posición es imposible entender a los humanos. La mezcla de lógica y emociones humanas puede parecer precaria pero eso mismo es lo que los vuelve impredecibles ante seres de tal calibre”.',
        imgDrawer: 'assets/033_mephilas_2.webp'
      ),
      Enemy(
        'Skydon',
        '',
        '',
         //Imágenes Principales
        ['assets/034_skydon_0.webp','assets/034_skydon_1.webp','assets/034_skydon_3.webp','assets/034_skydon_4.webp','assets/034_skydon_5.webp','assets/034_skydon_6.webp','assets/034_skydon_7.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 65, 66, 59),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/034_skydon_2.webp'
      ),
      Enemy(
        'Seabozu',
        'El Heraldo del Cementerio de Mounstruos',
        'Residente del confortable cementerio de mounstruos, puede decirse que Seabozu en vida experimentó vez tras vez el odio de una civilización dominante. Ya cansado, logró encontrar paz en la muerte, hasta que una serie de experimentos espaciales lo hicieron caer y aterrizar en la Tierra. Tras vagar con tristeza al solo recibir nuevamente odio y dolor, Seabozu anhelaba volver a descansar en su bello hogar. Ultraman lidió contra estra criatura por mucho tiempo pero se percató que la solución en este caso sería diferente.',
         //Imágenes Principales
        ['assets/035_seabozu_0.webp','assets/035_seabozu_1.webp','assets/035_seabozu_3.webp','assets/035_seabozu_4.webp','assets/035_seabozu_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 29, 31, 21),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Cómo héroe soy consciente que he tomado vidas, seres maliciosos, peligrosos pero algunos inconscientes de sus actos. Me hago responsable por todo ello. En esta ocasión debía romper el ciclo, debía ayudarlo a volver. Aunque sinceramente hubiera sido más fácil de no ser tan testarudo”.',
        imgDrawer: 'assets/035_seabozu_2.webp'
      ),
      Enemy(
        'Zaragas',
        '',
        '',
         //Imágenes Principales
        ['assets/036_zaragas_0.webp','assets/036_zaragas_1.webp','assets/036_zaragas_3.webp','assets/036_zaragas_4.webp','assets/036_zaragas_5.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 187, 184, 30),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/036_zaragas_2.webp'
      ),
      Enemy(
        'Geromimon',
        'El Jefe de los Monstruos',
        'Siendo el líder de toda figura Kaiju terrestre, Geronimon es un nigromante capaz de revivir a sus semejantes caídos. Debido al enorme resentimiento que tenía por los humanos, este jefe monstruoso planearía armar un ejército de 50 Kaijus con el fin de asolar Japón. Para su desgracia, un Kaiju afín a los terrícolas lo traicionaría, dándole a los humanos la oportunidad de combatirlo. Siendo una de las batallas más difíciles e igualadas para nuestro héroe alienígena, se necesitaba del factor humano para ponerle fin de una vez por todas.',
         //Imágenes Principales
        ['assets/037_geronimon_0.webp','assets/037_geronimon_1.webp','assets/037_geronimon_3.webp','assets/037_geronimon_4.webp','assets/037_geronimon_5.webp','assets/037_geronimon_6.webp','assets/037_geronimon_7.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 129, 34, 167),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“No es común encontrar bestias Kaiju conscientes. Esta es la muestra clara que estos majestuosos seres pueden evolucionar, aún así, hay que diferenciar a los Kaijus maliciosos de los de buen corazón... ustedes ya saben de quién hablo”.',
        imgDrawer: 'assets/037_geronimon_2.webp'
      ),
      Enemy(
        'Kira',
        '',
        '',
         //Imágenes Principales
        ['assets/038_kira_0.webp','assets/038_kira_1.webp','assets/038_kira_3.webp','assets/038_kira_4.webp','assets/038_kira_5.webp','assets/038_kira_6.webp','assets/038_kira_7.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 138, 108, 12),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“”.',
        imgDrawer: 'assets/038_kira_2.webp'
      ),
      Enemy(
        'Alien Zetton',
        '',
        'Considerados grandes estrategas militares, estos alienígenas fueron la primera amenaza a gran escala que enfrentaría la humanidad. Estudiando a los humanos presumiblemente desde los años 30´s los Zetton planearían conquistar la Tierra. Aún con la variable de Ultraman tomada en cuenta, los Zetton no solo no se rindieron sino que simplemente desarrollarían un arma capaz de derrotar al Paladín de la Justicia.',
         //Imágenes Principales
        ['assets/040_alien_zetton_0.webp','assets/040_alien_zetton_1.webp','assets/040_alien_zetton_3.webp','assets/040_alien_zetton_4.webp','assets/040_alien_zetton_5.webp','assets/040_alien_zetton_6.webp','assets/040_alien_zetton_7.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 24, 56, 146),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Los Zetton son reconocidos por sus estrategias enrevesadas y engañosas, no por nada tienen una elevada habilidad de infiltración, su capacidad de estudio e investigación en cuanto a sus objetivos es loable”.',
        imgDrawer: 'assets/040_alien_zetton_2.webp'
      ),
      Enemy(
        'Zetton',
        '',
        'El Arma definitiva de los Aliens Zetton. Esta criatura posee un poder físico equiparable al de RedKing, las capacidades de desorientación de los Baltan, la forma insectoide de Keylla, un caparazón similar al de Kemular lo que le proporciona una densidad impresionante. Capaz de emplear técnicas y habilidades que contrarrestan hasta el más mínimo movimiento de Ultraman, era obvio que sus amos lo diseñaron con un solo objetivo... ser el verdugo de nuestro héroe Ultraman.',
         //Imágenes Principales
        ['assets/041_zetton_0.webp','assets/041_zetton_1.webp','assets/041_zetton_3.webp','assets/041_zetton_4.webp','assets/041_zetton_5.webp','assets/041_zetton_6.webp','assets/041_zetton_7.webp','assets/041_zetton_8.webp'],
        //Habilidades del Kaiju
        {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
        color: Color.fromARGB(255, 179, 162, 13),
        aliasOf: '',
        height: '',
        weight: '',
        planet: '',
        ultra: '@ULTRAMAN',
        comentary: '“Esta es una derrota que aún llevo al corazón. Recreé este combate cientos de veces en mi mente y aún en mis máximas capacidades del momento solo puedo divisar un empate. Si los humanos no se hubieran hecho cargo con su tecnología experimental probablemente la historia sería diferente... o no? Zoffy?”.',
        imgDrawer: 'assets/041_zetton_2.webp'
      ),
      // Enemy(
      //   '',
      //   '',
      //   '',
      //    //Imágenes Principales
      //   ['assets/010_kaiju_0.webp','assets/010_kaiju_1.webp','assets/010_kaiju_3.webp'],
      //   //Habilidades del Kaiju
      //   {'':'assets/kaiju_habs.webp', '-': 'assets/kaiju_habs_1.webp'},
      //   color: Color.fromARGB(255, 161, 184, 34),
      //   aliasOf: '',
      //   height: '',
      //   weight: '',
      //   planet: '',
      //   ultra: '@ULTRAMAN',
      //   comentary: '“”.',
      //   imgDrawer: 'assets/010_kaiju_2.webp'
      // ),
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