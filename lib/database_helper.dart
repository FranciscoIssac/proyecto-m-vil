import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static Database? _db;

  Future<void> init() async {
    if (_db == null) {
      final path = await _getDatabasePath();
      _db = await openDatabase(
        path,
        version: _databaseVersion,
        onCreate: _onCreate,
      );
    }
  }

  Future<String> _getDatabasePath() async {
    if (kIsWeb) {
      return "/assets/db";
    } else {
      final documentsDirectory = await getApplicationDocumentsDirectory();
      return join(documentsDirectory.path, _databaseName);
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        user TEXT NOT NULL,
        mail TEXT NOT NULL,
        tel TEXT NOT NULL,
        pass TEXT NOT NULL,
        img TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE hotel_table (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        rating REAL NOT NULL,
        location TEXT NOT NULL,
        telephone TEXT NOT NULL,
        availavilityS INTEGER NOT NULL,
        availavilityD INTEGER NOT NULL,
        priceS REAL NOT NULL,
        priceD REAL NOT NULL,
        img TEXT NOT NULL
      )
    ''');
  }

  Database get database => _db!;
}

class UserTableHelper extends DatabaseHelper {
  static const _tableName = 'user';
  static const columnId = '_id';
  static const columnUser = 'user';
  static const columnName = 'name';
  static const columnMail = 'mail';
  static const columnTel = 'tel';
  static const columnPass = 'pass';
  static const columnImg = 'img';

  // Métodos de ayuda

  Future<int> insert(Map<String, dynamic> row) async {
    return await database.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await database.query(_tableName);
  }

  Future<int> queryRowCount() async {
    final results = await database.rawQuery('SELECT COUNT(*) FROM $_tableName');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await database.update(
      _tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    return await database.delete(
      _tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

class HotelTableHelper extends DatabaseHelper {
  static const _tableName = 'hotel_table';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnDescription = 'description';
  static const columnRating = 'rating';
  static const columnLocation = 'location';
  static const columnTelephone = 'telephone';
  static const columnAvailabilityS = 'availavilityS';
  static const columnAvailabilityD = 'availavilityD';
  static const columnPriceS = 'priceS';
  static const columnPriceD = 'priceD';
  static const columnImg = 'img';

  // Métodos de ayuda

  Future<int> insert(Map<String, dynamic> row) async {
    return await database.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await database.query(_tableName);
  }

  Future<int> queryRowCount() async {
    final results = await database.rawQuery('SELECT COUNT(*) FROM $_tableName');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await database.update(
      _tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    return await database.delete(
      _tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
