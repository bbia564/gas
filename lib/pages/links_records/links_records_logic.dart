import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_links/db_links/db_links.dart';
import 'package:three_links/db_links/links_entity.dart';

class LinksRecordsLogic extends GetxController {

  DBLinks dbLinks = Get.find();

  var list = <LinksEntity>[].obs;

  void getData() async {
    list.value = await dbLinks.getLinksAllData();
  }

  cleanLinksData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbLinks.cleanLinksData();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
