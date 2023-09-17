import 'package:flutter/material.dart';

import 'package:task/screens/homepage.dart';

class CustAppbar extends StatefulWidget {
  //const CustAppbar({Key? key});
  dynamic sortType2;
  CustAppbar({Key? key, required this.sortType2}) : super(key: key);

  @override
  State<CustAppbar> createState() => _CustAppbarState();
}

class _CustAppbarState extends State<CustAppbar> {
  void toggleValue() {
    setState(() {
      widget.sortType2 = (widget.sortType2 == '') ? '?sort=desc' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  toggleValue();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Homescreen2(
                                sortType: widget.sortType2,
                              )));
                },
                child: Container(
                  child: Icon(Icons.sort),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width - 120,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white)),
                    )),
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart_checkout,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
