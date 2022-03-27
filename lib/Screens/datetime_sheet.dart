// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable, override_on_non_overriding_member
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_expenses/const.dart';
import 'package:intl/intl.dart';

class CupertinoButtonWidget extends StatefulWidget {
  Function(DateTime) dateFunction;
  CupertinoButtonWidget(this.dateFunction);
  late DateTime dateString = DateTime.now();
  // CupertinoButtonWidget(this.dateFunction);

  @override
  State<CupertinoButtonWidget> createState() => _CupertinoButtonWidgetState();
}

class _CupertinoButtonWidgetState extends State<CupertinoButtonWidget> {
  @override
  void ShowDate() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime selectedDateTime) {
                setState(() {
                  widget.dateString = selectedDateTime;
                  widget.dateFunction(selectedDateTime);
                  // widget.date = widget.dateFunction(selectedDateTime);
                });
                // Navigator.pop(context);
              },
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              backgroundColor: Colors.white,
            ),
          );
        });
  }

  // String textWidget() {
  //   // ignore: unnecessary_null_comparison
  //   if (widget.dateString == null) {
  //     var date = widget.dateString;
  //     date = DateTime.now();

  //     return DateFormat.yMEd().format(date);
  //   } else {
  //     return DateFormat('yyyy-MM-dd').format(widget.dateString);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          // DateFormat.format(widget.dateString),
          DateFormat.yMEd().format(widget.dateString).toString(),
          // widget.dateString.toString(),
          style: kDateTime,
        ),
      ),
      CupertinoButton(
        child: Text('Choose Date'),
        onPressed: () {
          ShowDate();
        },
      ),
    ]);
  }
}

// class ShowDateTimeSheet extends StatefulWidget {
//   final DateTime date;
//   ShowDateTimeSheet({required this.date});

//   @override
//   State<ShowDateTimeSheet> createState() => _ShowDateTimeSheetState();
// }

// class _ShowDateTimeSheetState extends State<ShowDateTimeSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: CupertinoDatePicker(
//         mode: CupertinoDatePickerMode.date,
//         onDateTimeChanged: (value) {
//           setState(() {
//             value = widget.date;
//           });
//         },
//         initialDateTime: DateTime.now(),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }
