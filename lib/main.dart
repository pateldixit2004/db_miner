import 'package:db_miner/screen/view/add_screen.dart';
import 'package:db_miner/screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(p0) => HomeScreen(),
        "/add":(p0) => AddScreen(),
      },
    )
  );
}