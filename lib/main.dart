import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'provider/auth.dart';
import 'package:provider/provider.dart';
import 'provider/products.dart';
import 'screens/login_screen.dart';
import 'screens/homepage_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building_laevad");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Auth()),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // 29bb89 , 4aa96c , 289672, 9fe6a0
              primaryColor: HexColor('29bb89'),
              accentColor: Colors.greenAccent,
              textTheme: TextTheme(
                headline6: TextStyle(
                  fontSize: 25.0,
                ),
                bodyText2: TextStyle(fontSize: 20.0),
              ),
            ),
            home: authData.loginGranted ? HomepageScreen() : LoginScreen(),
          );
        },
      ),
    );
  }
}
