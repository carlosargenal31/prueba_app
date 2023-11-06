import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _StackHomeState();
}

class _StackHomeState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color backgroundColor = Colors.white; // Color de fondo inicial
  String directionText = ''; // Texto para indicar la dirección

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Fondo blanco del AppBar
          iconTheme:
              const IconThemeData(color: Colors.black), // Iconos en negro
          title: const Center(
            child: Text(
              "1499 Galenia Road",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          leading: const Icon(Icons.close,
              size: 36), // Icono a la izquierda de la 'x'
          actions: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                // Lógica cuando se presiona el botón de arriba
              },
              iconSize: 40, // Tamaño del icono
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                // Lógica cuando se presiona el botón de abajo
              },
              iconSize: 40, // Tamaño del icono
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://bethknowsrealestate.com/wp-content/uploads/2018/04/comm8-l.jpg'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$599,000',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.ios_share,
                                color: Colors.black),
                            onPressed: () {
                              // Lógica para compartir
                            },
                            iconSize: 24, // Tamaño del icono
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border,
                                color: Colors.black),
                            onPressed: () {
                              // Lógica para agregar a favoritos
                            },
                            iconSize: 24, // Tamaño del icono
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    '1499 Galenia Rd, Austin, TX',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
                  Row(
                    children: [
                      _buildCell('4', 'Beds', 80, 40, 16),
                      _buildCell('3+', 'Baths', 80, 40, 16),
                      _buildCell('4,203', 'Sq.ft', 100, 40, 16),
                      _buildCell('8,843', 'Lot Sq. ft', 100, 40, 16),
                    ],
                  ),
                  Container(
                    height:
                        8, // Espacio en gris entre las celdas y el contenedor superior
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey, size: 24),
                        SizedBox(width: 8.0),
                        Text('View Map',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(Icons.directions_car,
                            color: Colors.grey, size: 24),
                        SizedBox(width: 8.0),
                        Text('10 minutes away',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Open Houses',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        _buildOpenHousesList(),
                      ],
                    ),
                  ),
                  // Borde entre "View Map" y "Open Houses"
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink.shade700,
          child: Container(
            height: 50,
            child: const Center(
              child: Text(
                "Contact Agent",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(String value, String label, double width, double height,
      double fontSize) {
    return Container(
      width: width, // Ancho de la celda
      height: height, // Alto de la celda
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300), // Borde gris
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea a la izquierda
        children: [
          Align(
            alignment: Alignment.center, // Centra el texto
            child: Text(value,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Align(
            alignment: Alignment.center, // Centra el texto
            child: Text(label, style: TextStyle(fontSize: fontSize)),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenHousesList() {
    final openHouses = [
      "Friday 1:00 pm - 4:00 pm",
      "Saturday 1:00 pm - 4:00 pm",
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemCount: openHouses.length,
      itemBuilder: (BuildContext context, int index) {
        final openHouse = openHouses[index];

        String customText = index == 0
            ? "2/24"
            : "2/25"; // Cambia 2/24 a 2/25 en el segundo ListTile

        return ListTile(
          title: Row(
            children: [
              Text(
                openHouse,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                customText,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700),
              ),
              const Icon(
                  Icons.arrow_forward_ios), // Flecha a la derecha del texto
            ],
          ),
          onTap: () {
            // Puedes agregar acciones al hacer clic en un elemento si es necesario.
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }
}
