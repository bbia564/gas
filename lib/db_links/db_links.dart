import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'links_entity.dart';

class DBLinks extends GetxService {
  late Database dbBase;

  Future<DBLinks> init() async {
    await createLinksDB();
    return this;
  }

  createLinksDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'links.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createLinksTable(db);
        });
  }

  createLinksTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS links (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, count TEXT, updatedTime TEXT, amount TEXT)');
  }

  insertLinks(LinksEntity entity) async {
    final id = await dbBase.insert('links', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'count': entity.count,
      'updatedTime': entity.updatedTime.toIso8601String(),
      'amount': entity.amount,
    });
    return id;
  }

  cleanLinksData() async {
    await dbBase.delete('links');
  }

  Future<List<LinksEntity>> getLinksAllData() async {
    var result = await dbBase.query('links', orderBy: 'createdTime DESC');
    return result.map((e) => LinksEntity.fromJson(e)).toList();
  }
}
