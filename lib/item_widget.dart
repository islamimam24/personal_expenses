// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'const.dart';

class ItemWidget extends StatelessWidget {
  // final String itemName;
  // final String amountValue;
  // final String itemDate;
  // // final Function deleteButton;
  // // ItemWidget(this.deleteButton);

  // ItemWidget({
  //   required this.itemName,
  //   required this.amountValue,
  //   required this.itemDate,
  //   this.deleteButton,
  // });
  final String itemName;
  final String amountValue;
  final String itemDate;
  final Function deleteButton;
  // ItemWidget(this.deleteButton);

  ItemWidget(this.itemName, this.amountValue, this.itemDate, this.deleteButton);
  // ItemWidget(this.itemName, this.amountValue, this.itemDate);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple.shade50,
              ),
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: 60,
                      // color: Colors.purple.shade500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                      child: Center(
                        child: Text(
                          // ignore: unnecessary_brace_in_string_interps
                          '\$' + amountValue,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              itemName,
                              style: kItemNameStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              // itemDate.toString(),
                              itemDate,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 50,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      iconSize: 28.0,
                      color: Colors.red,
                      onPressed: () {
                        deleteButton();
                        // print('object');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
