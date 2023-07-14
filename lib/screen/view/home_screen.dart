import 'package:db_miner/screen/controller/add_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AddQutesController controller=Get.put(AddQutesController());
  @override
  void initState() {
    super.initState();
    controller.getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Amazing Quotes"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Get.toNamed("/add");
          }, icon: Icon(Icons.add_circle_outline)),
        ],
      ),
      body: Obx(() => ListView.builder(itemBuilder: (context, index) {
          return ListTile(
            leading: Text("${controller.dataList[index]['categery']}"),
            // leading: Text("${controller.dataList[index]['$']}"),
          );
        },itemCount: controller.dataList.length,),
      ),
    ),);
  }
}
