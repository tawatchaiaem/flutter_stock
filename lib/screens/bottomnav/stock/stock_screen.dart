import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/services/rest_api.dart';
import 'package:flutter_stock_v3/models/Product.dart';

class StockScreen extends StatefulWidget {
  StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  // CallAPI Service
  CallAPI? callAPI;

  // สร้าง Context
  // BuildContext context;

  @override
  void initState() {
    super.initState();
    callAPI = CallAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Product List'),
        actions: <Widget>[
          InkWell(
              onTap: () {
                //  print('top on add button');
                Navigator.pushNamed(context, '/addproduct');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 16),
                child: Icon(Icons.add),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: callAPI.getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child:
                    Text('Something wrong with ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Product> products = snapshot.data;
              return _buildListView(products);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // ListView builder
  Widget _buildListView(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Load Model
          Product product = products[index];
          return Card(
            child: InkWell(
              onTap: () {
                print('tab on card view');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Image.network(product.productImage),
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.productName,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(product.productBarcode,
                                style: TextStyle(fontSize: 18)),
                            Text("THB " + product.productPrice,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              print('Tab on edit button');
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.blue),
                            )),
                        FlatButton(
                            onPressed: () {
                              print('Tab on delete button');
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
