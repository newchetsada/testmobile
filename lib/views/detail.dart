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
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ข้อมูลส่วนตัว',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 65, 65, 65)),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(
                          'เลขบัตร : ${personCon.person[widget.id].citizen}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 65, 65, 65)),
                        ),
                        Text(
                          'ชื่อ-นามสกุล : ${personCon.person[widget.id].name}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                        Text(
                          'เบอร์โทร : ${personCon.person[widget.id].tel}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ที่อยู่',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 65, 65, 65)),
                            ),
                          ],
                        ),
                        Divider(),
                        Text(
                          'ที่อยู่ : ${personCon.person[widget.id].address}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                        Text(
                          'ตำบล : ${personCon.person[widget.id].tambon}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                        Text(
                          'อำเภอ : ${personCon.person[widget.id].amphur}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                        Text(
                          'จังหวัด : ${personCon.person[widget.id].province}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                        Text(
                          'รหัสไปรษณีย์ : ${personCon.person[widget.id].postcode}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 88, 88, 88)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
