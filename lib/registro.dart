import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/database_helper.dart';
import 'package:proyecto_hoteles/home.dart';

import 'main.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final user = TextEditingController();
  final pass = TextEditingController();
  final passConfirm = TextEditingController();
  final name = TextEditingController();
  final mail = TextEditingController();
  final tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool validarFormatoTelefono(String telefono) {
      // Expresión regular para validar un número de teléfono con formato internacional
      RegExp regex = RegExp(r'^\+(?:[0-9] ?){5,14}[0-9]$');

      // Verificar si el número de teléfono coincide con el patrón
      if (regex.hasMatch(telefono)) {
        return true; // El número de teléfono es válido
      } else {
        return false; // El número de teléfono no es válido
      }
    }

    bool validarFormatoCorreo(String email) {
      // Expresión regular para validar el formato del correo electrónico
      final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      // Verifica si el correo electrónico coincide con el formato esperado
      return emailRegex.hasMatch(email);
    }


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
                  SizedBox(height: size.height * 0.07),
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
                          Text("Registrate",
                              style: TextStyle(
                                color: Color(0xFF1E1F22),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: user,
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
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: name,
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
                              labelText: "Nombre",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: mail,
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
                              labelText: "Correo",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: tel,
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
                              labelText: "Teléfono",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: pass,
                            obscureText: true,
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
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          TextFormField(
                            controller: passConfirm,
                            obscureText: true,
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
                              labelText: "Confirmar contraseña",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          ElevatedButton(
                            onPressed: () async {
                              if (user.text.isEmpty ||
                                  pass.text.isEmpty ||
                                  passConfirm.text.isEmpty ||
                                  name.text.isEmpty ||
                                  mail.text.isEmpty ||
                                  tel.text.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          "Todos los campos son obligatorios"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (pass.text != passConfirm.text) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          "Las contraseñas deben coincidir"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (!validarFormatoTelefono(tel.text)) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          "El formato del número de teléfono no es válido\n- Debe emepzar con '+'\n- Debe tener entre 6 y 14 dígitos numéricos\n- Debe terminar con un dígito numérico"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (!validarFormatoCorreo(mail.text)) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text(
                                          "El formato del correo electrónico no es válido"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Map<String, dynamic> row = {
                                  UserTableHelper.columnUser: user.text,
                                  UserTableHelper.columnPass: pass.text,
                                  UserTableHelper.columnName: name.text,
                                  UserTableHelper.columnTel: tel.text,
                                  UserTableHelper.columnMail: mail.text,
                                };
                                final id = await userDBHelper.insert(row);
                                debugPrint('inserted row id: $id');

                                final allRows =
                                    await userDBHelper.queryAllRows();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Home()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: cons.gris,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                fixedSize: Size(size.width * 0.6, 25)),
                            child: const Text(
                              'Registrar',
                              style:
                                  TextStyle(color: cons.blanco, fontSize: 20),
                            ),
                          ),
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
