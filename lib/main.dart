import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/sqflite_services/sqflite_services.dart';
import 'package:movie_app/features/auth/login/presentation/view/login_screen.dart';
import 'package:movie_app/features/auth/register/presentation/view/register_screen.dart';
import 'package:movie_app/features/home/presentation/view/home_screen.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SqfliteServices.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
      );


  }
}
















