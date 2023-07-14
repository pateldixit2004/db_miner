import 'package:db_miner/utils/database_helper.dart';
import 'package:get/get.dart';

class AddQutesController extends GetxController
{
  RxString categry="Love".obs;
  RxList<String> categryList=[
    "Motivational","Love","Swami vivekananda","Ratan tata",
  ].obs;


  RxList dataList=[].obs;
  Future<void> getData()
  async {
    dataList.value=await Databasehelper.databasehelper.readDb();
  }


}