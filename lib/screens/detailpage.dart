import 'package:flutter/material.dart';
import 'package:task/widgets/appbar.dart';
import 'package:task/widgets/constants.dart';

class detailpage extends StatelessWidget {
  final String title;
  final double price;
  final String category;
  final String imageUrl;
  final String description;
  // final Float rating;

  detailpage({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
    // required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: Image.network(imageUrl),
              // color: Colors.grey,
              height: MediaQuery.sizeOf(context).height * 0.30,
              width: MediaQuery.sizeOf(context).width * 0.90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('category: $category'),
                  Text(
                    title,
                    style: titles,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Price: \$$price'),
                      // Text(rating.toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(description),
                    ],
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    height: MediaQuery.sizeOf(context).height * 0.10,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart),
                        Text('Add to Cart')
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
