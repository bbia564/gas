import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:three_links/main.dart';

import '../feedback/links_text_field.dart';
import 'links_add_logic.dart';

class LinksAddPage extends GetView<LinksAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[controller.type]),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<LinksAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                child: <Widget>[
                  Image.asset(
                    'assets/icon${controller.type}.webp',
                    width: 53,
                    height: 53,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'Tabular: ',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: LinksTextField(
                        isNumber: true,
                        maxLength: 8,
                        hintText: 'Input list number',
                        value: controller.count,
                        onChange: (v) {
                          controller.count = v;
                        },
                      ))
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  Container(
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'Record date: ',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: IgnorePointer(
                        child: LinksTextField(
                          hintText: 'Select date',
                          value: controller.updateTimeStr,
                          onChange: (_) {},
                        ),
                      )),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  ).decorated(color: Colors.transparent).gestures(onTap: () {
                    controller.timeSelect(context);
                  }),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      const Text(
                        'Payment Amount: ',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: LinksTextField(
                        isNumber: true,
                        maxLength: 8,
                        hintText: 'Input amount',
                        value: controller.amount,
                        onChange: (v) {
                          controller.amount = v;
                        },
                      ))
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Records',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8))
                      .gestures(onTap: () {
                    controller.commit();
                  })
                ].toColumn(),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(15))
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
