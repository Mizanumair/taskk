
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'user_database.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database? dbClient = await db;
    return await dbClient!.insert('users', user.toMap());
  }

  Future<User?> getUserByEmail(String email) async {
    Database? dbClient = await db;
    List<Map<String, dynamic>> results = await dbClient!.query('users',
        where: 'email = ?',
        whereArgs: [email],
        limit: 1);
    if (results.isNotEmpty) {
      return User(
        id: results[0]['id'],
        name: results[0]['name'],
        email: results[0]['email'],
        password: results[0]['password'],
      );
    }
    return null;
  }
}
