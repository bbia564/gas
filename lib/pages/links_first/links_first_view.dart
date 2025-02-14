import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:three_links/main.dart';

import 'links_first_logic.dart';

class LinksFirstPage extends GetView<LinksFirstLogic> {
  Widget _item(int index) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        Image.asset(
          'assets/icon$index.webp',
          width: 53,
          height: 53,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: <Widget>[
          Text(
            titles[index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subTitles[index],
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          )
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        ))
      ].toRow(),
    )
        .decorated(
            color: Colors.white,
            boxShadow:const [BoxShadow(color: Colors.grey, blurRadius: 5)],
            borderRadius: BorderRadius.circular(15))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      Get.toNamed('/linksAdd', arguments: index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[_item(0), _item(1), _item(2), _item(3), _item(4), _item(5), _item(6)].toColumn(),
        ).marginAll(15)),
      ).decorated(
          gradient: const LinearGradient(
              colors: [Color(0xffc9e6da), Color(0xfff4f4f4)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
