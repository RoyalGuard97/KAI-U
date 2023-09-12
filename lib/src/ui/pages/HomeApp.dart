import 'package:flutter/material.dart';
import 'package:test/src/core/constants/data.dart';
import 'package:test/src/ui/pages/KaijuGalery.dart';

//Información de los Ultras
class UltraInfo {
  final String name;
  final String img;

  UltraInfo({required this.name, required this.img});
}

//Lista de Cartas Disponibles
final List<UltraInfo> cards = [
    UltraInfo(
      name: "@ULTRAMAN",
      img: "assets/ultraman.jpg",
    ),
    UltraInfo(
      name: "@ULTRASEVEN",
      img: "assets/ultraseven.jpg",
    ),
    UltraInfo(
      name: "@ULTRAMAN JACK",
      img: "assets/ultraman_jack.webp",
    ),
];

//Págína Home
class HomeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("@UltraBrother M78"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: CardSelector(cards: cards),
        ),
      );
  }
}

//Widget Dinámico Selector de Cartas
class CardSelector extends StatefulWidget {
  //Obtenemos todas las Cartas Disponibles
  final List<UltraInfo> cards;

  CardSelector({required this.cards});

  @override
  _CardSelectorState createState() => _CardSelectorState();
}

//Estado Particular del Selector de Cartas
class _CardSelectorState extends State<CardSelector> {
  //Controlador de Selector de Páginas
  PageController _pageController = PageController(
    //Permite ver un trozo de las cartas disponibles
    viewportFraction: 0.82,
  );

  //Variables que Obtendrán el Número de Página Actual
  int _currentPageFake = 0;
  int _currentPageReal = 0;

  
  @override
  Widget build(BuildContext context) {
    //Variables Responsive
    var statusHeight = MediaQuery.of(context).viewPadding.top;
    var size = MediaQuery.of(context).size;
    
    var screenHeight = size.height - (statusHeight);
    var screenWidth = size.width;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Container(
          height: screenHeight/1.5,
          width: screenWidth,
          //Construir los ítems a mostrar
          child: PageView.builder(
            //Controlador
            controller: _pageController,
            //Recuento Máximo de items
            itemCount: widget.cards.length,
            
            
            // Cuando una Página Cambie se realiza lo siguiente: 
            onPageChanged: (int page) {
              setState(() {
                //Se actualiza el Recuento de Página Actual
                _currentPageReal = page;
                
                if (page == widget.cards.length - 1) {
                  //Se actualiza el Recuento de Página Falsa
                  _currentPageFake = 2;
                } else if (page > 0) {
                  _currentPageFake = 1;
                } else {
                  _currentPageFake = page;
                }
              });
            },
            //Construimos el Ítem a Mostrar
            itemBuilder: (context, index) {
              final isSelected = index == _currentPageReal;
              return CardWidget(card: widget.cards[index], isSelected: isSelected);
            },
          ),
        ),
        
        //Conjunto de 3 Círculos que acompañan el selector
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++) // Creamos 3 bolitas
              Container(
                margin: EdgeInsets.all(2),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPageFake == i ? Colors.blue : Colors.grey,
                ),
              ),
          ],
        ),
        Expanded(child: Container()),
        //Botón Elevado
        ElevatedButton(
            onPressed: (){
              // Navegar a la galería de Kaijus
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaijuGaleryPage(ultraName: widget.cards[_currentPageReal].name,))
              );
            },
            child: Text("◀ Registros Kaiju ▶"), // Texto del botón
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.ultraRed,
              elevation: 7.0 // Color de fondo del botón
            ),
          ),
        Expanded(child: Container()),
        //Texto con el Nombre del Ultra
        Text(
          "${widget.cards[_currentPageReal].name}",
        ),
        Expanded(child: Container()),
      ],
    );
  }
}


//Widget de Carta Individual
class CardWidget extends StatelessWidget {
  final UltraInfo card;
  final bool isSelected;

  CardWidget({required this.card, required this.isSelected});

  @override
  Widget build(BuildContext context) {

    
    return Container(

      // elevation: 5,
      // margin: EdgeInsets.all(10),
      child: isSelected ? 
      Padding (padding: EdgeInsets.all(10.0),child: Image.asset(card.img))
      : Stack(
        alignment: Alignment.center, 
        children:[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(card.img),
                colorFilter: 
                  ColorFilter.mode(Color.fromARGB(101, 32, 32, 32), BlendMode.darken),
                //   fit: BoxFit.cover,
                )
              ),
            )
          ],
        ) 
      );
  }
}
