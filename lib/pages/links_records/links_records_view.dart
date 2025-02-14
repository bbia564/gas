import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'links_records_logic.dart';

class LinksRecordsPage extends GetView<LinksRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full record'),
        backgroundColor: Colors.white,
        actions: [
          const Text('Clean').marginOnly(right: 20).gestures(onTap: () {
            controller.cleanLinksData();
          })
        ],
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          return controller.list.value.isEmpty
              ? const Center(
                  child: Text('No data'),
                )
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return <Widget>[
                      <Widget>[
                        Image.asset(
                          'assets/icon${entity.type}.webp',
                          width: 53,
                          height: 53,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: <Widget>[
                          <Widget>[
                            Visibility(
                              visible: entity.type == 0,
                              child: const Text(
                                "Tabular:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 1,
                              child: const Text(
                                "Tabular:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 2,
                              child: const Text(
                                "Tabular:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 3,
                              child: const Text(
                                "Balance:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 4,
                              child: const Text(
                                "Standard:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 5,
                              child: const Text(
                                "Balance:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Visibility(
                              visible: entity.type == 6,
                              child: const Text(
                                "Custom:",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            // const Text(
                            //   'Tabular',
                            //   style: TextStyle(color: Colors.grey),
                            // ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              entity.count,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ].toRow(),
                          <Widget>[
                            const Text(
                              'Amount',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              entity.amount,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ].toRow()
                        ].toColumn(
                                crossAxisAlignment: CrossAxisAlignment.start)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          entity.updatedTimeString,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ].toRow(),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      )
                    ].toColumn();
                  });
        }),
      )
              .decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
