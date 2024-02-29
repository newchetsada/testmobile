import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmobile/controllers/controllers.dart';

class detail extends StatefulWidget {
  @override
  _detailState createState() => _detailState();
  final int id;
  detail({required this.id});
}

class _detailState extends State<detail> {
  var personCon = Get.put(personController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'เลขบัตร : ${personCon.person[widget.id].citizen}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'ชื่อ-นามสกุล : ${personCon.person[widget.id].name}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'เบอร์โทร : ${personCon.person[widget.id].tel}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'ที่อยู่ : ${personCon.person[widget.id].address}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'ตำบล : ${personCon.person[widget.id].tambon}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'อำเภอ : ${personCon.person[widget.id].amphur}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'จังหวัด : ${personCon.person[widget.id].province}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
              Text(
                'รหัสไปรษณีย์ : ${personCon.person[widget.id].postcode}',
                style: TextStyle(color: const Color.fromARGB(255, 88, 88, 88)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
