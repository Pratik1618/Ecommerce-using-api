import 'package:flutter/material.dart';
import 'package:task/widgets/appbar.dart';
import 'package:task/widgets/productlist.dart';

class Homescreen2 extends StatefulWidget {
  final String sortType;
  Homescreen2({Key? key, required this.sortType}) : super(key: key);

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              CustAppbar(sortType2: widget.sortType),
              SizedBox(
                height: 10,
              ),
              Productlist(sortType: widget.sortType)
            ],
          ),
        ),
      ),
    );
  }
}
