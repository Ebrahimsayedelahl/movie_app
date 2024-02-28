import 'package:flutter/material.dart';
import 'package:movie_app/core/sqflite_services/sqflite_services.dart';
import 'package:movie_app/features/auth/register/data/userModel.dart';

class Home extends StatelessWidget {
  Home({super.key, });
//final int id;

  List<Users> usersList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Users>>(
        future:SqfliteServices.instance.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            usersList = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: usersList.length,
              itemBuilder: (context, index) {
                Users user = usersList[1];
                return Container(
                    child: Text(
                        '${user.userName}'
                    ));
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
