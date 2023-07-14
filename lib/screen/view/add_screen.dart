import 'package:db_miner/screen/controller/add_controller.dart';
import 'package:db_miner/screen/model/add_model.dart';
import 'package:db_miner/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  AddQutesController controller = Get.put(AddQutesController());
  TextEditingController txtquotes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  "Category",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xffd78e44),
                  ),
                  child: DropdownButton(
                    items: controller.categryList
                        .map(
                          (element) => DropdownMenuItem(
                            child: Center(
                              child: Text(
                                "$element",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            value: element,
                          ),
                        )
                        .toList(),
                    value: controller.categry.value,
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (value) {
                      controller.categry.value = value!;
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "Quotes",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: txtquotes,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AddModel model = AddModel(
                      categery: controller.categry.value,
                      quotes: txtquotes.text);
                  Databasehelper.databasehelper.insertdb(model: model);
                  controller.getData();
                  Get.back();
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
