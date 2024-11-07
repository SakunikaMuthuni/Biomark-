import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper{
  static late Database _db;

  static const DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String User_Id = 'user_id';
  static const String User_Email = 'user_email';
  static const String User_Password = 'user_password';
  static const String User_FullName = 'user_fullname';
  static const String User_DOB = 'user_dob';
  static const String User_ChildhoodPetName = 'user_childhoodpetname';
  static const String User_MotherMaidenName = 'user_mothermadienname';
  static const String User_TOB = 'user_tob';
  static const String User_LOB = 'user_lob';
  static const String User_BloodGroup = 'user_bloodgroup';
  static const String User_Gender = 'user_gender';
  static const String User_Height = 'user_height';
  static const String User_Ethnicity = 'user_ethnicity';
  static const String User_EyeColour = 'user_eyecolour';

  Future<Database> get db async {
    if(_db!=null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db,int intVersion) async{
    await db.execute("CREATE TABLE $Table_User("
        "$User_Id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$User_Email TEXT,"
        "$User_Password TEXT,"
        "$User_FullName TEXT,"
        "$User_DOB TEXT,"
        "$User_ChildhoodPetName TEXT,"
        "$User_MotherMaidenName TEXT,"
        "$User_TOB TEXT,"
        "$User_LOB TEXT,"
        "$User_BloodGroup TEXT,"
        "$User_Gender TEXT,"
        "$User_Height REAL,"
        "$User_Ethnicity TEXT,"
        "$User_EyeColour TEXT"
        ")");
  }
}

