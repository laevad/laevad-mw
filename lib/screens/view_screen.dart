import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

class ViewScreen extends StatefulWidget {
  static const route = '/view';
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<Products>(context).fetchProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _refreshProduct(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchProduct();
  }

  condition(context) {
    final productsData = Provider.of<Products>(context, listen: true);
    final product = productsData.items;
    Widget content = Center(child: Text("No Product Added"));

    content = Container(
      child: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: Container(
          child: ListView.builder(
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  tileColor: HexColor('9fe6a0'),
                  title: Wrap(spacing: 15, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${product[product.length - 1 - index].name}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ]),
                  trailing: Container(
                    child: Wrap(
                      spacing: 50,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  '₱${product[product.length - 1 - index].price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  '${product[product.length - 1 - index].quantity}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.control_point,
              size: 30.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 31,
            ),
            onPressed: () {},
          ),
        ],
        title: Text('View Product'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Builder(builder: (BuildContext buildContext) {
                  return condition(context);
                });
              },
            ),
    );
  }
}
