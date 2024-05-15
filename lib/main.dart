import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/admin/gestor.dart';
import 'package:proyecto_hoteles/reservacion.dart';

import 'database_helper.dart';
import 'login.dart';

final userDBHelper = UserTableHelper();
final hotelDBHelper = HotelTableHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userDBHelper.init();
  await hotelDBHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
