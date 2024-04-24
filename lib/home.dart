import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/busqueda.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/perfil.dart';

class Home extends StatefulWidget {
  final Map<String, dynamic> dataUser;
  const Home({required this.dataUser, Key? key}) : super(key: key);

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
                        onPressed: () => _onItemTapped(0), // Botón 1
                        child: Text('Botón 1'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _onItemTapped(1), // Botón 2
                        child: Text('Botón 2'),
                      ),
                    ),
                  ],
                ),
              ),
              _selectedIndex == 0
                  ? Container(
                      color: Colors.red,
                      height: size.height * 0.7,
                      child: Center(
                        child: Text('Hoteles del botón 1'),
                      ),
                    )
                  : Container(
                      color: Colors.blue,
                      height: size.height * 0.7,
                      child: Center(
                        child: Text('Hoteles del botón 2'),
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
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Busqueda()));
                        },
                        icon: Icon(Icons.search),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Perfil(dataUser: widget.dataUser)));
                        },
                        icon: Icon(Icons.person),
                      )),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
