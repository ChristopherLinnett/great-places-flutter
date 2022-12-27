import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places1.db'),
        onCreate: (db, version) => db.execute(
            'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, latitude FLOAT, longitude FLOAT, address TEXT, image TEXT)'),
        version: 1);
  }

  static Future<void> insert(
      {required String collection, required Map<String, Object> data}) async {
    final db = await DBHelper.database();
    db.insert(collection, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, Object?>>> getData(String collection) async {
    final db = await DBHelper.database();
    return db.query(collection);
  }
}
