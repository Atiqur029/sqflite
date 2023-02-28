import 'dart:async';
import 'dart:io';

import 'package:croud/model/contact.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  DbHelper._private();

  static final DbHelper instence=DbHelper._private();


  static Database? _database;


  Future<Database?> get db async{

    if(_database!=null){
      return _database;
    }

    _database=await initDatabase();
    return _database;
  }
  
  Future<Database>initDatabase() async {
     Directory directory=await getApplicationDocumentsDirectory();

     String path=join(directory.path,"todo.db");
     var opendata=await openDatabase(path,version: 1,onCreate: _onCreate);
     return opendata;

  }



  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''

      CREATE TABLE contact(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        number TEXT ,
        image TEXT,
        price TEXT
      )
      '''


    );


  }

  Future<int> insertData({ required Contact contact}) async{

    Database?database=await db;
    return database!.insert("contact", contact.toMap());
    

  }
  

  Future <List<Contact>?> getData() async{
     Database?database=await db;

     var data=await database!.query("contact",orderBy: "id");
     

     List<Contact> contactlist=data.map((e) => Contact.fromMap(e)).toList();
     return contactlist;
     


  }
  Future<int> delete(int id) async{
    Database?database=await db;
    var data=database!.delete("contact",where: "id=?",whereArgs: [id] );
    return data;


  }

  Future<int> update(Contact contact) async{
     Database?database=await db;
     var data=database!.update("contact", contact.toMap(),where: "id=?",whereArgs: [contact.id]);
     return data;


  }
}