import 'package:flutter/material.dart';
import 'enemy.dart';

//Constantes de Color
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
const Color ultraRed = Color(0xFFEF3340);
const Color ultraWhite = Color.fromARGB(255, 238, 232, 232);

//Función Main
void main() {
  runApp(MyApp());
}

//Widget Principal
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: ultraWhite
      ),
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}


//El Home de la App - Dinámico
class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  PageController _pageController = PageController(); // Controlador para el PageView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UltraBrother M78"), // Título de la AppBar
        backgroundColor: ultraRed, // Color de fondo de la AppBar
        shadowColor: Color.fromARGB(255, 100, 99, 100), // Color de sombra de la AppBar
      ),
      body: PageView(
        controller: _pageController, // Asigna el controlador al PageView
        scrollDirection: Axis.vertical, // Dirección de desplazamiento vertical
        children: [
          UltraWidget(name: "@ULTRAMAN", img: "assets/ultraman.jpg"), // Primer widget de Ultra
          UltraWidget(name: "@ULTRAMAN TIGA", img: "assets/ultraseven.jpg") // Segundo widget de Ultra
        ],
      ),
    );
  }
}


//Widget - Para ingresar a los registros de cada Ultra. 
class UltraWidget extends StatelessWidget {
  // Variables para almacenar el nombre y la imagen del Ultra
  final String name;
  final String img;
  
  // Constructor para inicializar las variables
  UltraWidget({required this.name, required this.img});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()), // Espacio flexible arriba
          Image.asset(
            img,
            width: 300,
            height: 500,
          ), // Imagen del Ultra
          Expanded(child: Container()), // Espacio flexible en el medio
          ElevatedButton(
            onPressed: (){
              // Navegar a la galería de Kaijus
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaijuGaleryWidget(ultraName: name,))
              );
            },
            child: Text("▼ Registros Kaiju ▲"), // Texto del botón
            style: ElevatedButton.styleFrom(
              backgroundColor: ultraRed, // Color de fondo del botón
            ),
          ), // Botón
          Expanded(child: Container()), // Espacio flexible en el medio
          Text(name), // Nombre del Ultra
          SizedBox(height: 30,) // Espacio vertical abajo
        ],
      ),
    );
  }
}

//Widget - Galería de Kaijus
class KaijuGaleryWidget extends StatefulWidget {
  // Definición de variables.
  final String ultraName;
  const KaijuGaleryWidget({required this.ultraName});

  @override
  _KaijuGaleryWidgetState createState() => _KaijuGaleryWidgetState();
}

class _KaijuGaleryWidgetState extends State<KaijuGaleryWidget> {
  // Variable para el nombre del ultra.
  late String ultraName;

  // Cadena usada para la búsqueda.
  String searchKaiju = "";

  // Lista de todos los enemigos asociados a un ultra.
  List<Enemy> selectedUltraEnemies = [];

  // Lista de enemigos que concuerden con el filtro.
  List<Enemy> filterKaijuNames = [];

  @override
  void initState() {
    super.initState();
    // Inicialización del nombre del ultra y las listas de enemigos.
    ultraName = widget.ultraName;
    selectedUltraEnemies = ultraEnemies[ultraName.toUpperCase()] ?? [];
    filterKaijuNames = selectedUltraEnemies;
  }

  void _filterContainers(String query) {
    setState(() {
      // Actualización del filtro y las listas.
      searchKaiju = query;
      selectedUltraEnemies = ultraEnemies[widget.ultraName.toUpperCase()] ?? [];
      filterKaijuNames = selectedUltraEnemies
          .where((enemy) => enemy.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registros Kaiju"),
        backgroundColor: ultraRed,
      ),
      body: Column(
        children: [
          // Cuadro de búsqueda.
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterContainers,
              decoration: InputDecoration(
                labelText: "Buscar Kaiju",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Conjunto de Elementos Filas & Columnas
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
              ),
              itemCount: filterKaijuNames.length,
              itemBuilder: (context, index) {
                return Center(
                  child: InkWell(
                    onTap: () {
                      // Navegación a la pantalla de detalles del Kaiju.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KaijuDetailsWidget(enemy: filterKaijuNames[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Container(
                        // Contenedor para mostrar el Kaiju (Imagen & Detalles).
                        decoration: BoxDecoration(
                          color: filterKaijuNames[index].color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            // Imagen del Kaiju.
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10), //Editar borde de imagen superior izquierdo
                                topRight: Radius.circular(10), //Editar borde de imagen superior derecho
                              ),
                              child: Image.asset(
                                //El Primer Elemento debe ser la Imagen Original 
                                filterKaijuNames[index].img[0],
                              ),
                            ),
                            Expanded(child: Container()),
                            // Nombre del Kaiju.
                            Text(
                              filterKaijuNames[index].name,
                              style: TextStyle(
                                // Sombra para el texto - Se debe Resaltar.
                                shadows: [
                                  Shadow(
                                    color: Color.fromARGB(255, 41, 40, 40),
                                    offset: Offset(1, 1),
                                    blurRadius: 10,
                                  )
                                ],
                                color: ultraWhite,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            //Espaciado
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class KaijuDetailsWidget extends StatelessWidget {
  
  // Variable para almacenar el enemigo actual.
  final Enemy enemy;
  KaijuDetailsWidget({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          enemy.name, //Nombre del Enemigo
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: enemy.color,
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: Container()),
                // Icono del Ultra en el AppBar
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,   // Espacio en la parte superior
                    right: 20.0, // Espacio en la parte derecha
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 42,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(ultraData[enemy.ultra]![1]),
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
      // Menú deslizante (drawer)
      drawer: KaijuDrawer(enemy: enemy),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen del Kaiju con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 247,
                width: 400,
                //Usamos este Widget para Elegir las Imágenes a Mostrar.
                child: ImageChanger(enemy: enemy),
              ),
            ),
            Expanded(child: Container()),
            
            // Alias del Kaiju & Subtítulo
            Text(
              'Alias: ${enemy.subtitle}',
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            
            // Descripción Específica del Kaiju
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                enemy.description,
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            
            //Espaciado Estratégico
            Expanded(child: Container()),
            // Detalles adicionales del enemigo
            MoreDetailsWidget(enemy: enemy),
          ],
        ),
      ),
    );
  }
}


//Widget de Barra Lateral para cada Kaiju
class KaijuDrawer extends StatelessWidget {
  
  // Variable para almacenar el enemigo actual.
  final Enemy enemy;

  // Constructor que recibe el enemigo.
  KaijuDrawer({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          // Encabezado del Drawer con la imagen y el nombre del enemigo.
          DrawerHeader(
            decoration: BoxDecoration(
              color: enemy.color,
              image: DecorationImage(
                //La Imagen del Drawer debe ser con el enemigo alineado a la derecha 
                image: AssetImage(enemy.imgDrawer),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              //Contenedor Padre
              child: Container( 
                decoration: BoxDecoration(
                  color: enemy.color.withOpacity(0.75),
                  //Bordes Redondeados del Contenedor. 
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.5),
                  //Texto Hijo con el Nombre del Kaiju
                  child: Text(
                    enemy.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.start,
                  ), // Coloca aquí el widget hijo
                )
              ),
            ),
          ),
          
          // Opciones Desplegadas en el Drawer.
          ListTile(
            // Título del alias oficial del enemigo.
            title: TitleDetailsDrawer(color: enemy.color, text: 'Alias Oficial: ${enemy.aliasOf}',),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          
          // Título de la altura del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: Colors.orange, text: 'Altura: ${enemy.height}',),
            onTap: () {
              // Acción al tocar la opción.
              print("prueba");
            },
          ),
         
          // Título del peso del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: Colors.green, text: 'Peso: ${enemy.weight}',),
            onTap: () {
              // Acción al tocar la opción.
              print("prueba");
            },
          ),
          
          // Título del planeta de origen del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: Colors.lightBlueAccent, text: 'Planeta de Origen: ${enemy.planet}',),
            onTap: () {
              // Acción al tocar la opción.
              print("prueba");
            },
          ),
          
          // Título de las habilidades del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: Colors.red, text: 'Habilidades',),
            onTap: () {
              // Acción al tocar la opción para mostrar las habilidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuHabilitiesWidget(enemy: enemy))
              );
            },
          ),
          
          // Título de las debilidades del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: Colors.purple, text: 'Debilidades',),
            onTap: () {
              // Acción al tocar la opción para mostrar las debilidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuWeaknessWidget(enemy: enemy))
              );
            },
          ),
          
          // Título de las curiosidades del enemigo.
          ListTile(
            title: TitleDetailsDrawer(color: const Color.fromARGB(255, 252, 227, 2), text: 'Curiosidades',),
            onTap: () {
              // Acción al tocar la opción para mostrar las curiosidades.
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuCuriosityWidget(enemy: enemy))
              );
            },
          ),
          
          // Fila con botón de comentario y logo del Ultra.
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Botón para mostrar el comentario.
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ), 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ultraRed,
                  ),
                  onPressed: (){
                    // Script Accionado por el Botón: Mostrar una ventana emergente con el comentario.
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Color(0xFF737373), // Color de fondo oscuro
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(87, 0, 0, 0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // Texto del comentario.
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    enemy.comentary,
                                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic ,color: ultraWhite),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                // Botón para cerrar la ventana emergente.
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cerrar', style: TextStyle(fontSize: 17),),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }, 
                  //Identificador del Botón
                  child: Text("Comentario")
                )
              ),
              
              // Imagen del Ultra con transparencias. .
              Padding(
                padding: EdgeInsets.only(
                  left: 30
                ),
                child: Container(
                  width: 127,
                  child: Image.asset(
                    //Se actualiza en Ultra Data y se ingresa mediante una llave. 
                    ultraData[enemy.ultra]![0]
                  ),
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}


//Botón (+ Detalles) → Simplemente abre del Drawer
class MoreDetailsWidget extends StatelessWidget {
  final Enemy enemy;

  MoreDetailsWidget({required this.enemy});
  
  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      customBorder: CircleBorder(),
      child: Container(
        width: 55,
        height: 55,
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(kaijuImages[currentImageIndex]),
        ),
        // Widget que contiene los botones para cambiar la imagen.
        WidgetButtonsChangeImage(
          functionBack: changeImagePrevious,
          functionNext: changeImageNext,
          enemy: enemy,
        ),
      ],
    );
  }
}


class WidgetButtonsChangeImage extends StatelessWidget{
  
  final Enemy enemy;
  final VoidCallback functionBack; // Declaración de la función
  final VoidCallback functionNext; // Declaración de la función

  WidgetButtonsChangeImage({required this.functionBack, required this.functionNext, required this.enemy});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: enemy.color,
            child: InkWell(
              onTap: functionBack,
              child: SizedBox(
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
            color: enemy.color,
            child: InkWell(
              onTap: functionNext,
              child: SizedBox(
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
    );
  }
}


// Son los Títulos para las Opciones del Drawer
class TitleDetailsDrawer extends StatelessWidget{
  final Color color;
  final String text;
  TitleDetailsDrawer({required this.color, this.text = ''});
  
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
        Text(
          text,
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 121, 120, 120),
          ),
        ),
      ],
    );
  }
}

class KaijuHabilitiesWidget extends StatelessWidget{
  
  final Enemy enemy;
  KaijuHabilitiesWidget({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habilidades"),
        backgroundColor: enemy.color,
      ),
      body:  GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: enemy.kaijuHabs.length,
            itemBuilder: (context, index){
              return KaijuPostWidget(
                username: enemy.ultra, 
                timeAgo: '2h', 
                postText:(enemy.kaijuHabs.keys).toList()[index], 
                imageUrl: (enemy.kaijuHabs.values).toList()[index]);
            },
          ),
    );
  }
}

class KaijuWeaknessWidget extends StatelessWidget{
  
  final Enemy enemy;
  KaijuWeaknessWidget({required this.enemy});
  
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
          color: ultraRed,
        ),
      )
    );
  }
}

class KaijuCuriosityWidget extends StatelessWidget{
  
  final Enemy enemy;
  KaijuCuriosityWidget({required this.enemy});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curiosidades"),
        backgroundColor: enemy.color,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 400,
          color: ultraRed,
        ),
      )
    );
  }
}

class KaijuPostWidget extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String postText;
  final String imageUrl;

  KaijuPostWidget({
    required this.username,
    required this.timeAgo,
    required this.postText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 245, 243, 243),
      elevation: 6,
      margin: EdgeInsets.all(8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/ultramananthology/images/9/91/Ultraman.png/revision/latest?cb=20220206161739',
                ),
              ),
              title: Text(username),
              subtitle: Text(timeAgo),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: 10
              ),
              child: Text(
                postText,
                style: TextStyle(
                  fontSize: 16.5,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
            Expanded(
              child: Image.asset(imageUrl,)
            )
            // ButtonBar(
            //   alignment: MainAxisAlignment.start,
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.thumb_up),
            //       onPressed: () {},
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.comment),
            //       onPressed: () {},
            //     ),
            //     IconButton(
            //       icon: Icon(Icons.share),
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
          ],
        ),
      )
    );
  }
}