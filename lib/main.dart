import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_food_app/provider/product_provider.dart';
import 'package:my_food_app/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'Auth/sign_in.dart';
import 'Network/InternetBinding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InternetBinding(),
        title: 'Flutter Demo',
        //color: Color(0xffcbcbcb),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffcbcbcb),
          primarySwatch: Colors.blue,
        ),
        home:   HomeScreen( ),
      ),
    );
  }
}


