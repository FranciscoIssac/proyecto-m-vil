import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/admin/gestor.dart';
import 'package:proyecto_hoteles/reservacion.dart';
import 'database_helper.dart';
import 'login.dart';

final userDBHelper = UserTableHelper();
final hotelDBHelper = HotelTableHelper();
final reservacionDBHelper = ReservacionTableHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await userDBHelper.init();
  await hotelDBHelper.init();
  await reservacionDBHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
