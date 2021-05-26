import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../screens/add_screen.dart';
import '../screens/view_screen.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ViewScreen.route);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  HexColor('29bb89'),
                ), //Background Color
                elevation: MaterialStateProperty.all(3), //Defines Elevation
                shadowColor: MaterialStateProperty.all(
                    Colors.grey), //Defines shadowColor
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              child: Text(
                'View Product',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddScreen.route);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  HexColor('29bb89'),
                ), //Background Color
                elevation: MaterialStateProperty.all(3), //Defines Elevation
                shadowColor: MaterialStateProperty.all(Colors.grey),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ), //Defines shadowColor
              ),
              child: Text(
                'Add Product',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    HexColor('29bb89')), //Background Color
                elevation: MaterialStateProperty.all(3), //Defines Elevation
                shadowColor: MaterialStateProperty.all(Colors.grey),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ), //Defines shadowColor
              ),
              child: Text(
                'Update Product',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
