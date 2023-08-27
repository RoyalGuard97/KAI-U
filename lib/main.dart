import 'package:flutter/material.dart';
import 'enemy.dart';

//Constantes de Color
const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
const Color ultraRed = Color(0xFFEF3340);
const Color ultraWhite = Color.fromARGB(255, 243, 238, 238);

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
          UltraWidget(name: "@ULTRAMAN TIGA", img: "assets/ultraman_tiga.webp")
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
          //Imagen
          Image.asset(
            img,
            width: 300,
            height: 500,
          ),
          //Separacionn
          const SizedBox(height: 20),
          //Botón
          ElevatedButton(
            //Acción del Botón
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaijuGaleryWidget(ultraName: name,))
              );
            },
            child: Text("Registros Kaiju"),
            //Estilo del Botón
            style: ElevatedButton.styleFrom(
              backgroundColor: ultraRed
            ),
          ),
          //Separación
          const SizedBox(height: 10,),
          //Texto
          Text(name)
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
      ),
      drawer: Drawer(),
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
              enemy.subtitle,
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
