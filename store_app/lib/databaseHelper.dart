import 'dart:async';
import 'dart:developer';
//import 'dart:html';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartItem {
  int id;
  final String itemName;
  final double unitPrice;
  final int quantity;
  final String imagePath;

  CartItem({this.id, this.itemName, this.unitPrice, this.quantity, this.imagePath});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'imagePath': imagePath,
    };
  }

}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  
  static final _dbName = "cart.db";
  static final _dbVersion = 1;

  static final _tableName = "cart";

  static Database _database;
  Future<Database> get database async {
    //log(_database.toString());
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
      "CREATE TABLE ${_tableName}(id INTEGER PRIMARY KEY AUTOINCREMENT, itemName TEXT NOT NULL, unitPrice REAL NOT NULL, quantity INT NOT NULL, imagePath TEXT)",
    );
  }

  Future<int> insertItem(CartItem item) async {
    String path = join(await getDatabasesPath(), _dbName);
    //log(path);
    
    final db = await instance.database;

    /*
    final result = await db.rawQuery('SELECT COUNT(*) FROM ${_tableName}');
    if (result == null) {
      item.id = 0;
    }
    else {
      final count = Sqflite.firstIntValue(result);

      item.id = count;
    }
    */
    

    return await db.insert(
      _tableName, 
      item.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartItem>> getCart() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> cartItems = await db.query(_tableName);

    return List.generate(cartItems.length, (i) {
        return CartItem(
          id: cartItems[i]['id'],
          itemName: cartItems[i]['itemName'],
          unitPrice: cartItems[i]['unitPrice'],
          quantity: cartItems[i]['quantity'],
          imagePath: cartItems[i]['imagePath'],
        );
      }
    );
  }

  Future<void> updateItem(CartItem item) async {
    final db = await instance.database;

    await db.update(
      _tableName, 
      item.toMap(),
      where: "id = ?",
      whereArgs: [item.id],
    );
  }
  
  Future<void> deleteItemByItem(CartItem item) async {
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
