// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'item_widget.dart';
import 'Screens/bottom_sheet.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ItemWidget> items = [
    // ItemWidget('shoes', '33', 'dmy', () {}),
    // itemName: 'shoes  ',
    // amountValue: '34',
    // itemDate: 'dmy',
    // deleteButton: () {},
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Personal Expenses'),
            backgroundColor: Colors.purple,
          ),

//Its because, the showModalBottomSheet tries to access the ancestor of type
// MaterialApp from the given context.
// Use Builder widget to get new context with MaterialApp ancestor or Separate
// your MaterialAapp and Scaffold widgets into separate widgets.
// Using Builder: >>>>>>>
          floatingActionButton: Builder(
            builder: (context) => ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetWidget(
                          (itemName, amountValue, itemDate) {
                        setState(() {
                          items.add(ItemWidget(itemName, amountValue,
                              itemDate.toString(), () {}));
                          //   itemName: itemName,
                          //   amountValue: amountValue,
                          //   itemDate: itemDate.toString(),
                          // ));
                        });
                      });
                    });
              },
              style: ButtonStyle(
                // elevation: ,
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.purple.shade200;
                  }
                  return Colors.purple;
                }),
                shape: MaterialStateProperty.all(const CircleBorder(
                    side: BorderSide(style: BorderStyle.none))),
                fixedSize: MaterialStateProperty.all(const Size.fromRadius(30)),
              ),
            ),
          ),
          body: Container(
            color: Colors.grey,
            child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          topRight: Radius.circular(13))),
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(
                          items[index].itemName,
                          items[index].amountValue,
                          items[index].itemDate,
                          () {
                            setState(() {
                              // items.removeWhere((context) => true);
                              items.removeAt(index);
                            });
                          },
                        );
                      }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
