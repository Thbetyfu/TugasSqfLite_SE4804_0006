import 'package:mobile_test_04/data/dao/barang_dao.dart';
import 'package:mobile_test_04/model/barang.dart';

abstract class BarangRepo {
  Future<int> insert(Barang barang);
  Future<List<Barang>> getAllBarang();
}

class BarangRepoImpl implements BarangRepo {
  final BarangDao dao;

  BarangRepoImpl(this.dao);

  @override
  Future<List<Barang>> getAllBarang() {
    return dao.getAllBarang();
  }

  @override
  Future<int> insert(Barang barang) {
    return dao.insert(barang);
  }
}
