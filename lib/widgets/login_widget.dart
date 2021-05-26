import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '/provider/auth.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authData = Provider.of<Auth>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                  child: Text(
                    'Mobile Inventory',
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor.withOpacity(0.7),
                        Theme.of(context).primaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    hintText: "admin",
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onSubmitted: (value) => authData.login(
                      usernameController.text, passwordController.text),
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.green),
                    ),
                    hintText: "admin123",
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFFB3B1B1)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          HexColor('29bb89')), //Background Color
                      elevation:
                          MaterialStateProperty.all(3), //Defines Elevation
                      shadowColor: MaterialStateProperty.all(
                          Colors.grey), //Defines shadowColor
                    ),
                    onPressed: () => authData.login(
                        usernameController.text, passwordController.text),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
