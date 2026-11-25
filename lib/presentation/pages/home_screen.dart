import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_test_04/presentation/controller/barang_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<BarangController>();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(
        children: [
          Text("LIST BARANG"),

          Expanded(
            child: Obx(() {
              if (ctr.barangList.isEmpty) {
                return Center(child: Text("Data Belum Ada"));
              }

              return ListView.builder(
                itemCount: ctr.barangList.length,
                itemBuilder: (context, index) {
                  final barang = ctr.barangList[index];
                  return Card(
                    child: ListTile(
                      title: Text(barang.nama),
                      subtitle: Text("Stok Barang ${barang.stok}"),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}