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


//Widget Home - Dinámico
class HomeApp extends StatefulWidget{
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp>{
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UltraBrother M78"),
        backgroundColor: ultraRed,
        shadowColor: Color.fromARGB(255, 100, 99, 100),
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: [
          UltraWidget(name: "@ULTRAMAN", img: "assets/ultraman.jpg"),
          UltraWidget(name: "@ULTRAMAN TIGA", img: "assets/ultraseven.jpg")
        ],
      ),
    );
  }
}


//Widget para Cada Ultra
class UltraWidget extends StatelessWidget {
  //Variables
  final String name;
  final String img;
  //Constructor
  UltraWidget({required this.name, required this.img});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          //Imagen
          Image.asset(
            img,
            width: 300,
            height: 500,
          ),
          //Separacionn
          Expanded(child: Container()),
          //Botón
          ElevatedButton(
            //Acción del Botón
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaijuGaleryWidget(ultraName: name,))
              );
            },
            child: Text("◀ Registros Kaiju ▶"),
            //Estilo del Botón
            style: ElevatedButton.styleFrom(
              backgroundColor: ultraRed,
            ),
          ),
          //Separación
          Expanded(child: Container()),
          //Texto
          Text(name),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Inicia la animación al cargar la página
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal de la página (puedes cambiar esto por tus propios widgets)
          // Widget que realiza la animación inicial
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              double offsetX = 100 * (1 - _animationController.value); // Ajusta la distancia de la animación
              return Positioned(
                right: offsetX,
                top: 0,
                bottom: 0,
                child: child!,
              );
            },
            child: Container(
              width: 100,
              color: Colors.transparent,
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Widget Dinámico Galería de Enemigos
class KaijuGaleryWidget extends StatefulWidget{
  
  //Definiendo Variables. 
  final String ultraName;
  const KaijuGaleryWidget({required this.ultraName});
  
  @override
  _KaijuGaleryWidgetState createState() => _KaijuGaleryWidgetState();
}

class _KaijuGaleryWidgetState extends State<KaijuGaleryWidget>{
  
  //Nombre del Ultra
  late String ultraName;
  
  //Cadena usada para la búsqueda. 
  String searchKaiju = "";

  //Lista de Todo los Enemigos Asociados a un Ultra
  List<Enemy> selectedUltraEnemies = [];
  
  //Lista de los Enemigos que concuerden con el Filtrado
  List<Enemy> filterKaijuNames = [];
  
  @override
  void initState(){
    super.initState();
    ultraName = widget.ultraName;
    selectedUltraEnemies = ultraEnemies[ultraName.toUpperCase()] ?? [];
    filterKaijuNames = selectedUltraEnemies;
  }

  void _filterContainers(String query){
    setState(() {      
      searchKaiju = query;
      selectedUltraEnemies = ultraEnemies[widget.ultraName.toUpperCase()] ?? [];
      filterKaijuNames = selectedUltraEnemies.where((enemy) => enemy.name.toLowerCase().startsWith(query.toLowerCase())).toList();  
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
              ),
              itemCount: filterKaijuNames.length,
              itemBuilder: (context, index){
                return Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KaijuDetailsWidget(enemy: filterKaijuNames[index]))
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(9.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: filterKaijuNames[index].color,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.asset(
                                filterKaijuNames[index].img[0]
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              filterKaijuNames[index].name,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                  color: Color.fromARGB(255, 41, 40, 40),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  )
                                ],
                                color: ultraWhite,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                    )
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

class KaijuDetailsWidget extends StatelessWidget{
  
  final Enemy enemy;
  KaijuDetailsWidget({required this.enemy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          enemy.name,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: enemy.color,
        flexibleSpace:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children :[
            // Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(height: 20,),
                Expanded(child: Container()),
                //Alejarse de los Bordes
                Padding(
                  padding: EdgeInsets.only(
                    top: 25.0,   // Padding en la parte superior
                    right: 20.0, // Padding en la parte derecha
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    ),
                    height: 42,
                    child:
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(ultraData[enemy.ultra]![1]),
                      ) 
                      
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
      drawer: KaijuDrawer(enemy: enemy,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 247,
                width: 400,
                child: ImageChanger(enemy: enemy,),
              ),
            ),
            Expanded(child: Container()),
            Text(
              'Alias: ${enemy.subtitle}',
              style: const TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1
                )
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                enemy.description,
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.grey[700]
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(child: Container()),
            Details(enemy: enemy)
          ]
        ),
      ),
    );
  }
}

//Barra Lateral
class KaijuDrawer extends StatelessWidget {
  
  final Enemy enemy;

  KaijuDrawer({required this.enemy});
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: enemy.color,
              image: DecorationImage(
                image: AssetImage(enemy.img[0]),
                fit: BoxFit.cover
              ),
            ),
            child: 
              Text(
                enemy.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                  textAlign: TextAlign.start,
              ),
          ),
          ListTile(
            title: TitleDetails(color: enemy.color, text: 'Alias Oficial: ${enemy.aliasOf}',),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TitleDetails(color: Colors.orange, text: 'Altura: ${enemy.height}',),
            onTap: () {
              //Script
              print("prueba");
            },
          ),
          ListTile(
            title: TitleDetails(color: Colors.green, text: 'Peso: ${enemy.weight}',),
            onTap: () {
              //Script
              print("prueba");
            },
          ),
          ListTile(
            title: TitleDetails(color: Colors.lightBlueAccent, text: 'Planeta de Origen: ${enemy.planet}',),
            onTap: () {
              //Script
              print("prueba");
            },
          ),
          ListTile(
            title: TitleDetails(color: Colors.red,text: 'Habilidades',),
            onTap: () {
              //Script
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuHabilitiesWidget(enemy: enemy))
              );
            },
          ),
          ListTile(
            title: TitleDetails(color: Colors.purple, text: 'Debilidades',),
            onTap: () {
              //Script
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuWeaknessWidget(enemy: enemy))
              );
            },
          ),
          ListTile(
            title: TitleDetails(color: const Color.fromARGB(255, 252, 227, 2), text: 'Curiosidades',),
            onTap: () {
              //Script
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => KaijuCuriosityWidget(enemy: enemy))
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 35,
                ), 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ultraRed,
                  ),
                  onPressed: (){
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
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    enemy.comentary,
                                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic ,color: ultraWhite),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
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
                  child: Text("Comentario")
                )
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30
                ),
                child: Container(
                  width: 127,
                  child: Image.asset(
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

//Detalles de los Enemigos
class Details extends StatelessWidget {
  final Enemy enemy;

  Details({required this.enemy});
  
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
  void initState(){
    super.initState();
    enemy = widget.enemy;
    kaijuImages = enemy.img;
  }

  void changeImageNext() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % kaijuImages.length;
    });
  }

  void changeImagePrevious() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % kaijuImages.length;
    });
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
        
        WidgetButtonsChangeImage(functionBack: changeImagePrevious, functionNext: changeImageNext,enemy: enemy,)
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


class TitleDetails extends StatelessWidget{
  final Color color;
  final String text;
  TitleDetails({required this.color, this.text = ''});
  
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KaijuPostWidget(username: "prueba", imageUrl: '', postText: "Rayo Cósmico", timeAgo: "2h",),
        ]
      )
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
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Container(
        height: 428,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  '',
                ),
              ),
              title: Text(username),
              subtitle: Text(timeAgo),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(postText),
            ),
            Image.asset('assets/bemular.webp'),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}