import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:three_links/db_links/db_links.dart';

import '../../db_links/links_entity.dart';

class LinksAddLogic extends GetxController {

  DBLinks dbLinks = Get.find();

  int type = Get.arguments;

  String count = '';
  DateTime? updateTime;
  String updateTimeStr = '';
  String amount = '';

  void timeSelect(BuildContext context) {
    DatePicker.showDatePicker(context,dateFormat: 'yyyy/MM/dd',onConfirm: (date,list) {
      updateTime = date;
      updateTimeStr = DateFormat('yyyy/MM/dd').format(date);
      update();
    });
  }

  void commit() async {
    if (count.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input count');
      return;
    }
    if (updateTime == null) {
      Fluttertoast.showToast(msg: 'Please select time');
      return;
    }
    if (amount.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input amount');
      return;
    }
    num countNum = num.parse(count);
    num amountNum = num.parse(amount);
    if (countNum <= 0) {
      Fluttertoast.showToast(msg: 'Count must be greater than 0');
      return;
    }
    if (amountNum <= 0) {
      Fluttertoast.showToast(msg: 'Amount must be greater than 0');
      return;
    }
    count = countNum.toString();
    amount = amountNum.toString();
    update();
    await dbLinks.insertLinks(LinksEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: type,
      count: count,
      updatedTime: updateTime!,
      amount: amount,
    ));
    Fluttertoast.showToast(msg: 'Commit success');
    Get.back();

  }

}
