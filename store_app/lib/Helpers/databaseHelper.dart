import 'dart:async';
import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'itemModel.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() => instance;
  
  static final _dbName = "cart.db";
  static final _dbVersion = 1;
  static final _tableName = "cart";

  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDb();
    return _database;
  }

  createDb() async {
    String path = join(await getDatabasesPath(), _dbName);
    log("creating DB");

    return await openDatabase(path,
      version: _dbVersion,
      onCreate: onDbCreate
    );
  }

  Future onDbCreate(Database db, int version) async {
    return db.execute(
      "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, itemName TEXT NOT NULL, unitPrice REAL NOT NULL, quantity INT NOT NULL, description TEXT, genre TEXT, isUsed TEXT, isVerified TEXT, imagePath TEXT)",
    );
  }

  Future<int> insertItem(Item item) async {
    String path = join(await getDatabasesPath(), _dbName);
    final db = await instance.database;

    return await db.insert(
      _tableName, 
      item.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> getCartItems() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> items = await db.query(_tableName);

    return List.generate(items.length, (i) {
        return Item(
          id: items[i]['id'],
          itemName: items[i]['itemName'],
          unitPrice: items[i]['unitPrice'],
          quantity: items[i]['quantity'],
          description: items[i]['description'],
          genre: items[i]['genre'],
          isUsed: false,
          isVerified: true,
          imagePath: items[i]['imagePath'],
        );
      }
    );
  }

  Future<void> updateItem(Item item) async {
    final db = await instance.database;
    await db.update(
      _tableName, 
      item.toMap(),
      where: "id = ?",
      whereArgs: [item.id],
    );
  }
  
  Future<void> deleteItemByItem(Item item) async {
    final db = await instance.database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [item.id],
    );
  }

  Future<void> deleteItemById(int id) async {
    final db = await instance.database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
  
}
