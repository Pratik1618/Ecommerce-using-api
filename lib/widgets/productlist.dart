import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/screens/detailpage.dart';
//import 'package:task/screens/detailpage.dart';

import 'dart:convert';
import 'package:task/widgets/constants.dart';

import '../models/productmodel.dart';

class Productlist extends StatefulWidget {
  final String sortType;
  Productlist({Key? key, required this.sortType}) : super(key: key);

  @override
  State<Productlist> createState() => _ProductlistState();
}

class _ProductlistState extends State<Productlist> {
  List<Product> products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    print('https://fakestoreapi.com/products${widget.sortType}');
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products${widget.sortType}'));
    if (response.statusCode == 200) {
      setState(() {
        products = (json.decode(response.body) as List)
            .map((data) => Product.fromJson(data))
            .toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.greenAccent
              ),
              height: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailpage(
                        title: products[index].title,
                        price: products[index].price,
                        category: products[index].category,
                        description: products[index].description,
                        imageUrl: products[index].image!,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      child: products[index].image != null
                          ? Image.network(
                              products[index].image!,
                            )
                          : SizedBox.shrink(),
                      width: MediaQuery.sizeOf(context).width - 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.grey
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            products[index].title,
                            style: titles,
                          ),
                          Spacer(),
                          Text(
                            '\$${products[index].price.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.greenAccent),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
