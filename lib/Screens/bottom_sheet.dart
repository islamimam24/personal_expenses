// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:personal_expenses/const.dart';
import 'package:personal_expenses/Screens/datetime_sheet.dart';
import 'package:intl/intl.dart';

class BottomSheetWidget extends StatelessWidget {
  final Function onPressedCallback;
  BottomSheetWidget(this.onPressedCallback);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var itemName;
    // ignore: prefer_typing_uninitialized_variables
    var amountValue;
    // ignore: prefer_typing_uninitialized_variables
    late String itemDate = DateFormat.yMEd().format(DateTime.now()).toString();
    return Container(
      height: 370,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          )),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Add Item',
              style: kItemNameStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                itemName = value;
                // print(itemName);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'enter the item name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                amountValue = value;
                // print(amountValue);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Amount'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CupertinoButtonWidget(
              (dateString) {
                // if (itemDate == null) {
                // itemDate = DateTime.now();
                // } else {
                itemDate = DateFormat.yMEd().format(dateString).toString();

                // }
              },

              //   dateString: itemDate,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              // elevation: ,
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.purple.shade200;
                }
                return Colors.purple;
              }),
            ),
            child: Text('Add'),
            onPressed: () {
              if (itemName != null && amountValue != null) {
                onPressedCallback(itemName, amountValue, itemDate);
                Navigator.pop(context);
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Invalid input..'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      );
                    });
              }
            },
          )
        ],
      ),
    );
  }
}
