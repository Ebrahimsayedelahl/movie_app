import 'package:movie_app/core/sqflite_services/sqflite_services.dart';
class Users {
   int? id ;
   String? userName ;
   String? userEmail ;
   String? userPassword ;
  String? userPhone ;


  Users({
    this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
  });

  Users.fromMap(Map<String, dynamic> map) {
    if (map[id] != null) id = map[columnId];
    userName = map[columnName];
    userPhone= map[columnPhone];
    userEmail = map[columnEmail];
    userPassword = map[columnPassword];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnName] = userName;
    map[columnEmail] = userEmail;
    map[columnPhone] = userPhone;
    map[columnPassword] = userPassword;

    return map;
  }
}