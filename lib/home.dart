import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/busqueda.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/detalles.dart';
import 'package:proyecto_hoteles/perfil.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> dataUser;
  final List<Map<String, dynamic>> hotelRows;

  const Home({required this.dataUser, required this.hotelRows, Key? key})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.1,
                color: cons.blanco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        'Nombre_APP',
                        style: TextStyle(
                            color: cons.gris,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image(
                      image: AssetImage('imagenes/logo.png'),
                      height: 60,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.1,
                color: cons.colorSecundario,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _onItemTapped(0),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedIndex == 0
                              ? cons.colorPrincipal
                              : cons.blanco,
                        ),
                        child: Text(
                          'Habitación Sencilla',
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? cons.blanco
                                : cons.gris,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _onItemTapped(1),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedIndex == 1
                              ? cons.colorPrincipal
                              : cons.blanco,
                        ),
                        child: Text(
                          'Habitación Doble',
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? cons.blanco
                                : cons.gris,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _selectedIndex == 0
                  ? Container(
                height: size.height * 0.7,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.hotelRows.length,
                    itemBuilder: (context, index) {
                      final hotel = widget.hotelRows[index];
                      if (hotel['availavilityS'] > 0) {
                        return Card(
                          child: ListTile(
                            title: Text("Habitación Sencilla"),
                            subtitle: Text(
                                "Disponibilidad: ${hotel['availavilityS']}"),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detalles(dataHotel: hotel)));
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              )
                  : Container(
                height: size.height * 0.7,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.hotelRows.length,
                    itemBuilder: (context, index) {
                      final hotel = widget.hotelRows[index];
                      if (hotel['availavilityD'] > 0) {
                        return Card(
                          child: ListTile(
                            title: Text("Habitación Doble"),
                            subtitle: Text(
                                "Disponibilidad: ${hotel['availavilityD']}"),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detalles(dataHotel: hotel)));
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                color: cons.colorSecundario,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.home),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Busqueda()));
                          },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Perfil(
                                  dataUser: widget.dataUser,
                                  hotelRows: widget.hotelRows,
                                )));
                          },
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
