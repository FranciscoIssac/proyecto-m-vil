import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  late Database _db;

  Future<void> init() async {
    final path = await _getDatabasePath();
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<String> _getDatabasePath() async {
    if (kIsWeb) {
      return "/assets/db";
    } else {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      return join(documentsDirectory.path, _databaseName);
    }
  }

  Future<void> _onCreate(Database db, int version);
}

class UserTableHelper extends DatabaseHelper {
  static const _tableName = 'user';
  static const _columnId = '_id';
  static const columnUser = 'user';
  static const columnName = 'name';
  static const columnMail = 'mail';
  static const columnTel = 'tel';
  static const columnPass = 'pass';

  @override
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnUser TEXT NOT NULL,
        $columnMail TEXT NOT NULL,
        $columnTel TEXT NOT NULL,
        $columnPass TEXT NOT NULL
      )
    ''');
  }

  // Métodos de ayuda

  // Inserta una fila en la base de datos donde cada clave en el Mapa es un nombre de columna
  // y el valor es el valor de la columna. El valor devuelto es el id de la fila insertada.
  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(_tableName, row);
  }

  // Retorna todas las filas como una lista de mapas, donde cada mapa es una lista de clave-valor de columnas.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(_tableName);
  }

  // Retorna la cantidad de filas en la tabla
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $_tableName');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // Actualiza la fila especificada por el id. El número de filas afectadas se devuelve.
  // Esto debería ser 1 siempre y cuando la fila exista.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[_columnId];
    return await _db.update(
      _tableName,
      row,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  // Elimina la fila especificada por el id. El número de filas afectadas se devuelve.
  // Esto debería ser 1 siempre y cuando la fila exista.
  Future<int> delete(int id) async {
    return await _db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }
}

class HotelTableHelper extends DatabaseHelper {
  static const _tableName = 'hotel_table';
  static const _columnId = '_id';
  static const _columnName = 'name';
  static const _columnDescription = 'description';

  @override
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_columnName TEXT NOT NULL,
        $_columnDescription TEXT NOT NULL
      )
    ''');
  }

  // Métodos de ayuda

  // Inserta una fila en la base de datos donde cada clave en el Mapa es un nombre de columna
  // y el valor es el valor de la columna. El valor devuelto es el id de la fila insertada.
  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(_tableName, row);
  }

  // Retorna todas las filas como una lista de mapas, donde cada mapa es una lista de clave-valor de columnas.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(_tableName);
  }

  // Retorna la cantidad de filas en la tabla
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $_tableName');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // Actualiza la fila especificada por el id. El número de filas afectadas se devuelve.
  // Esto debería ser 1 siempre y cuando la fila exista.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[_columnId];
    return await _db.update(
      _tableName,
      row,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  // Elimina la fila especificada por el id. El número de filas afectadas se devuelve.
  // Esto debería ser 1 siempre y cuando la fila exista.
  Future<int> delete(int id) async {
    return await _db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }
}
