import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color inicial
                  cons.blanco,
                  cons.colorPrincipal, // Color final
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.15, bottom: size.height * 0.02),
                    child: Container(
                      height: 150,
                      child: Image.asset('imagenes/logo.png'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.04),
                      child: Column(
                        children: [
                          Text("Iniciar sesión",
                              style: TextStyle(
                                color: Color(0xFF1E1F22),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: size.height * 0.03),
                          TextFormField(
                            //controller: user,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: cons.blanco,
                              labelText: "Usuario",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            //controller: pass,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 1,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: cons.blanco,
                              labelText: "Contraseña",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              prefixIcon: Icon(Icons.lock),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  const Home()));
                              /*if (user.text.isNotEmpty &&
                                pass.text.isNotEmpty &&
                                tel.text.isNotEmpty) {
                              await authenticateUser(); // Llama a authenticateUser de forma asíncrona
                            } else {
                              setState(() {
                                bandera = true;
                              });
                            }*/
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: cons.gris,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fixedSize: Size(size.width * 0.6, 25)),
                            child: const Text(
                              'Ingresar',
                              style: TextStyle(color: cons.blanco, fontSize: 20),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          GestureDetector(
                            onTap: () {
                              /*Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                const Registro(null)));*/
                            },
                            child: Text(
                              'Registrarse',
                              style: TextStyle(
                                  color: cons.blanco,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}



/*
child: Stack(
children: [
Positioned(
top: 40,
left: 15,
child: Row(
children: [
Container(
height: 35,
width: 137,
color: cons.blanco,
alignment: AlignmentDirectional.topStart,
),
Padding(
padding: EdgeInsets.only(left: 108),
child: Container(
height: 35,
width: 137,
color: cons.blanco,
alignment: AlignmentDirectional.topEnd,
),
)
],
)),
Container(
height: size.height * 0.8,
child: Padding(
padding: EdgeInsets.all(15),
child: Container(
width: double.infinity,
height: double.infinity,
child: Column(
children: [
Row(
children: [
Expanded(
child: Container(
alignment: AlignmentDirectional.topStart,
child: ElevatedButton(
onPressed: () {},
child: Text("Más visitados"),
),
),
),
Expanded(
child: Container(
alignment: AlignmentDirectional.topEnd,
child: ElevatedButton(
onPressed: () {},
child: Text("Más visitados"),
),
),
)
],
),
Padding(
padding: EdgeInsets.only(top: 10),
child: Container(
width: double.infinity,
height: double.infinity,
color: cons.blanco,
child: Text(
"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
),
)
],
),
),
),
),
],
),
*/