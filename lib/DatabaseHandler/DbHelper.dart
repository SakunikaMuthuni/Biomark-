import 'package:biomark/Comm/comHelper.dart';
import 'package:biomark/Model/UserProfileModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import 'package:biomark/Model/UserModel.dart';

class DbHelper{
  static Database? _db;

  static const DB_Name = 'biomarkLocalDatabse.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String User_Id = 'user_id';
  static const String User_Email = 'user_email';
  static const String User_Password = 'user_password';
  static const String User_FullName = 'user_fullname';
  static const String User_DOB = 'user_dob';
  static const String User_ChildhoodPetName = 'user_childhoodpetname';
  static const String User_MotherMaidenName = 'user_mothermaidenname';
  static const String User_TOB = 'user_tob';
  static const String User_LOB = 'user_lob';
  static const String User_BloodGroup = 'user_bloodgroup';
  static const String User_Gender = 'user_gender';
  static const String User_Height = 'user_height';
  static const String User_Ethnicity = 'user_ethnicity';
  static const String User_EyeColour = 'user_eyecolour';
  static const String User_OwnQuestion = 'user_ownquestion';
  static const String User_AnswerForOwnQuestion = 'user_answerforownquestion';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDb();
    return _db!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    print("Database opened successfully");
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
        "$User_EyeColour TEXT, "
        "$User_OwnQuestion TEXT, "
        "$User_AnswerForOwnQuestion TEXT"
        ");");
  }

  Future<int> saveData(UserModel user) async{
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<bool> emailExists(String email) async {
    final db = await this.db;
    var result = await db.query(
      Table_User,
      columns: [User_Email],
      where: '$User_Email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<UserModel?> getLoginUser(String user_email, String user_password) async{
    var dbClient = await db;
    var res = await dbClient.rawQuery(
      "SELECT * FROM $Table_User WHERE $User_Email = ? AND $User_Password = ?",
      [user_email, user_password],);

    if(res.isNotEmpty){
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> saveProfileData(UserProfileModel user) async {
    var dbClient = await db;

    bool exists = await emailExists(user.user_email ?? '');

    if (exists) {
      var res = await dbClient.update(
        Table_User,
        user.toMap(),
        where: 'user_email = ?',
        whereArgs: [user.user_email ?? ''],
      );
      return res;
    } else {
      alertDialog("Error: User Not Found");
      return 0;
    }
  }

  Future<UserProfileModel> getUserProfile(String email) async {
    print(email);
    var dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query(
      Table_User,
      where: 'user_email = ?',
      whereArgs: [email],
    );

    print(maps.first['user_fullname']);
    print(maps.first['user_ethnicity']);
    print(maps.first['user_eyecolour']);
    print(maps.first['user_mothermaidenname']);

    if (maps.isNotEmpty) {
      return UserProfileModel.fromMap(maps.first);
    } else {
      throw Exception('User profile not found for email: $email');
    }

  }

}