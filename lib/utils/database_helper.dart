import 'dart:io';

import 'package:db_miner/screen/model/add_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; /*join*/

class Databasehelper {
  static Databasehelper databasehelper = Databasehelper();

  Database? database;
  Database? Quotesdatabase;

  final String Dbpath = "database.db";
  // final String QuotesDbpath = "quotesdatabase.db";

  String datatable = 'datatable';
  String quotestable = 'quotestable';

  String categery = "categery";
  String quotes = "qutoes";

  Future<Database?> checkDb() async {
    if (database != null) {
      return database;
    } else {
      return await intDb();
    }
  }

  Future<Database> intDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, Dbpath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
         await db.execute('CREATE TABLE $datatable(id INTEGER PRIMARY KEY AutoIncrement  ,$categery TEXT)');
         await db.execute('CREATE TABLE $quotestable(id INTEGER PRIMARY KEY AutoIncrement  ,$quotes TEXT,$categery TEXT)');
      },
    );
  }

  Future<void> insertdb({AddModel? model}) async {
    // database=await  instance.da
    database = await checkDb();
    await database!.insert('$datatable', {"categery":model!.categery});
    await database!.insert('$quotestable', {"categery":model.categery,"quotes":model.quotes});
  }
  Future<List> readDb() async {
    database = await checkDb();
    String quary = "SELECT * FROM $datatable";
    String quary1 = "SELECT * FROM $datatable";
    List<Map> l1 = await database!.rawQuery(quary);
    List<Map> l2 = await database!.rawQuery(quary1);
    List l3=[l1,l2];
    return l3;
  }

//
  // Database? database;
  // final String Dbpath = "database.db";
  // String Categorydatatable="Categorydatatable";
  // String Category="Category";
  //
  // Future<Database?> checkDb() async {
  //   if (Database != null) {
  //     return database;
  //   } else {
  //     return await createDb();
  //   }
  // }
  //
  // Future<Database> createDb() async {
  //   Directory dir = await getApplicationDocumentsDirectory();
  //   String path = join(dir.path, Dbpath);
  //
  //   return await openDatabase(
  //     path,
  //     version: 1,
  //     onCreate: (db, version) async {
  //       return await db.execute(
  //         'CREATE TABLE $Categorydatatable(id INTEGER PRIMARY KEY AUTOINCREMENT,$Category TEXT)'
  //       );
  //     },
  //   );
  // }
  //
  //
  // Future<void> insertDb({AddModel? model})
  // async {
  //   database=await checkDb();
  //   await database!.insert('$Categorydatatable', {"$Category":model!.categery});
  // }

  // Future<List<Map>> readDb()
  // async {
  //   database=await checkDb();
  //   String query="SELECT * FROM $Categorydatatable";
  //   List<Map> l1=await database!.rawQuery(query);
  //   return l1;
  //
  // }



}
