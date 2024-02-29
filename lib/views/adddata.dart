import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testmobile/controllers/controllers.dart';

class adddata extends StatefulWidget {
  @override
  _adddataState createState() => _adddataState();
}

class _adddataState extends State<adddata> {
  int _index = 0;
  var personCon = Get.put(personController());
  String? dropdownValue;
  var name = TextEditingController();
  var citizen = TextEditingController();
  var tel = TextEditingController();
  var address = TextEditingController();
  var tambon = TextEditingController();
  var amphur = TextEditingController();
  var post = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มข้อมูล'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
      ),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          } else {
            Navigator.pop(context);
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          } else {
            personCon.addPerson(name.text, citizen.text, tel.text, address.text,
                tambon.text, amphur.text, dropdownValue, post.text);
            Navigator.pop(context);
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
              title: const Text('ข้อมูลส่วนตัว'),
              content: Column(
                children: [
                  TextField(
                    controller: citizen,
                    decoration: InputDecoration(label: Text('เลขบัตร')),
                  ),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(label: Text('ชื่อ-นามสกุล')),
                  ),
                  TextField(
                    controller: tel,
                    decoration: InputDecoration(label: Text('เบอร์โทร')),
                  ),
                ],
              )),
          Step(
              title: Text('ข้อมูลที่อยู่'),
              content: Column(
                children: [
                  TextField(
                    controller: address,
                    decoration: InputDecoration(label: Text('ที่อยู่')),
                  ),
                  TextField(
                    controller: tambon,
                    decoration: InputDecoration(label: Text('ตำบล')),
                  ),
                  TextField(
                    controller: amphur,
                    decoration: InputDecoration(label: Text('อำเภอ')),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => DropdownButton(
                        isExpanded: true,
                        hint: Text("เลือกจังหวัด"),
                        icon: Icon(Icons.arrow_drop_down),
                        elevation: 1,
                        items: personCon.province.map((item) {
                          return DropdownMenuItem(
                            child: Text(item.name_th),
                            value: item.name_th.toString(),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            dropdownValue = newVal;
                          });
                        },
                        value: dropdownValue,
                      )),
                  TextField(
                    controller: post,
                    decoration: InputDecoration(label: Text('รหัสไปรษณีย์')),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
