import 'package:intl/intl.dart';

class LinksEntity {
  int id;
  DateTime createdTime;
  int type;
  String count;
  DateTime updatedTime;
  String amount;

  LinksEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.count,
    required this.updatedTime,
    required this.amount,
  });

  factory LinksEntity.fromJson(Map<String, dynamic> json) {
    return LinksEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      count: json['count'],
      updatedTime: DateTime.parse(json['updatedTime']),
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'count': count,
      'updatedTime': updatedTime.toIso8601String(),
      'amount': amount,
    };
  }

  String get updatedTimeString {
    return DateFormat('yyyy/MM/dd').format(updatedTime);
  }
}