import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'model.dart';

class DatabaseHelper  {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'Phrases.db');
    print("################## ${path}");

    if (await databaseExists(path)) {
      return await openDatabase(path);
    } else {
      ByteData data = await rootBundle.load('assets/Phrases.db');
      print("################## ${data}");
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return await openDatabase(path);
    }
  }

  Future<List<PhrasesCategoryModel>> fetchAllCategories() async {
    final db = await database;

    // Fetch all rows from the 'category' table
    final List<Map<String, dynamic>> maps = await db.query('category');

    // Check if any data was fetched
    if (maps.isNotEmpty) {
      // Map the results to a list of PhrasesCategoryModel
      return List.generate(maps.length, (i) {
        return PhrasesCategoryModel.fromMap(maps[i]);
      });
    } else {
      return []; // Return an empty list if no data is found
    }
  }


//
  Future<List<Phrases>> fetchPhrasesByCategory() async {
    final db = await database;

    // Fetch phrases based on the category_id
    final List<Map<String, dynamic>> maps =
    await db.query('phrase',);
    print("################## Fetched phrases for category");

    if (maps.isNotEmpty) {
      return maps.map((map) => Phrases.fromMap(map)).toList();
    } else {
      return [];
    }
  }



}
