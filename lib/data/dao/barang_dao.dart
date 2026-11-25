import 'package:mobile_test_04/data/database/db_helper.dart';
import 'package:mobile_test_04/model/barang.dart';

class BarangDao {
  final DbHelper _dbHelper;

  BarangDao(this._dbHelper);

  static const _nameTable = DbHelper.tabelName;

  Future<int> insert(Barang barang) async {
    final db = await _dbHelper.database;
    return db.insert(_nameTable, barang.toMap());
  }

  Future<List<Barang>> getAllBarang() async {
    final db = await _dbHelper.database;
    final getData = await db.query(_nameTable, orderBy: 'id DESC');
    return getData.map(Barang.fromMap).toList();
  }
}