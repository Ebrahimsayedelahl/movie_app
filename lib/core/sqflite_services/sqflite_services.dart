import 'package:movie_app/features/auth/register/data/userModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String columnId = 'id';
final String columnName = 'username';
final String columnEmail = 'email';
final String columnPassword = 'password';
final String columnPhone = 'phone';
final String columnTable = 'user_table';

class SqfliteServices {
  late Database db;

  static final SqfliteServices instance = SqfliteServices._internal();

  factory SqfliteServices() {
    return instance;
  }

  SqfliteServices._internal();

  Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'user.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE $columnTable (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnPhone TEXT NOT NULL,
            $columnPassword TEXT NOT NULL,
            $columnEmail TEXT NOT NULL
          )
        ''');
      },
    );
  }




  Future<Users> saveData(Users users) async {
    var dbClient = await db;
users.id  = await dbClient.insert(columnTable, users.toMap());
print(users.id);
return users;

  }
  Future<Users?> cheackUser(String userName) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $columnTable WHERE "
        "$columnName = '$userName'");
    if (res.length > 0) {
      return Users.fromMap(res.first);
    }
    return null;
  }











  Future<Users> insertUser(Users users) async {
     users.id = await db.insert(columnTable, users.toMap());
    return users;
  }



  Future<int> deleteUser(int id) async {
    return await db.delete(
      columnTable,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Users>> getAllUsers() async {
    List<Map<String, dynamic>> usersMaps = await db.query(columnTable);
    if (usersMaps.length == 0) {
      return [];
    } else {
      List<Users> users = [];
      for (var element in usersMaps) {
        users.add(Users.fromMap(element));
      }
      return users;
    }
  }

  Future close() async => db.close();
}