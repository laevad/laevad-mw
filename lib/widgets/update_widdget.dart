import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../screens/edit_screen.dart';
import '../provider/products.dart';
import 'package:provider/provider.dart';

class UpdateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (ctx, productData, child) => ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              tileColor: HexColor('9fe6a0'),
              leading: Container(
                child: Wrap(spacing: 12, children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 27,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          "₱${productData.items[index].price}",
                          style: TextStyle(
                              color: Colors.grey[50],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              title: Container(
                height: 30,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        '${productData.items[index].name}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: Wrap(
                spacing: 12,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 28,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(EditScreen.route,
                          arguments: productData.items[index].id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_forever,
                      size: 28,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () async {
                      try {
                        await Provider.of<Products>(context, listen: false)
                            .deleteProduct(productData.items[index].id);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Deleting failed!",
                            textAlign: TextAlign.center,
                          ),
                        ));
                        throw error;
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: productData.items.length,
      ),
    );
  }
}
