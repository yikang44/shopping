import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase{
  static Future<Database> _openDatabase()async {
    final DatabasePath = await getDatabasesPath();
    final path = join(DatabasePath,'My_Database');
    return openDatabase(path,version: 1,onCreate: createDatabase);
  }

  static Future<void> createDatabase(Database db, int version)async {
    await db.execute("""
    CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    gmail TEXT,
    password TEXT )
    """);
  }

  static Future<int> insertDatabase(String name,String gmail,String password)async {
    final db = await _openDatabase();
    final data = {
      'name' : name,
      'gmail' : gmail,
      'password': password 
    };
    return await db.insert('user', data);
  }
  
  static Future<List<Map<String, dynamic>>> getDatabase() async {
    final db = await _openDatabase();
    return db.query('user');
  }

  static Future<int> deleteDatabase(int id) async{
    final db = await _openDatabase();
    return await db.delete('user',where: "id = ?",whereArgs: [id]);
  }
  
  static Future<void> updateDatabase(int id , String name ,String gmail, String password) async{
    final db = await _openDatabase();
    await db.update('user', {'name' : name,'gmail' : gmail, 'password' : password},where: "id = ?",whereArgs: [id]);
  }

}