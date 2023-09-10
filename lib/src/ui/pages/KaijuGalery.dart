import 'package:flutter/material.dart';
import 'package:test/src/core/constants/enemy.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/pages/KaijuDetails.dart';

//Widget - Galería de Kaijus
class KaijuGaleryPage extends StatefulWidget {
  // Definición de variables.
  final String ultraName;
  const KaijuGaleryPage({required this.ultraName});

  @override
  _KaijuGaleryPageState createState() => _KaijuGaleryPageState();
}

class _KaijuGaleryPageState extends State<KaijuGaleryPage> {
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
          .where((enemy) => enemy.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registros Kaiju"),
        backgroundColor: Constants.ultraRed,
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
                              KaijuDetailsPage(enemy: filterKaijuNames[index]),
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
                                    color: Constants.ultraBlack,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                  )
                                ],
                                color: Constants.ultraWhite,
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