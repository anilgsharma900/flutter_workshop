import 'package:sqflite/sqflite.dart';

/// Created by Anil Sharma on 13/02/23.
class AppStoreSqflite {
  static AppStoreSqflite getInstance = AppStoreSqflite._();
  static Database? db;
  static String weatherTable = "Weather";

  AppStoreSqflite._() {
    openDB();
  }

  static openDB() async {
    db ??= await openDatabase('fl_db.db', version: 1, onCreate: (Database db, int version) async {
      await db
          .execute('CREATE TABLE IF NOT EXISTS $weatherTable (id INTEGER PRIMARY KEY, name TEXT)');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) {});
  }

  static closeDB() async {
    await db!.close();
  }

  static deleteWeather() async {
    await db!.delete(weatherTable);
  }

  static insertWeather(String cityName) async {
    await db!.insert("$weatherTable", {"id": 1, "name": cityName});
  }

  static Future<List<Map<String, dynamic>>> getWeather() async {
    List<Map<String, dynamic>> weatherData = await db!.rawQuery("SELECT * FROM $weatherTable");
    return weatherData;
  }
}
