import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_04/data/repo/barang_repo.dart';
import 'package:mobile_test_04/model/barang.dart';

class BarangController extends GetxController {
  final BarangRepo repo;
  BarangController(this.repo);

  var barangList = <Barang>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBarang();
  }

  Future<void> getBarang() async {
    try {
      barangList.value = await repo.getAllBarang();
      Get.snackbar("Sukses", "Berhasil");
    } catch (e) {
      Get.snackbar("Error", "Gagal", backgroundColor: Colors.red);
    }
  }

  Future<void> tambahBarang(Barang barang) async {
    try {
      await repo.insert(barang);
      Get.snackbar(
        "Sukses",
        "Barang dengan nama${barang.nama} Berhasil ditambahkan",
      );
    } catch (e) {
      Get.snackbar("Error", "Gagal", backgroundColor: Colors.red);
    }
  }
}