import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // hive setup

 await Hive.initFlutter();

 var box = await Hive.openBox('box');


  runApp(const MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: HomePage(),
       //theme: ThemeData(primarySwatch: Colors.grey,//brightness: Brightness.light,
         theme: ThemeData(
           primaryTextTheme: Typography(platform: TargetPlatform.android).white,
           primaryColor: Color.fromRGBO(37, 39, 50, 1),
           brightness: Brightness.dark,
           textTheme: Typography(platform: TargetPlatform.android).white
         )
     );
   }
 }





