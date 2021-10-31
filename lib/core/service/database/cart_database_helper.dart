import 'package:ecommerce/constance.dart';
import 'package:ecommerce/model/cartproductmodel.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct3.db');
    return await openDatabase(path, version: 1, onCreate: (
      Database db,
      int version,
    ) async {
      await db.execute(''' 
      CREATE TABLE $tabelCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnProductid TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL)
      ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<dynamic> maps = await dbClient.query(tabelCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product))
        : [];
      return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      tabelCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updataProduct(CartProductModel model)async{
    var dbClient= await database;
    return await dbClient.update(
        tabelCartProduct, model.toJson(),
        where: '$columnProductid= ?',
        whereArgs: [model.productid]);
  }



}
